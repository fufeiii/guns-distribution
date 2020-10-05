package cn.stylefeng.guns.config.socket;

import cn.stylefeng.guns.modular.distribution.socket.ProfitEventWsHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * 使用spring体系的WebSocket支持
 *
 * @author Fu Fei
 * @date 2020/8/16
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Autowired
    private ProfitEventWsHandler profitEventWsHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(profitEventWsHandler, "/ws/pe");
    }


}
