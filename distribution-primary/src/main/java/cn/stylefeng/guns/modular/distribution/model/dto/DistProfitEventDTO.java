package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.profit.ProfitAccess;
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
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@ApiModel
public class DistProfitEventDTO implements Serializable, ProfitAccess {

    private static final long serialVersionUID = 6552188807003635252L;

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
     * 分润类型
     * 目前仅交易分润，所以此字段固定
     */
    @ApiModelProperty(hidden = true)
    private ProfitTypeEnum profitType;

    /**
     * 事件触发人
     */
    @ApiModelProperty(value = "事件触发人，即引发事件的人", example = "triggerMemberUsername")
    @NotBlank(message = "事件触发人不能为空", groups = ValidateGroup.Insert.class)
    private String triggerMemberUsername;

    /**
     * 事件编号，交易分润时为商户订单编号
     */
    @ApiModelProperty(value = "商户订单编号", example = "ORDER_123456")
    @NotBlank(message = "商户订单编号不能为空", groups = ValidateGroup.Insert.class)
    private String eventNumber;

    /**
     * 事件金额，目前仅交易分润记录订单金额
     */
    @ApiModelProperty(value = "订单金额", example = "100.00")
    @DecimalMin(value = "0", inclusive = false, message = "订单金额不能小于0元", groups = ValidateGroup.Insert.class)
    @NotNull(message = "订单金额不能为空", groups = ValidateGroup.Insert.class)
    private BigDecimal eventPrice;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述", example = "99大促商品")
    private String memo;

}
