package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 会员
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
public class DistMemberVO implements Serializable {

    private static final long serialVersionUID = -7068378591673772103L;

    /**
     * 主键id
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
     * 平台标识
     */
    private String platformUsername;

    /**
     * 用户标识
     */
    private String memberUsername;

    /**
     * 用户昵称
     */
    private String memberNickname;

    /**
     * 用户头像
     */
    private String memberAvatar;

    /**
     * 直属父级
     */
    private String firParent;

    /**
     * 二级层级父级标识
     */
    private String secParent;

    /**
     * 三级层级父级标识
     */
    private String thrParent;

    /**
     * 层级全路径
     */
    private String parentPath;

    /**
     * 邀请数量
     */
    private Integer inviteNum;

    /**
     * 用户身份
     */
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    private MemberRankEnum memberRank;

    /**
     * 用户状态
     */
    private StateEnum state;

    /**
     * 备注
     */
    private String memo;

    private String memberTypeMessage;
    private String memberRankMessage;
    private String stateMessage;

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
