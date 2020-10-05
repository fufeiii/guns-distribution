package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 提现申请记录
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_withdraw_record")
public class DistWithdrawRecord implements Serializable {

    private static final long serialVersionUID = -3620262377780874162L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 处理时间
     */
    @TableField("handle_time")
    private Date handleTime;

    /**
     * 乐观锁
     */
    @TableField("version")
    @Version
    private Integer version;

    /**
     * 平台标识
     */
    @TableField("platform_username")
    private String platformUsername;

    /**
     * 用户标识
     */
    @TableField("member_username")
    private String memberUsername;

    /**
     * 提现单号
     */
    @TableField("withdraw_number")
    private String withdrawNumber;

    /**
     * 提现金额
     */
    @TableField("withdraw_amount")
    private BigDecimal withdrawAmount;

    /**
     * 手续费
     */
    @TableField("fee_amount")
    private BigDecimal feeAmount;

    /**
     * 备注
     */
    @TableField("memo")
    private String memo;


    /**
     * 处理状态
     */
    @TableField("dispose_state")
    private DisposeStateEnum disposeState;

}
