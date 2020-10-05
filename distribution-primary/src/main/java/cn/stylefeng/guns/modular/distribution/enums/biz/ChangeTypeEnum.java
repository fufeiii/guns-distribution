package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 账户变动表中的变动类型枚举
 *
 * @author Fu Fei
 * @date 2020/7/31
 */
public enum ChangeTypeEnum implements EnumAccess {

    /**
     * 分润获利
     */
    PROFIT(0, "分润获利"),

    /**
     * 提现取出
     */
    WITHDRAW_DEPOSIT(1, "提现取出"),

    /**
     * 提现冻结
     */
    WITHDRAW_FREEZE(2, "提现冻结"),

    /**
     * 提现冻结
     */
    WITHDRAW_UNFREEZE(3, "提现冻结");


    @EnumValue
    private final Integer code;
    private final String message;

    ChangeTypeEnum(Integer value, String message) {
        this.code = value;
        this.message = message;
    }

    @Override
    public String getName() {
        return this.name();
    }

    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
