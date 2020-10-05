package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.entity.DistAccount;
import cn.stylefeng.guns.modular.distribution.mapper.DistAccountMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountVO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * <p>
 * 会员账户 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistAccountServiceImpl extends ServiceImpl<DistAccountMapper, DistAccount> implements DistAccountService {

    /**
     * 更新
     */
    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(DistAccountDTO param) {
        DistAccount oldEntity = this.getOldEntity(param);
        DistAccount newEntity = this.getEntity(param);
        ToolUtil.copyProperties(newEntity, oldEntity);
        AssertHelper.retryOnFailure(this.updateById(oldEntity));
    }

    @Override
    public DistAccountVO findBySpec(DistAccountDTO param) {
        return null;
    }


    @Override
    public LayuiPageInfo findPageBySpec(DistAccountDTO param) {
        Page<DistAccountVO> pageContext = this.getPageContext();
        IPage<DistAccountVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    private Page<DistAccountVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private Serializable getKey(DistAccountDTO param) {
        return param.getMemberId();
    }

    private DistAccount getOldEntity(DistAccountDTO param) {
        return this.getById(this.getKey(param));
    }

    private DistAccount getEntity(DistAccountDTO param) {
        DistAccount entity = new DistAccount();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
