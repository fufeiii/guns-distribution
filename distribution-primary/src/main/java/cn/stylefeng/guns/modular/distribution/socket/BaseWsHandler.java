package cn.stylefeng.guns.modular.distribution.socket;

import cn.hutool.core.date.DatePattern;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Assert;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 理论上websocket建立链接时是不带cookie的
 * 但实际测试电脑上的浏览器时支持携带cookie，并经过了{@link cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter}
 * 猜测由于建立链接时使用的还是HTTP协议所以能够经过filter进行了身份验证
 * 建立链接后，将不会经过filter，却能得到从session中获得user字段，原因未知。
 * 又因为使用了MP的多租户，所以需要在发送消息前将租户信息放入SecurityContextHolder
 *
 * @author Fu Fei
 * @date 2020/8/18
 */
@Slf4j
public class BaseWsHandler {

    protected final Map<String, WebSocketSession> tenantSession = new ConcurrentHashMap<>(64);

    protected WebSocketSession getCurrentTenantSession(WebSocketSession currentSession) {
        return tenantSession.get(TenantHelper.getTenant(currentSession));
    }

    protected WebSocketSession getCurrentTenantSession(String tenant) {
        return tenantSession.get(tenant);
    }

    protected void removeCurrentTenantSession(WebSocketSession currentSession) throws IOException {
        if (Objects.nonNull(currentSession) && currentSession.isOpen()) {
            currentSession.close();
        }
        tenantSession.remove(TenantHelper.getTenant(currentSession));
    }

    protected void putCurrentTenantSession(WebSocketSession currentSession) {
        tenantSession.put(TenantHelper.getTenant(currentSession), currentSession);
    }

    protected void sendMessage(WebSocketSession currentTenantSession, Object data) throws IOException {
        this.sendMessage(TenantHelper.getTenant(currentTenantSession), data);
    }

    public void sendMessage(String tenant, Object data) throws IOException {
        WebSocketSession session = this.getCurrentTenantSession(tenant);
        Assert.state(Objects.nonNull(session), "当前WebSocketSession不能为空");
        session.sendMessage(new TextMessage(JSON.toJSONStringWithDateFormat(data, DatePattern.NORM_DATETIME_PATTERN, SerializerFeature.WriteDateUseDateFormat)));
    }

}
