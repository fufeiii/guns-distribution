package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.*;
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
public class DistProfitParamVO implements Serializable {

    private static final long serialVersionUID = -1942477443713074744L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 乐观锁
     */
    private Integer version;

    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 账户类型
     */
    private AccountTypeEnum accountType;

    /**
     * 分润类型
     */
    private ProfitTypeEnum profitType;

    /**
     * 计算方式
     */
    private CalculateModeEnum calculateMode;

    /**
     * 分润等级
     */
    private ProfitLevelEnum profitLevel;

    /**
     * 分润比例
     */
    private BigDecimal profitRatio;

    /**
     * 用户类型
     */
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    private MemberRankEnum memberRank;

    /**
     * 状态
     */
    private StateEnum state;

    private String accountTypeMessage;
    private String profitTypeMessage;
    private String calculateModeMessage;
    private String profitLevelMessage;
    private String memberTypeMessage;
    private String memberRankMessage;
    private String stateMessage;

    public String getAccountTypeMessage() {
        return accountType == null ? null : accountType.getMessage();
    }

    public String getProfitTypeMessage() {
        return profitType == null ? null : profitType.getMessage();
    }

    public String getCalculateModeMessage() {
        return calculateMode == null ? null : calculateMode.getMessage();
    }

    public String getProfitLevelMessage() {
        return profitLevel == null ? null : profitLevel.getMessage();
    }

    public String getMemberTypeMessage() {
        return memberType == null ? null : memberType.getMessage();
    }

    public String getMemberRankMessage() {
        return memberRank == null ? null : memberRank.getMessage();
    }

    public String getStateMessage() {
        return state == null ? null : state.getMessage();
    }

}
