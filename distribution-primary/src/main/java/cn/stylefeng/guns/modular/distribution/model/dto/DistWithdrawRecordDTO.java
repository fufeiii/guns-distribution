package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

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
@ApiModel
public class DistWithdrawRecordDTO implements Serializable {

    private static final long serialVersionUID = -1554094862712144208L;

    /**
     * 主键
     */
    @ApiModelProperty(hidden = true)
    private Long id;

    /**
     * 平台标识
     */
    @ApiModelProperty(hidden = true)
    private String platformUsername;

    /**
     * 用户标识
     */
    @ApiModelProperty(value = "用户标识")
    @NotBlank(message = "用户标识不能为空", groups = ValidateGroup.Insert.class)
    private String memberUsername;

    /**
     * 提现单号
     */
    @ApiModelProperty(hidden = true)
    private String withdrawNumber;

    /**
     * 提现金额
     */
    @ApiModelProperty(value = "提现金额")
    @DecimalMin(value = "1", message = "提现金额不能小于1元", groups = ValidateGroup.Insert.class)
    @NotNull(message = "提现金额不能为空", groups = ValidateGroup.Insert.class)
    private BigDecimal withdrawAmount;

    /**
     * 提现金额
     */
    @ApiModelProperty(hidden = true)
    private BigDecimal feeAmount;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    private String memo;

    /**
     * 处理状态
     */
    @ApiModelProperty(hidden = true)
    private DisposeStateEnum disposeState;

}
