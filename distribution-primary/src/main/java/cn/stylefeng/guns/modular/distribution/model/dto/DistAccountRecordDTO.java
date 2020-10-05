package cn.stylefeng.guns.modular.distribution.model.dto;

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
public class DistAccountRecordDTO implements Serializable {

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


}
