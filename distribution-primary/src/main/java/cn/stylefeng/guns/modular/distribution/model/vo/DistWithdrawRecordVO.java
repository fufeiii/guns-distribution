package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
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
public class DistWithdrawRecordVO implements Serializable {

    private static final long serialVersionUID = 2133946529588723938L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 处理时间
     */
    private Date handleTime;

    /**
     * 乐观锁
     */
    private Integer version;

    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 用户标识
     */
    private String memberUsername;

    /**
     * 提现单号
     */
    private String withdrawNumber;

    /**
     * 提现金额
     */
    private BigDecimal withdrawAmount;

    /**
     * 手续费
     */
    private BigDecimal feeAmount;

    /**
     * 备注
     */
    private String memo;

    /**
     * 处理状态
     */
    private DisposeStateEnum disposeState;

    private String disposeStateMessage;

    public String getDisposeStateMessage() {
        return disposeState == null ? null : disposeState.getMessage();
    }

}
