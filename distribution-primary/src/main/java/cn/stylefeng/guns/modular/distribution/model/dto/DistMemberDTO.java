package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.profit.ProfitAccess;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * <p>
 * 会员DTO
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@ApiModel
@Data
@Accessors(chain = true)
public class DistMemberDTO implements Serializable, ProfitAccess {

    private static final long serialVersionUID = 894756313734263277L;

    /**
     * 主键id
     */
    @ApiModelProperty(value = "本系统主键id，新增时不需要此字段", example = "666")
    @NotNull(message = "主键不能为空", groups = ValidateGroup.PrimaryKey.class)
    private Long id;

    /**
     * 平台标识
     * 如果新增会员发生了分润，会用到此字段
     */
    @ApiModelProperty(hidden = true)
    private String platformUsername;

    /**
     * 用户标识
     */
    @ApiModelProperty(value = "用户标识,即外部系统唯一的标识", example = "memberUsername")
    @NotBlank(message = "用户标识不能为空", groups = ValidateGroup.Insert.class)
    private String memberUsername;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称", example = "天高云淡")
    @NotBlank(message = "用户昵称不能为空", groups = ValidateGroup.Insert.class)
    private String memberNickname;

    /**
     * 用户头像
     */
    @ApiModelProperty(value = "用户头像地址", example = "http://your-host/imgs/head/avatar.jpg")
    private String memberAvatar;

    /**
     * 直属父级
     * 邀请人
     */
    @ApiModelProperty(value = "直属邀请人，此字段来自memberUsername", example = "member_parent")
    private String firParent;

    /**
     * 父级全路径
     * 如果触发了分润会需要
     */
    @ApiModelProperty(hidden = true)
    private String parentPath;

    /**
     * 用户身份
     */
    @ApiModelProperty(value = "用户身份，新增时默认普通用户。可选值：普通用户|高级用户|专业用户", example = "GENERAL|ADVANCE|PROFESSION")
    private MemberTypeEnum memberType;

    /**
     * 用户段位
     */
    @ApiModelProperty(value = "用户段位，新增时默认青铜。可选值：青铜|白银|黄金|铂金|钻石", example = "BRONZE|SILVER|GOLD|PLATINUM|DIAMOND")
    private MemberRankEnum memberRank;

    /**
     * 用户状态
     */
    @ApiModelProperty(value = "用户状态，新增时默认启用。可选值：启用|禁用", example = "ENABLE|DISABLES")
    private StateEnum state;

    /**
     * 备注
     */
    @ApiModelProperty(value = "用户备注", example = "这是一个用户备注信息。。。")
    private String memo;

    @Override
    public String getSubjectName() {
        return memberUsername;
    }

}
