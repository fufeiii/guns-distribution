package cn.stylefeng.guns.modular.distribution.util;

import cn.stylefeng.guns.base.auth.context.LoginContextHolder;
import org.springframework.util.Assert;
import org.springframework.web.socket.WebSocketSession;

import java.security.Principal;
import java.util.Objects;

/**
 * 租户帮助类
 * 因为项目中使用到异处理，这时需要为mybatis-plus会获取租户标识
 * 由此类提供获取租户，设置租户的功能
 *
 * @author Fu Fei
 * @date 2020/9/9
 */
public class TenantHelper {

    private TenantHelper() {
    }

    //====================================== 基于线程的租户获取/设置======================================

    public static String getTenant() {
        return LoginContextHolder.getContext().getTenantAccount();
    }

    public static String getTenantWebhook() {
        return LoginContextHolder.getContext().getWebhook();
    }

    public static void setTenant(String tenant) {
        LoginContextHolder.getContext().setTenantAccount(tenant);
    }

    public static void removeTenant() {
        LoginContextHolder.getContext().removeTenantAccount();
    }

    //====================================== 基于websocket的租户获取/设置======================================

    public static String getTenant(WebSocketSession currentSession) {
        // 因为使用的spring封装过的socket,请求经过了JwtAuthorizationTokenFilter
        // 所以session的user的字段为c.s.g.b.a.model.LoginUser
        if (Objects.isNull(currentSession)) {
            return null;
        }
        Principal principal = currentSession.getPrincipal();
        if (Objects.isNull(principal)) {
            return null;
        }
        return principal.getName();
    }

    public static void setTenant(Principal principal) {
        Assert.notNull(principal, "principal 不能为空");
        LoginContextHolder.getContext().setTenantAccount(principal.getName());
    }


}
