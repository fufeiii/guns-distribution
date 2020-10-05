package cn.stylefeng.guns.modular.distribution.util;

import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.exception.RetryOnFailureException;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

/**
 * 分销模块的断言帮助类，只适用于当前项目
 * 自己写Assert的原因是为了抛出自己的业务异常
 * {@link DistributionException}
 * {@link RetryOnFailureException}
 *
 * @author Fu Fei
 * @date 2020/7/28
 */
public class AssertHelper {

    private AssertHelper() {
    }

    public static void isTrue(boolean expression, DistributionException.BizEnum bizEnum) {
        if (!expression) {
            throw new DistributionException(bizEnum);
        }
    }

    public static void notNull(Object object, DistributionException.BizEnum bizEnum) {
        if (object == null) {
            throw new DistributionException(bizEnum);
        }
    }

    public static void isNull(Object object, DistributionException.BizEnum bizEnum) {
        if (object != null) {
            throw new DistributionException(bizEnum);
        }
    }

    public static void retryOnFailure(boolean isSuccess) {
        retryOnFailure(isSuccess, true);
    }

    public static void retryOnFailure(boolean isSuccess, boolean isRollback) {
        if (!isSuccess) {
            if (isRollback) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            }
            throw new RetryOnFailureException();
        }
    }

}
