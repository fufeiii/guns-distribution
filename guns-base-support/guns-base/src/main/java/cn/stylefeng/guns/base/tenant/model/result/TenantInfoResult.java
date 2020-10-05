package cn.stylefeng.guns.base.tenant.model.result;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 租户表
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-16
 */
@Data
public class TenantInfoResult implements Serializable {

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
     * 关联的数据库名称
     */
    private String dbName;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private Long createUser;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private Long updateUser;

}
