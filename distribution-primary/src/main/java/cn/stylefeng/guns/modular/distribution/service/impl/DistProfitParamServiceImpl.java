package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitParam;
import cn.stylefeng.guns.modular.distribution.enums.biz.CalculateModeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistProfitParamMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitParamVO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitParamService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 分润参数 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistProfitParamServiceImpl extends ServiceImpl<DistProfitParamMapper, DistProfitParam> implements DistProfitParamService {


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(DistProfitParamDTO param) {
        // 验证是否存在相同级别的分润参数
        DistProfitParam query = new DistProfitParam()
                .setAccountType(param.getAccountType())
                .setProfitType(param.getProfitType())
                .setProfitLevel(param.getProfitLevel())
                .setMemberType(param.getMemberType())
                .setMemberRank(param.getMemberRank());
        DistProfitParam one = baseMapper.selectOne(new QueryWrapper<>(query));
        AssertHelper.isTrue(Objects.isNull(one), DistributionException.BizEnum.PROFIT_PARAM_EXIST);


        // 计算模式 [百分比] 仅支持 分润类型为 [商品交易] 的场景
        boolean notLegal = CalculateModeEnum.PERCENTAGE.equals(param.getCalculateMode()) && !ProfitTypeEnum.TRADE.equals(param.getProfitType());
        AssertHelper.isTrue(notLegal, DistributionException.BizEnum.PROFIT_PARAM_ILLEGAL);

        // 没有相同的存在则添加对应参数
        DistProfitParam entity = this.getEntity(param);
        entity.setVersion(1);
        this.save(entity);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(DistProfitParamDTO param) {
        this.removeById(this.getKey(param));
    }

    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(DistProfitParamDTO param) {
        DistProfitParam oldEntity = this.getOldEntity(param);
        DistProfitParam newEntity = this.getEntity(param);
        ToolUtil.copyProperties(newEntity, oldEntity);
        AssertHelper.retryOnFailure(this.updateById(oldEntity));
    }

    @Transactional(readOnly = true)
    @Override
    public DistProfitParamVO findBySpec(DistProfitParamDTO param) {
        DistProfitParam distProfitParam = baseMapper.selectById(getKey(param));
        DistProfitParamVO vo = new DistProfitParamVO();
        ToolUtil.copyProperties(distProfitParam, vo);
        return vo;
    }

    @Transactional(readOnly = true)
    @Override
    public List<DistProfitParamVO> findListBySpec(DistProfitParamDTO param) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findPageBySpec(DistProfitParamDTO param) {
        Page<DistProfitParamVO> pageContext = this.getPageContext();
        IPage<DistProfitParamVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    private Serializable getKey(DistProfitParamDTO param) {
        return param.getId();
    }

    private Page<DistProfitParamVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private DistProfitParam getOldEntity(DistProfitParamDTO param) {
        return this.getById(this.getKey(param));
    }

    private DistProfitParam getEntity(DistProfitParamDTO param) {
        DistProfitParam entity = new DistProfitParam();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
