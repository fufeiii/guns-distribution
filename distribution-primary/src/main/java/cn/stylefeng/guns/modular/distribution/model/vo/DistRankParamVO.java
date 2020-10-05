package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 段位配置
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
public class DistRankParamVO implements Serializable {

    private static final long serialVersionUID = 281330130868238719L;

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
     * 用户段位
     */
    private MemberRankEnum memberRank;

    /**
     * 开始积分
     */
    private Integer beginIntegral;

    /**
     * 结束积分
     */
    private Integer endIntegral;

    /**
     * 状态
     */
    private StateEnum state;


    private String memberRankMessage;
    private String stateMessage;

    public String getMemberRankMessage() {
        return memberRank == null ? null : memberRank.getMessage();
    }

    public String getStateMessage() {
        return state == null ? null : state.getMessage();
    }

}
