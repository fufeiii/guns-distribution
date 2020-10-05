package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 分润记录
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class DistProfitRecordDTO extends DistProfitEventDTO implements Serializable {

    private static final long serialVersionUID = 3003134505370461722L;

    /**
     * 事件主键
     */
    private Long eventId;

    /**
     * 账户类型
     */
    private AccountTypeEnum accountType;

    /**
     * 获利人
     */
    private String impactMemberUsername;

    /**
     * 获利数
     */
    private BigDecimal incomeAmount;

}
