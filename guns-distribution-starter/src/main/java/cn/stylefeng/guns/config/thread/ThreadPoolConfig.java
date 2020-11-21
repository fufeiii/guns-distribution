package cn.stylefeng.guns.config.thread;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.CustomizableThreadFactory;

import java.util.concurrent.*;

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
                availableProcessors,
                availableProcessors * 2,
                60,
                TimeUnit.SECONDS,
                new SynchronousQueue<>(),
                new CustomizableThreadFactory(threadNamePrefix),
                new ThreadPoolExecutor.CallerRunsPolicy());
    }


}
