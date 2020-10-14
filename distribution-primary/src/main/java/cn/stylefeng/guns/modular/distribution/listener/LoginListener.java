package cn.stylefeng.guns.modular.distribution.listener;

import cn.stylefeng.guns.base.auth.model.LoginUser;
import cn.stylefeng.guns.modular.distribution.entity.DistPlatform;
import cn.stylefeng.guns.modular.distribution.service.DistPlatformService;
import cn.stylefeng.guns.sys.core.auth.event.LoginEvent;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * 租户登录事件监听器
 * 处理用户登录后分销系统特殊的业务逻辑
 *
 * @author Fu Fei
 * @date 2020/10/14
 */
@Component
public class LoginListener {

    @Autowired
    private DistPlatformService distPlatformService;

    @EventListener
    public void handle(LoginEvent loginEvent) {
        // 执行交易分润机制
        DistPlatform distPlatform = new DistPlatform();
        LoginUser loginUser = loginEvent.getLoginUser();
        distPlatform.setPlatformUsername(loginUser.getAccount());
        DistPlatform pl = distPlatformService.getOne(new QueryWrapper<>(distPlatform));
        loginUser.setWebhook(pl.getWebhook());
    }

}
