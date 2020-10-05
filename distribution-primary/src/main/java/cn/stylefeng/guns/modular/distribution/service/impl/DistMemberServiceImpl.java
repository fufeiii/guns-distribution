package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.consts.ConstantsContext;
import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.api.response.MemberTeam;
import cn.stylefeng.guns.modular.distribution.entity.DistAccount;
import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.entity.DistRankParam;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitLevelEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.event.InviteMemberEvent;
import cn.stylefeng.guns.modular.distribution.event.RankUpgradeEvent;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistMemberMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountVO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountService;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.guns.modular.distribution.service.DistRankParamService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.guns.modular.distribution.util.FunctionalUtil;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 会员 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
@Slf4j
public class DistMemberServiceImpl extends ServiceImpl<DistMemberMapper, DistMember> implements DistMemberService {
    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;
    @Autowired
    private DistAccountService accountService;
    @Autowired
    private DistRankParamService rankParamService;


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(DistMemberDTO param) {
        int memCount = baseMapper.exists(param.getMemberUsername());

        AssertHelper.isTrue(memCount == 0, DistributionException.BizEnum.MEMBER_EXIST);

        // 创建新的会员对象
        DistMember memberEntity = this.getEntity(param);

        // 查看是否是被邀请加入的
        boolean isInviteJoin = ToolUtil.isNotEmpty(param.getFirParent());

        // 将空字符串变为null
        FunctionalUtil.consumerIf(!isInviteJoin, param, p -> p.setFirParent(null));

        if (isInviteJoin) {
            // 查询父级会员
            DistMember parentMember = this.findByMemberUsername(param.getFirParent());
            AssertHelper.notNull(parentMember, DistributionException.BizEnum.MEMBER_PARENT_NOT_EXIST);
            this.setParentInfo(parentMember, memberEntity);
            // 赋值给memberParam是为了在邀请策略中能够获取父级路径。从而快速分润。
            param.setParentPath(memberEntity.getParentPath());
            // 异步执行需要租户身份
            param.setPlatformUsername(TenantHelper.getTenant());
            // 发布邀请事件 在本事件提交后异步运行
            applicationEventPublisher.publishEvent(new InviteMemberEvent(this, param));
        }

        // 保存会员信息并设置相应默认值
        FunctionalUtil.consumerIf(memberEntity.getMemberType() == null, memberEntity, m -> m.setMemberType(MemberTypeEnum.GENERAL));
        FunctionalUtil.consumerIf(memberEntity.getMemberRank() == null, memberEntity, m -> m.setMemberRank(MemberRankEnum.BRONZE));
        FunctionalUtil.consumerIf(memberEntity.getState() == null, memberEntity, m -> m.setState(StateEnum.ENABLE));
        memberEntity.setVersion(1);
        // 保存会员信息
        this.save(memberEntity);

        // 新增会员账户信息
        DistAccount account = new DistAccount();
        BigDecimal zeroMoney = BigDecimal.ZERO;
        int zeroIntegral = 0;
        account.setMemberId(memberEntity.getId())
                .setMoneyTotal(zeroMoney)
                .setMoneyAvailable(zeroMoney)
                .setMoneyFrozen(zeroMoney)
                .setIntegralTotalHistory(zeroIntegral)
                .setIntegralTotal(zeroIntegral)
                .setIntegralAvailable(zeroIntegral)
                .setIntegralFrozen(zeroIntegral)
                .setState(StateEnum.ENABLE)
                .setVersion(1);
        accountService.save(account);
    }

    /**
     * 为新增会员设置父级路径参数
     * 默认记录的层级为，{@link ProfitLevelEnum}的枚举个数
     *
     * @param parent 父级会员
     * @param child  新增会员
     */
    private void setParentInfo(DistMember parent, DistMember child) {
        // 最长记录层级
        Integer length = ConstantsContext.getDistParentPathLength();
        // 获取父级的父级路径，并对其进行改造
        String parentPath = parent.getParentPath();

        if (ToolUtil.isNotEmpty(parentPath)) {
            List<String> ids = Arrays.asList(parentPath.split("\\."));
            // 如果pathArr已经超过了最长的层级记录标准，则需要去除最后的父级。
            // 例如此时 [id1, id2, id3]
            if (ids.size() >= length) {
                // 距离最远的父级id   需要去除 id3  subList左闭右开
                ids = ids.subList(0, ids.size() - 1);
                StringBuilder stringBuilder = new StringBuilder();
                for (String id : ids) {
                    stringBuilder.append(id).append(".");
                }
                // 去掉最后一个 . 并转换成string
                parentPath = stringBuilder.deleteCharAt(stringBuilder.length() - 1).toString();
            }
            // 设置 二 三 级父级。能进入这个分支，一定有二级父级
            child.setSecParent(ids.get(0));
            if (ids.size() == 2) {
                // 成立则有三级父级
                child.setThrParent(ids.get(1));
            }
            parentPath = parent.getMemberUsername() + "." + parentPath;
        } else {
            parentPath = parent.getMemberUsername();
        }

        child.setParentPath(parentPath);
    }

    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(DistMemberDTO param) {
        DistMember oldEntity = this.getOldEntity(param);
        DistMember newEntity = this.getEntity(param);
        ToolUtil.copyProperties(newEntity, oldEntity);
        AssertHelper.retryOnFailure(this.updateById(oldEntity));
    }

    @Transactional(readOnly = true)
    @Override
    public DistMember findByAttribute(String column, String value) {
        return baseMapper.selectByAttribute(column, value);
    }

    @Transactional(readOnly = true)
    @Override
    public boolean exists(String memberUsername) {
        return baseMapper.exists(memberUsername) > 0;
    }

    @Transactional(readOnly = true)
    @Override
    public DistMember findByMemberUsername(String memberUsername) {
        return baseMapper.selectByAttribute("member_username", memberUsername);
    }

    @Transactional(readOnly = true)
    @Override
    public DistMemberVO findBySpec(DistMemberDTO param) {
        DistMember distMember = baseMapper.selectById(getKey(param));
        return this.getEntityVO(distMember);
    }

    private DistMemberVO getEntityVO(DistMember entity) {
        DistMemberVO vo = new DistMemberVO();
        ToolUtil.copyProperties(entity, vo);
        return vo;
    }

    @Transactional(readOnly = true)
    @Override
    public List<DistMemberVO> findListBySpec(DistMemberDTO param) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findPageBySpec(DistMemberDTO param) {
        Page<DistMemberVO> pageContext = this.getPageContext();
        IPage<DistMemberVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    /**
     * 当前会员账户
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public DistAccountVO account(Long memberId) {
        DistAccount account = accountService.getById(memberId);
        DistAccountVO vo = new DistAccountVO();
        ToolUtil.copyProperties(account, vo);
        return vo;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void upgradeMemberRankIf(Long memberId) {

        DistAccount account = accountService.getById(memberId);
        Integer integralTotalHistory = account.getIntegralTotalHistory();
        // 查询当前历史积分所在的段位区间
        // WHERE state = 0 AND begin_integral <= integralTotalHistory AND integralTotalHistory <= end_integral
        QueryWrapper<DistRankParam> queryWrapper = new QueryWrapper<DistRankParam>()
                .eq("state", StateEnum.ENABLE.getCode())
                .le("begin_integral", integralTotalHistory)
                .ge("end_integral", integralTotalHistory);
        DistRankParam rankParam = rankParamService.getOne(queryWrapper);


        // 存在对应的升级参数，则发布分润事件
        DistMember member = baseMapper.selectById(memberId);
        if (Objects.isNull(rankParam) || member.getMemberRank().equals(rankParam.getMemberRank())) {
            // 没有匹配到升级参数或者升级参数没有发生变化，则不升级
            return;
        }

        DistMemberDTO dto = new DistMemberDTO();
        ToolUtil.copyProperties(member, dto);
        log.debug("------------> 发布会员升级事件, member=[{}]", member);
        applicationEventPublisher.publishEvent(new RankUpgradeEvent(this, dto));

        // 对会员的段位进行升级
        member.setMemberRank(rankParam.getMemberRank());
        baseMapper.updateById(member);

    }

    @Transactional(readOnly = true)
    @Override
    public MemberTeam team(String parent) {
        MemberTeam team = new MemberTeam();
        team.setFirst(baseMapper.team(parent, 1));
        team.setSecond(baseMapper.team(parent, 2));
        team.setThree(baseMapper.team(parent, 3));
        return team;
    }

    @Transactional(readOnly = true)
    @Override
    public int countBetweenDate(Date begin, Date end) {
        QueryWrapper<DistMember> queryWrapper = new QueryWrapper<DistMember>()
                .between("create_time", begin, end);
        return this.count(queryWrapper);
    }

    @Transactional(readOnly = true)
    @Override
    public List<DistMemberVO> memberTop4Web(Integer top) {
        // 这里只获得了最多的会员的username和数量
        List<DistMemberVO> distMemberVOs = baseMapper.memberTop(top);

        if (distMemberVOs.isEmpty()) {
            return distMemberVOs;
        }

        // 查询相关会员的详情
        List<DistMemberVO> memberList = baseMapper.selectMemberList(distMemberVOs.stream().map(DistMemberVO::getFirParent).collect(Collectors.toList()));
        for (DistMemberVO out : distMemberVOs) {
            for (DistMemberVO in : memberList) {
                if (out.getFirParent().equals(in.getMemberUsername())) {
                    // 同一人
                    in.setInviteNum(out.getInviteNum());
                }
            }
        }
        // 按照邀请人数降序
        return memberList.stream().sorted(Comparator.comparingInt(DistMemberVO::getInviteNum).reversed()).collect(Collectors.toList());
    }

    private Serializable getKey(DistMemberDTO param) {
        return param.getId();
    }

    private Page<DistMemberVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private DistMember getOldEntity(DistMemberDTO param) {
        return this.getById(getKey(param));
    }

    private DistMember getEntity(DistMemberDTO param) {
        DistMember entity = new DistMember();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
