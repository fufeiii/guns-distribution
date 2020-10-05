package cn.stylefeng.guns.modular.distribution.socket;

import cn.stylefeng.guns.modular.distribution.service.DistProfitEventService;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.Objects;

/**
 * 分润事件websocket
 *
 * @author Fu Fei
 * @date 2020/8/17
 */
@Component
@Slf4j
public class ProfitEventWsHandler extends BaseWsHandler implements WebSocketHandler {

    @Autowired
    private DistProfitEventService profitEventService;


    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 每次请求创建连接都是一个新的session，所以如果当前租户存在旧的session就关闭
        WebSocketSession oldSession = this.getCurrentTenantSession(session);
        if (Objects.nonNull(oldSession)) {
            // remove oldSession
            this.removeCurrentTenantSession(oldSession);
        }
        this.putCurrentTenantSession(session);
        // 必须设置！！！不然获使用MP多租户会报错 此处的principal就是UsernamePasswordAuthenticationToken
        TenantHelper.setTenant(session.getPrincipal());
        this.sendMessage(session, this.profitEventService.findLatestList());
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        // 处理客户端的消息
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        this.removeCurrentTenantSession(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }


}
