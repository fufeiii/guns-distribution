package cn.stylefeng.guns.modular.distribution.exception;

import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailureAop;

/**
 * 如果使用了乐观锁，更新失败时，请抛出此异常
 * {@link cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure}
 * {@link RetryOnFailureAop}
 * {@link cn.stylefeng.guns.modular.distribution.util.AssertHelper#retryOnFailure}
 *
 * @author Fu Fei
 * @date 2020/8/28
 */
public class RetryOnFailureException extends RuntimeException {

    private static final long serialVersionUID = 1689625932994830787L;

    public RetryOnFailureException() {
        super();
    }

}
