package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ChangeTypeEnum;
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
public class DistAccountRecordVO implements Serializable {

    private static final long serialVersionUID = 6898664506774720338L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 用户标识
     */
    private String memberUsername;

    /**
     * 账户类型
     */
    private AccountTypeEnum accountType;

    /**
     * 变动前总数
     */
    private BigDecimal beforeChangeTotal;

    /**
     * 变动后总数
     */
    private BigDecimal afterChangeTotal;

    /**
     * 变动数
     */
    private BigDecimal changeAmount;

    /**
     * 变动类型
     */
    private ChangeTypeEnum changeType;

    /**
     * 记录主键
     */
    private Long changeRecordId;

    /**
     * 备注
     */
    private String memo;

    private String changeTypeMessage;
    private String accountTypeMessage;

    public String getChangeTypeMessage() {
        return changeType == null ? null : changeType.getMessage();
    }

    public String getAccountTypeMessage() {
        return accountType == null ? null : accountType.getMessage();
    }
}
