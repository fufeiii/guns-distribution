package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 会员账户
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
public class DistAccountVO implements Serializable {

    private static final long serialVersionUID = 2052820060243290400L;

    /**
     * 会员表主键
     */
    private Long memberId;

    /**
     * 会员标识
     */
    private String memberUsername;

    /**
     * 会员昵称
     */
    private String memberNickname;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 乐观锁
     */
    private Integer version;

    /**
     * 总金额
     */
    private BigDecimal moneyTotal;

    /**
     * 可用金额
     */
    private BigDecimal moneyAvailable;

    /**
     * 冻结金额
     */
    private BigDecimal moneyFrozen;

    /**
     * 历史总积分
     */
    private Integer integralTotalHistory;

    /**
     * 总积分
     */
    private Integer integralTotal;

    /**
     * 可用积分
     */
    private Integer integralAvailable;

    /**
     * 冻结积分
     */
    private Integer integralFrozen;

    /**
     * 账户状态
     */
    private StateEnum state;

    private String stateMessage;

    public String getStateMessage() {
        return state == null ? null : state.getMessage();
    }
}
