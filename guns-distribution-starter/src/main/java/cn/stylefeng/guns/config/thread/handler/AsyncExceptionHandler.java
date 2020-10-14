package cn.stylefeng.guns.config.thread.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Arrays;

/**
 * 处理在执行异步任务的异常
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
@Component
@Slf4j
public class AsyncExceptionHandler implements AsyncUncaughtExceptionHandler {

    @Override
    public void handleUncaughtException(Throwable throwable, Method method, Object... objects) {
        log.error("Method name - " + method.getName());
        log.error("Parameter values - " + Arrays.toString(objects));
        log.error("stack trace :", throwable);
    }

}
