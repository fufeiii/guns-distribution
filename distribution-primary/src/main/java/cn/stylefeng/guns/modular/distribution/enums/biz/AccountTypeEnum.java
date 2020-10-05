package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 账户类型。
 * 佣金或者积分
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
public enum AccountTypeEnum implements EnumAccess {

    /**
     * 佣金
     */
    MONEY(0, "佣金"),

    /**
     * 积分
     */
    INTEGRAL(1, "积分");

    @EnumValue
    private final Integer code;
    private final String message;

    AccountTypeEnum(Integer code, String message) {
        this.code = code;
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
