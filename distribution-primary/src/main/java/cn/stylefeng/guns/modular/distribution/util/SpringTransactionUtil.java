package cn.stylefeng.guns.modular.distribution.util;

import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.Assert;

import java.util.function.Consumer;

/**
 * Spring编程式事工具类
 *
 * @author Fu Fei
 * @date 2020/12/2
 */
public class SpringTransactionUtil {

    private static final ThreadLocal<TransactionStatus> TRANSACTION_STATUS_THREAD_LOCAL = new ThreadLocal<>();

    private SpringTransactionUtil() {
    }


    public static void start(PlatformTransactionManager ptm, TransactionDefinition td) {
        TransactionStatus status = ptm.getTransaction(td);
        TRANSACTION_STATUS_THREAD_LOCAL.set(status);
    }

    public static void commit(PlatformTransactionManager ptm) {
        TransactionStatus status = TRANSACTION_STATUS_THREAD_LOCAL.get();
        ptm.commit(status);
        removeTransactionStatus();
    }

    public static void rollback(PlatformTransactionManager ptm) {
        TransactionStatus status = TRANSACTION_STATUS_THREAD_LOCAL.get();
        ptm.rollback(status);
        removeTransactionStatus();
    }

    public static void removeTransactionStatus() {
        TRANSACTION_STATUS_THREAD_LOCAL.remove();
    }


    public static <T> T executeWithResult(TransactionTemplate template, TransactionCallback<T> action) {
        Assert.notNull(template, "[template] 对象不能为空");
        Assert.notNull(action, "[action] 对象不能为空");
        return template.execute(action);
    }

    public static void executeWithoutResult(TransactionTemplate template, Consumer<TransactionStatus> action) {
        Assert.notNull(template, "[template] 对象不能为空");
        Assert.notNull(action, "[action] 对象不能为空");
        template.execute(SimplifiedTransactionCallback.build(action));
    }


    /**
     * 简化TransactionCallbackWithoutResult的创建过程
     */
    private static class SimplifiedTransactionCallback extends TransactionCallbackWithoutResult {

        /**
         * 本次事务中需要的业务执行对象。
         */
        private final Consumer<TransactionStatus> action;

        private SimplifiedTransactionCallback(Consumer<TransactionStatus> action) {
            this.action = action;
        }

        @Override
        protected void doInTransactionWithoutResult(TransactionStatus status) {
            action.accept(status);
        }

        public static SimplifiedTransactionCallback build(Consumer<TransactionStatus> callback) {
            return new SimplifiedTransactionCallback(callback);
        }

    }
}
