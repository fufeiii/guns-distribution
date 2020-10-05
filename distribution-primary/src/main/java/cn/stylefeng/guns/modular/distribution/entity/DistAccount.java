package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import com.baomidou.mybatisplus.annotation.*;
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
@TableName("dist_account")
public class DistAccount implements Serializable {

    private static final long serialVersionUID = -3738054236244865180L;

    /**
     * 会员表主键
     */
    @TableId(value = "member_id", type = IdType.ASSIGN_ID)
    private Long memberId;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 乐观锁
     */
    @TableField("version")
    @Version
    private Integer version;

    /**
     * 总金额
     */
    @TableField("money_total")
    private BigDecimal moneyTotal;

    /**
     * 可用金额
     */
    @TableField("money_available")
    private BigDecimal moneyAvailable;

    /**
     * 冻结金额
     */
    @TableField("money_frozen")
    private BigDecimal moneyFrozen;

    /**
     * 历史总积分
     */
    @TableField("integral_total_history")
    private Integer integralTotalHistory;

    /**
     * 总积分
     */
    @TableField("integral_total")
    private Integer integralTotal;

    /**
     * 可用积分
     */
    @TableField("integral_available")
    private Integer integralAvailable;

    /**
     * 冻结积分
     */
    @TableField("integral_frozen")
    private Integer integralFrozen;

    /**
     * 账户状态
     */
    @TableField("state")
    private StateEnum state;

}
