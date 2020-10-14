package cn.stylefeng.guns.sys.core.auth.event;

import cn.stylefeng.guns.base.auth.model.LoginUser;
import org.springframework.context.ApplicationEvent;

/**
 * 用户登事件
 * 便于通过分销系统处理自己的登录逻辑
 *
 * @author Fu Fei
 * @date 2020/10/14
 */
public class LoginEvent extends ApplicationEvent {

    private static final long serialVersionUID = 1438647704320528782L;

    /**
     * 租户
     */
    private final LoginUser loginUser;

    public LoginEvent(Object source, LoginUser loginUser) {
        super(source);
        this.loginUser = loginUser;
    }

    public LoginUser getLoginUser() {
        return loginUser;
    }

}
