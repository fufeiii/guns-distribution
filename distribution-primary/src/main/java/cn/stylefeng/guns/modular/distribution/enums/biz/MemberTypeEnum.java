package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 用户身份标识的枚举
 *
 * @author Fu Fei
 * @date 2020/7/11
 */
public enum MemberTypeEnum implements EnumAccess {

    /**
     * 普通用户
     */
    GENERAL(0, "普通用户"),
    /**
     * 高级用户
     */
    ADVANCE(1, "高级用户"),
    /**
     * 专业用户
     */
    PROFESSION(2, "专业用户");

    @EnumValue
    private final Integer code;
    private final String message;

    MemberTypeEnum(Integer code, String message) {
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
