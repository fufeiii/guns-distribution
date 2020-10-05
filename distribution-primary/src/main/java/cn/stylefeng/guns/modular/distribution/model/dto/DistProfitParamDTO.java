package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

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
public class DistProfitParamDTO implements Serializable {

    private static final long serialVersionUID = -1942477443713074744L;

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = ValidateGroup.PrimaryKey.class)
    private Long id;

    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 账户类型
     */
    @NotNull(message = "账户类型不能为空", groups = ValidateGroup.Insert.class)
    private AccountTypeEnum accountType;

    /**
     * 分润类型
     */
    @NotNull(message = "分润类型不能为空", groups = ValidateGroup.Insert.class)
    private ProfitTypeEnum profitType;

    /**
     * 计算方式
     */
    @NotNull(message = "计算方式不能为空", groups = ValidateGroup.Insert.class)
    private CalculateModeEnum calculateMode;

    /**
     * 分润等级
     */
    @NotNull(message = "分润等级不能为空", groups = ValidateGroup.Insert.class)
    private ProfitLevelEnum profitLevel;

    /**
     * 分润系数
     */
    @DecimalMin(value = "0", inclusive = false, message = "分润系数不能小于0", groups = ValidateGroup.Insert.class)
    @NotNull(message = "分润系数不能为空", groups = ValidateGroup.Insert.class)
    private BigDecimal profitRatio;

    /**
     * 用户类型
     */
    @NotNull(message = "用户类型不能为空", groups = ValidateGroup.Insert.class)
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    @NotNull(message = "用户段位不能为空", groups = ValidateGroup.Insert.class)
    private MemberRankEnum memberRank;

    /**
     * 状态
     */
    @NotNull(message = "状态不能为空", groups = ValidateGroup.Insert.class)
    private StateEnum state;

}
