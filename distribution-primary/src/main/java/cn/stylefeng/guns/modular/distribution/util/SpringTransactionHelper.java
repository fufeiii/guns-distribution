package cn.stylefeng.guns.modular.distribution.util;

import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

/**
 * Spring编程式事务帮助类
 *
 * @author Fu Fei
 * @date 2020/12/2
 */
public class SpringTransactionHelper {

    private final static ThreadLocal<TransactionStatus> TRANSACTION_STATUS_THREAD_LOCAL = new ThreadLocal<>();

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

}
