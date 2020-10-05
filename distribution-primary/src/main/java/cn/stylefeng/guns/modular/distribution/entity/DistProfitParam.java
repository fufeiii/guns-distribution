package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 分润参数
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_profit_param")
public class DistProfitParam implements Serializable {

    private static final long serialVersionUID = -9103869312462967882L;

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
     * 平台标识
     */
    @TableField("platform_username")
    private String platformUsername;

    /**
     * 账户类型
     */
    @TableField("account_type")
    private AccountTypeEnum accountType;

    /**
     * 分润类型
     */
    @TableField("profit_type")
    private ProfitTypeEnum profitType;

    /**
     * 计算方式
     */
    @TableField("calculate_mode")
    private CalculateModeEnum calculateMode;

    /**
     * 分润等级
     */
    @TableField("profit_level")
    private ProfitLevelEnum profitLevel;

    /**
     * 分润比列
     */
    @TableField("profit_ratio")
    private BigDecimal profitRatio;

    /**
     * 用户类型
     */
    @TableField("member_type")
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    @TableField("member_rank")
    private MemberRankEnum memberRank;

    /**
     * 状态
     */
    @TableField("state")
    private StateEnum state;

}
