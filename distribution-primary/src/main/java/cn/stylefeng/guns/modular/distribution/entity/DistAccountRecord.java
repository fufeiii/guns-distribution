package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ChangeTypeEnum;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 账户明细记录
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_account_record")
public class DistAccountRecord implements Serializable {

    private static final long serialVersionUID = 8467987872631250629L;

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
     * 账户类型
     */
    @TableField("account_type")
    private AccountTypeEnum accountType;

    /**
     * 变动前总数
     */
    @TableField("before_change_total")
    private BigDecimal beforeChangeTotal;

    /**
     * 变动后总数
     */
    @TableField("after_change_total")
    private BigDecimal afterChangeTotal;

    /**
     * 变动数
     */
    @TableField("change_amount")
    private BigDecimal changeAmount;

    /**
     * 变动类型
     */
    @TableField("change_type")
    private ChangeTypeEnum changeType;

    /**
     * 记录主键
     */
    @TableField("change_record_id")
    private Long changeRecordId;

    /**
     * 备注
     */
    @TableField("memo")
    private String memo;

}
