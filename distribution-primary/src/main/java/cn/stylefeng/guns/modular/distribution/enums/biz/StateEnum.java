package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 通用状态
 *
 * @author Fu Fei
 * @date 2020/7/8
 */
public enum StateEnum implements EnumAccess {
    /**
     * 开启状态
     */
    ENABLE(0, "启用"),
    /**
     * 禁用状态
     */
    DISABLES(1, "禁用");

    @EnumValue
    private final Integer code;
    private final String message;

    StateEnum(Integer value, String message) {
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
