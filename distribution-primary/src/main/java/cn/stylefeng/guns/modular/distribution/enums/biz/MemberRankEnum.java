package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 用户等级标志，与积分相关
 *
 * @author Fu Fei
 * @date 2020/7/12
 */
public enum MemberRankEnum implements EnumAccess {

    /**
     * 青铜
     */
    BRONZE(0, "青铜"),

    /**
     * 白银
     */
    SILVER(1, "白银"),

    /**
     * 黄金
     */
    GOLD(2, "黄金"),

    /**
     * 铂金
     */
    PLATINUM(3, "铂金"),

    /**
     * 钻石
     */
    DIAMOND(4, "钻石");

    @EnumValue
    private final Integer code;
    private final String message;

    MemberRankEnum(Integer code, String message) {
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
