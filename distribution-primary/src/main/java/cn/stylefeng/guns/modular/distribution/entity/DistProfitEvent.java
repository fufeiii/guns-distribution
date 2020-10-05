package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_profit_event")
public class DistProfitEvent implements Serializable {

    private static final long serialVersionUID = -7669663936569903970L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 创建事件
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 平台标识
     */
    @TableField("platform_username")
    private String platformUsername;

    /**
     * 分润类型
     */
    @TableField("profit_type")
    private ProfitTypeEnum profitType;

    /**
     * 事件触发人
     */
    @TableField("trigger_member_username")
    private String triggerMemberUsername;

    /**
     * 事件编号，交易分润时为商户订单编号
     */
    @TableField("event_number")
    private String eventNumber;

    /**
     * 事件金额，目前仅交易分润记录订单金额
     */
    @TableField("event_price")
    private BigDecimal eventPrice;

    /**
     * 描述
     */
    @TableField("memo")
    private String memo;

}
