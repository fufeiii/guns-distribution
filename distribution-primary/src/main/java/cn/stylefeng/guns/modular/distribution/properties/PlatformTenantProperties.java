package cn.stylefeng.guns.modular.distribution.properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 平台创建租户时的相关配置类
 * 这些是guns创建用户所需的数据
 *
 * @author Fu Fei
 * @date 2020/9/10
 */
@Getter
@Setter
@ConfigurationProperties(prefix = "dist.default-tenant")
@Component
public class PlatformTenantProperties {

    /**
     * 默认租户登录平台初始账号的的密码
     */
    private String password;

    /**
     * 默认租户登录平台初始账号的的部门
     */
    private String dept;

    /**
     * 默认租户登录平台初始账号的的职位
     */
    private String position;

    /**
     * 默认租户登录平台初始账号的的角色
     */
    private String role;

}
