package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 分润计算方式，即在原有的某一个基准上
 * 进行百分比后分润，或者直接按照固定值分润
 *
 * @author Fu Fei
 * @date 2020/7/13
 */
public enum CalculateModeEnum implements EnumAccess {

    /**
     * 百分比
     */
    PERCENTAGE(0, "百分比"),

    /**
     * 固定值
     */
    FIXED(1, "固定");

    @EnumValue
    private final Integer code;
    private final String message;

    CalculateModeEnum(Integer code, String message) {
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
