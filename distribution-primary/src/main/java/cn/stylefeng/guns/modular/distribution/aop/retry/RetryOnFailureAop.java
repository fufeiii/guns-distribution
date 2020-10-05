package cn.stylefeng.guns.modular.distribution.aop.retry;

import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.exception.RetryOnFailureException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 失败重试Aop
 * 设置order让其在spring事务的aop之前执行
 * 这样好处在于，每次重试都是一个新的事务
 * {@link RetryOnFailure}
 * {@link RetryOnFailureException}
 *
 * @author Fu Fei
 * @date 2020/8/28
 */
@Aspect
@Slf4j
@Component
@Order(666)
public class RetryOnFailureAop {

    @Pointcut("@annotation(cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure)")
    public void annotationPointcut() {
    }

    @Around("annotationPointcut()")
    public Object retryOnFailure(ProceedingJoinPoint pjp) throws Throwable {
        // 获取拦截的方法
        MethodSignature ms = (MethodSignature) pjp.getSignature();
        // 返回被织入增加处理目标对象
        Object target = pjp.getTarget();
        // 为了获取注解信息
        Method currentMethod = target.getClass().getMethod(ms.getName(), ms.getParameterTypes());
        // 设置当前线程的重试次数
        int retryTimes = currentMethod.getAnnotation(RetryOnFailure.class).retryTimes();
        int curTimes = 0;
        while (true) {
            if (retryTimes <= 0) {
                throw new DistributionException(DistributionException.BizEnum.OPTIMISTIC_RETRY_FAILURE);
            }
            retryTimes--;
            curTimes++;
            log.debug("-------------\nretryOnFailureAop, 当前次数为=[{}], 剩余次数[{}], 所在方法为=[{}]", curTimes, retryTimes, currentMethod.toGenericString());
            try {
                return pjp.proceed();
            } catch (RetryOnFailureException e) {
                // 静默处理
                // 捕捉此异常代表需要重试，并且能解决重入问题。
            }
        }
    }

}
