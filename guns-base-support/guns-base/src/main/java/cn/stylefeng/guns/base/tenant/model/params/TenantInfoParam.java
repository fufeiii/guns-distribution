package cn.stylefeng.guns.base.tenant.model.params;

import cn.stylefeng.roses.kernel.model.validator.BaseValidatingParam;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 租户表
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-16
 */
@Data
public class TenantInfoParam implements Serializable, BaseValidatingParam {

    private static final long serialVersionUID = 1L;


    /**
     * 主键id
     */
    private Long tenantId;

    /**
     * 租户名称
     */
    private String name;

    /**
     * 租户的编码
     */
    private String code;

    /**
     * 租户管理员账号
     */
    private String adminUsername;

    /**
     * 租户管理员密码
     */
    private String adminPassword;

    @Override
    public String checkParam() {
        return null;
    }

}
