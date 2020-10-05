package cn.stylefeng.guns.modular.distribution.util;

import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.util.Assert;

/**
 * 编程式事务工具类
 *
 * @author Fu Fei
 * @date 2020/9/13
 */
public class TransactionUtil {

    private TransactionUtil() {
    }

    private static void validate(boolean getTransaction, PlatformTransactionManager manager, TransactionDefinition definition,
                                 TransactionStatus status) {
        Assert.notNull(manager, "PlatformTransactionManager 参数不能为空！");
        if (getTransaction) {
            Assert.notNull(definition, "TransactionDefinition 参数不能为空！");
        } else {
            Assert.notNull(status, "TransactionStatus 参数不能为空！");
        }
    }

    public static TransactionStatus getTransaction(PlatformTransactionManager platformTransactionManager, TransactionDefinition transactionDefinition) {
        validate(true, platformTransactionManager, transactionDefinition, null);
        return platformTransactionManager.getTransaction(transactionDefinition);
    }

    public static void commit(PlatformTransactionManager platformTransactionManager, TransactionStatus transactionStatus) {
        validate(false, platformTransactionManager, null, transactionStatus);
        platformTransactionManager.commit(transactionStatus);
    }

    public static void rollback(PlatformTransactionManager platformTransactionManager, TransactionStatus transactionStatus) {
        validate(false, platformTransactionManager, null, transactionStatus);
        platformTransactionManager.rollback(transactionStatus);
    }

}
