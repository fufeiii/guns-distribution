package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.entity.DistRankParam;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistRankParamMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistRankParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistRankParamVO;
import cn.stylefeng.guns.modular.distribution.service.DistRankParamService;
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

/**
 * <p>
 * 段位配置 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistRankParamServiceImpl extends ServiceImpl<DistRankParamMapper, DistRankParam> implements DistRankParamService {

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(DistRankParamDTO param) {
        this.bizValidate(param);
        // todo 升级参数的积分区间问题
        int count = this.count(new QueryWrapper<>(new DistRankParam().setMemberRank(param.getMemberRank())));
        AssertHelper.isTrue(count == 0, DistributionException.BizEnum.RANK_PARAM_EXIST);
        DistRankParam entity = this.getEntity(param);
        entity.setVersion(1);
        this.save(entity);
    }

    /**
     * 新增业务的参数校验
     */
    private void bizValidate(DistRankParamDTO param) {
        // 结束积分必须大于开始积分
        AssertHelper.isTrue(param.getEndIntegral() > param.getBeginIntegral(), DistributionException.BizEnum.RANK_PARAM_ILLEGAL);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(DistRankParamDTO param) {
        this.removeById(this.getKey(param));
    }

    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(DistRankParamDTO param) {
        this.bizValidate(param);
        DistRankParam oldEntity = this.getOldEntity(param);
        DistRankParam newEntity = this.getEntity(param);
        ToolUtil.copyProperties(newEntity, oldEntity);
        AssertHelper.retryOnFailure(this.updateById(oldEntity));
    }

    @Override
    public DistRankParamVO findBySpec(DistRankParamDTO param) {
        DistRankParam distRankParam = baseMapper.selectById(this.getKey(param));
        DistRankParamVO vo = new DistRankParamVO();
        ToolUtil.copyProperties(distRankParam, vo);
        return vo;
    }

    @Override
    public List<DistRankParamVO> findListBySpec(DistRankParamDTO param) {
        return null;
    }

    @Override
    public LayuiPageInfo findPageBySpec(DistRankParamDTO param) {
        Page<DistRankParamVO> pageContext = this.getPageContext();
        IPage<DistRankParamVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    private Serializable getKey(DistRankParamDTO param) {
        return param.getId();
    }

    private Page<DistRankParamVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private DistRankParam getOldEntity(DistRankParamDTO param) {
        return this.getById(this.getKey(param));
    }

    private DistRankParam getEntity(DistRankParamDTO param) {
        DistRankParam entity = new DistRankParam();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
