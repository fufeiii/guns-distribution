package cn.stylefeng.guns.modular.distribution.enums.biz;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * 分润类型枚举，作为分润参数存在。
 * 并且应该在业务上 应该存在对应的业务实现和相关接口
 *
 * @author Fu Fei
 * @date 2020/7/15
 */
public enum ProfitTypeEnum implements EnumAccess {

    /**
     * 交易
     */
    TRADE(0, "商品交易"),

    /**
     * 邀请
     */
    INVITE(1, "邀请好友"),

    /**
     *
     */
    RANK(2, "段位升级");


    @EnumValue
    private final Integer code;
    private final String message;

    ProfitTypeEnum(Integer code, String message) {
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

    /**
     * 目前仅限邀请分润和段位升级分润生成编号
     * 因为交易分润时的事件会存储外部订单
     *
     * @return 事件编号
     */
    public String generateEventNumber() {
        return this.getName() + "_" + System.currentTimeMillis();
    }

}
