package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 分销等级枚举
 * 将作为分润的参数
 *
 * @author Fu Fei
 * @date 2020/7/18
 */
public enum ProfitLevelEnum implements EnumAccess {

    /**
     * 自身
     */
    ZERO(0, "自身"),

    /**
     * 一级
     */
    ONE(1, "一级"),

    /**
     * 二级
     */
    TWO(2, "二级"),

    /**
     * 三级
     */
    THREE(3, "三级");

    @EnumValue
    private final Integer code;
    private final String message;

    ProfitLevelEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public static ProfitLevelEnum matches(int code) {
        for (ProfitLevelEnum levelEnum : ProfitLevelEnum.values()) {
            if (code == levelEnum.code) {
                return levelEnum;
            }
        }
        return null;
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
