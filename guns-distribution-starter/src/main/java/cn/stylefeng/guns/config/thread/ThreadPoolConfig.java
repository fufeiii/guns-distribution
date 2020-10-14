package cn.stylefeng.guns.config.thread;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.CustomizableThreadFactory;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 线程池配置类
 *
 * @author Fu Fei
 * @date 2020/9/23
 */
@Configuration
public class ThreadPoolConfig {

    @Bean(name = "dashboardExecutorService")
    public ExecutorService executorService() {
        int availableProcessors = Runtime.getRuntime().availableProcessors();
        String threadNamePrefix = "dist-dashboard-pool-";
        return new ThreadPoolExecutor(
                availableProcessors * 2,
                availableProcessors * 3,
                30,
                TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(1024),
                new CustomizableThreadFactory(threadNamePrefix),
                new ThreadPoolExecutor.CallerRunsPolicy());
    }


}
