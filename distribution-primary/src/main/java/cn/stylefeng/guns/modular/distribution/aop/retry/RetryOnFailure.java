package cn.stylefeng.guns.modular.distribution.aop.retry;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 此注解代表该方法在发生了 {@link cn.stylefeng.guns.modular.distribution.exception.RetryOnFailureException}
 * 时将被 {@link RetryOnFailureAop} 捕获，并重新执行当前方法
 *
 * @author Fu Fei
 * @date 2020/8/28
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RetryOnFailure {

    /**
     * 重试次数
     */
    int retryTimes() default 5;

}
