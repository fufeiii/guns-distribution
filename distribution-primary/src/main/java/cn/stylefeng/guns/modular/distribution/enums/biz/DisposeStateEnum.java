package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 提现处置状态枚举
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
public enum DisposeStateEnum implements EnumAccess {

    /**
     * 审批中
     */
    WAIT_AUDIT(0, "待审核"),

    /**
     * 待打款
     */
    WAIT_REMIT(1, "待打款"),

    /**
     * 已打款
     */
    DONE_REMIT(2, "已打款"),

    /**
     * 拒绝
     */
    REJECT(3, "已拒绝");

    @EnumValue
    private final Integer code;
    private final String message;

    DisposeStateEnum(Integer code, String message) {
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
