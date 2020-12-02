package cn.stylefeng.guns.modular.distribution.exception;

import cn.stylefeng.roses.kernel.model.exception.AbstractBaseExceptionEnum;
import cn.stylefeng.roses.kernel.model.exception.ServiceException;

/**
 * 分销模块的异常
 * 抛出后会被分销模块的exceptionHandler处理，返回给前端调用者。
 *
 * @author Fu Fei
 * @date 2020/7/5
 */
public class DistributionException extends ServiceException {

    private static final long serialVersionUID = 6032654316842150374L;

    public DistributionException(BizEnum bizEnum) {
        super(bizEnum);
    }


    /**
     * 分销模块的业务相关异常枚举
     *
     * @author Fu Fei
     * @date 2020/7/5
     */
    public enum BizEnum implements AbstractBaseExceptionEnum {

        // -----------------乐观锁更新失败异常
        OPTIMISTIC_RETRY_FAILURE(1001, "操作失败，请稍后重试"),


        // -----------------平台相关异常枚举
        PLATFORM_EXIST(7001, "平台已存在"),
        PLATFORM_NOT_EXIST(7002, "平台不存在"),
        PLATFORM_STATUS_ILLEGAL(7003, "平台已被限制"),


        // -----------------会员相关异常枚举
        MEMBER_EXIST(7101, "会员已存在"),
        MEMBER_NOT_EXIST(7102, "会员不存在"),
        MEMBER_STATUS_ILLEGAL(7103, "会员已被限制"),
        MEMBER_PARENT_NOT_EXIST(7104, "父级会员不存在"),


        // -----------------分润参数相关异常枚举
        PROFIT_PARAM_EXIST(7201, "分润参数已存在"),
        PROFIT_PARAM_ILLEGAL(7202, "分润参数不合法"),

        // -----------------分润过程中异常枚举
        PROFIT_MONEY_MINUS(7301, "分润金额为负数"),
        ORDER_NO_REPETITION(7302, "订单号重复"),

        // -----------------段位升级参数异常枚举
        RANK_PARAM_EXIST(7401, "段位参数已存在"),
        RANK_PARAM_ILLEGAL(7402, "结束积分必须大于开始积分"),


        // -----------------提现相关异常
        WITHDRAW_FEE_ILLEGAL(7501, "提现费用异常"),


        // -----------------账户相关异常
        ACCOUNT_BALANCE_LACK(7601, "账户余额不足"),
        ACCOUNT_FORBIDDEN(7602, "账户已被冻结"),



        ;


        BizEnum(int code, String message) {
            this.code = code;
            this.message = message;
        }

        BizEnum(int code, String message, String append) {
            this.code = code;
            this.message = message + append;
        }

        private final Integer code;
        private final String message;

        @Override
        public Integer getCode() {
            return this.code;
        }

        @Override
        public String getMessage() {
            return this.message;
        }
    }
}
