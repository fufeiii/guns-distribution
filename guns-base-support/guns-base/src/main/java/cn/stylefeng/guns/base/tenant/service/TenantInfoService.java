package cn.stylefeng.guns.base.tenant.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.base.tenant.entity.TenantInfo;
import cn.stylefeng.guns.base.tenant.model.params.TenantInfoParam;
import cn.stylefeng.guns.base.tenant.model.result.TenantInfoResult;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 租户表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-16
 */
public interface TenantInfoService extends IService<TenantInfo> {

    /**
     * 新增
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    void add(TenantInfoParam param);

    /**
     * 删除
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    void delete(TenantInfoParam param);

    /**
     * 更新
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    void update(TenantInfoParam param);

    /**
     * 查询单条数据，Specification模式
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    TenantInfoResult findBySpec(TenantInfoParam param);

    /**
     * 查询列表，Specification模式
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    List<TenantInfoResult> findListBySpec(TenantInfoParam param);

    /**
     * 查询分页数据，Specification模式
     *
     * @author stylefeng
     * @Date 2019-06-16
     */
    LayuiPageInfo findPageBySpec(TenantInfoParam param);

    /**
     * 获取租户信息，通过code
     *
     * @author fengshuonan
     * @Date 2019-06-19 14:17
     */
    TenantInfo getByCode(String code);

}
