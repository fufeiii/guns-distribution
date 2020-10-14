package cn.stylefeng.guns.config.thread;

import cn.stylefeng.guns.config.thread.handler.AsyncExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * 设置自己的TaskExecutor
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
@EnableAsync
@Component
@Slf4j
public class AsyncConfig implements AsyncConfigurer {

    @Autowired
    private AsyncExceptionHandler asyncExceptionHandler;

    @Override
    public TaskExecutor getAsyncExecutor() {
        int availableProcessors = Runtime.getRuntime().availableProcessors();
        String threadNamePrefix = "dist-profit-pool-";
        // 此线程池名字默认为applicationTaskExecutor或者taskExecutor
        // 所以使用@Async注解可以不用指定线程池名字
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(availableProcessors * 2);
        executor.setMaxPoolSize(availableProcessors * 3);
        executor.setQueueCapacity(1024);
        // 当前若存在进行中的任务，则等待其执行完后在关闭
        executor.setWaitForTasksToCompleteOnShutdown(true);
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.setThreadNamePrefix(threadNamePrefix);
        executor.initialize();
        return executor;
    }

    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return asyncExceptionHandler;
    }

}
