package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import com.baomidou.mybatisplus.annotation.*;
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
@TableName("dist_member")
public class DistMember implements Serializable {

    private static final long serialVersionUID = -3018327070373102893L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 乐观锁
     */
    @TableField("version")
    @Version
    private Integer version;

    /**
     * 平台标识
     */
    @TableField("platform_username")
    private String platformUsername;

    /**
     * 用户标识
     */
    @TableField("member_username")
    private String memberUsername;

    /**
     * 用户昵称
     */
    @TableField("member_nickname")
    private String memberNickname;

    /**
     * 用户头像
     */
    @TableField("member_avatar")
    private String memberAvatar;

    /**
     * 直属父级标识
     */
    @TableField("fir_parent")
    private String firParent;

    /**
     * 二级层级父级标识
     */
    @TableField("sec_parent")
    private String secParent;

    /**
     * 三级层级父级标识
     */
    @TableField("thr_parent")
    private String thrParent;

    /**
     * 层级全路径
     */
    @TableField("parent_path")
    private String parentPath;

    /**
     * 用户身份
     */
    @TableField("member_type")
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    @TableField("member_rank")
    private MemberRankEnum memberRank;

    /**
     * 用户状态
     */
    @TableField("state")
    private StateEnum state;

    /**
     * 备注
     */
    @TableField("memo")
    private String memo;

}
