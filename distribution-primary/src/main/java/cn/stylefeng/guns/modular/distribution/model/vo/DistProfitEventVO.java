package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
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
public class DistProfitEventVO implements Serializable {

    private static final long serialVersionUID = 6552188807003635252L;

    /**
     * 主键
     */
    @JSONField(serializeUsing = ToStringSerializer.class)
    private Long id;

    /**
     * 创建事件
     */
    private Date createTime;

    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 分润类型
     */
    private ProfitTypeEnum profitType;

    /**
     * 事件触发人
     */
    private String triggerMemberUsername;

    /**
     * 事件编号，交易分润时为商户订单编号
     */
    private String eventNumber;

    /**
     * 事件金额，目前仅交易分润记录订单金额
     */
    private BigDecimal eventPrice;

    /**
     * 描述
     */
    private String memo;

    private String profitTypeMessage;

    public String getProfitTypeMessage() {
        return profitType == null ? null : profitType.getMessage();
    }
}
