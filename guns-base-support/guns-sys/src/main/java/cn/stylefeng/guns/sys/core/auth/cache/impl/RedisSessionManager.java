package cn.stylefeng.guns.sys.core.auth.cache.impl;

import cn.stylefeng.guns.base.auth.model.LoginUser;
import cn.stylefeng.guns.sys.core.auth.cache.SessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 基于redis的会话管理
 *
 * @author FuFei
 */
@Component
public class RedisSessionManager implements SessionManager {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public void createSession(String token, LoginUser loginUser) {
        redisTemplate.opsForValue().set(SESSION_PREFIX + token, loginUser, 24, TimeUnit.HOURS);
    }

    @Override
    public void createApiSession(String username, LoginUser loginUser, long timeout) {
        redisTemplate.opsForValue().set(API_SESSION_PREFIX + username, loginUser, timeout, TimeUnit.SECONDS);
    }

    @Override
    public LoginUser getSession(String token) {
        return (LoginUser) redisTemplate.opsForValue().get(SESSION_PREFIX + token);
    }

    @Override
    public LoginUser getApiSession(String username) {
        return (LoginUser) redisTemplate.opsForValue().get(API_SESSION_PREFIX + username);
    }

    @Override
    public void removeSession(String token) {
        redisTemplate.delete(SESSION_PREFIX + token);
    }

    @Override
    public void removeApiSession(String username) {
        redisTemplate.delete(SESSION_PREFIX + username);
    }

    @Override
    public boolean haveSession(String token) {
        return redisTemplate.hasKey(SESSION_PREFIX + token) != null;
    }
}
