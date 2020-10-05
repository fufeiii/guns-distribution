package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 分润记录
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_profit_record")
public class DistProfitRecord implements Serializable {

    private static final long serialVersionUID = 6003868529094567102L;

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
     * 事件主键
     */
    @TableField("event_id")
    private Long eventId;

    /**
     * 账户类型
     */
    @TableField("account_type")
    private AccountTypeEnum accountType;

    /**
     * 获利人
     */
    @TableField("impact_member_username")
    private String impactMemberUsername;

    /**
     * 获利数
     */
    @TableField("income_amount")
    private BigDecimal incomeAmount;

    /**
     * 备注
     */
    @TableField("memo")
    private String memo;

}
