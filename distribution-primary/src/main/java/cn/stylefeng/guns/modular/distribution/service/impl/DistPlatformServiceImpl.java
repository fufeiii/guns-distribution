package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.entity.DistPlatform;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistPlatformMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistPlatformDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistPlatformVO;
import cn.stylefeng.guns.modular.distribution.properties.PlatformTenantProperties;
import cn.stylefeng.guns.modular.distribution.service.DistPlatformService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.guns.sys.modular.system.model.UserDto;
import cn.stylefeng.guns.sys.modular.system.service.UserService;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 平台 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistPlatformServiceImpl extends ServiceImpl<DistPlatformMapper, DistPlatform> implements DistPlatformService {

    @Autowired
    private PlatformTenantProperties platformTenantProperties;

    @Autowired
    private UserService userService;


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(DistPlatformDTO param) {
        int plaCount = baseMapper.exists(param.getPlatformUsername());
        AssertHelper.isTrue(plaCount == 0, DistributionException.BizEnum.PLATFORM_EXIST);
        DistPlatform entity = this.getEntity(param);
        // 创建该平台的系统用户
        Long sysId = this.createSystemUser(param);
        entity.setSysId(sysId).setVersion(1);
        this.save(entity);
    }

    /**
     * 为平台商添加系统账户
     *
     * @param platform 平台商
     * @return 系统账号id
     */
    private Long createSystemUser(DistPlatformDTO platform) {
        UserDto sysUser = new UserDto();
        sysUser.setAccount(platform.getPlatformUsername());
        sysUser.setName(platform.getPlatformNickname());
        sysUser.setPassword(platformTenantProperties.getPassword());
        sysUser.setDeptId(Long.parseLong(platformTenantProperties.getDept()));
        sysUser.setPosition(platformTenantProperties.getPosition());
        sysUser.setRoleId(platformTenantProperties.getRole());
        return userService.addUser(sysUser);
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(DistPlatformDTO param) {
        DistPlatform entity = this.baseMapper.selectById(getKey(param));
        userService.deleteUser(entity.getSysId());
        this.removeById(getKey(param));
    }

    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(DistPlatformDTO param) {
        DistPlatform oldEntity = this.getOldEntity(param);
        DistPlatform newEntity = this.getEntity(param);
        ToolUtil.copyProperties(newEntity, oldEntity);
        AssertHelper.retryOnFailure(this.updateById(oldEntity));
    }

    @Override
    public DistPlatformVO findBySpec(DistPlatformDTO param) {
        DistPlatform distPlatform = baseMapper.selectById(getKey(param));
        return this.getEntityVO(distPlatform);
    }

    private DistPlatformVO getEntityVO(DistPlatform entity) {
        DistPlatformVO vo = new DistPlatformVO();
        ToolUtil.copyProperties(entity, vo);
        return vo;
    }


    @Override
    public LayuiPageInfo findPageBySpec(DistPlatformDTO param) {
        Page<DistPlatformVO> pageContext = this.getPageContext();
        IPage<DistPlatformVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    private Serializable getKey(DistPlatformDTO param) {
        return param.getId();
    }

    private Page<DistPlatformVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private DistPlatform getOldEntity(DistPlatformDTO param) {
        return this.getById(this.getKey(param));
    }

    private DistPlatform getEntity(DistPlatformDTO param) {
        DistPlatform entity = new DistPlatform();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
