package cn.stylefeng.guns.base.oauth2.model.result;

import lombok.Data;
import java.util.Date;
import java.io.Serializable;

/**
 * <p>
 * 第三方用户信息表
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-09
 */
@Data
public class OauthUserInfoResult implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 主键id
     */
    private Long oauthId;

    /**
     * 用户主键id
     */
    private Long userId;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 用户网址
     */
    private String blog;

    /**
     * 所在公司
     */
    private String company;

    /**
     * 位置
     */
    private String location;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 用户备注（各平台中的用户个人介绍）
     */
    private String remark;

    /**
     * 性别，1-男，0-女
     */
    private Integer gender;

    /**
     * 用户来源
     */
    private String source;

    /**
     * 用户授权的token
     */
    private String token;

    /**
     * 第三方平台的用户唯一di
     */
    private String uuid;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建用户
     */
    private Long createUser;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新用户
     */
    private Long updateUser;

}
