package cn.stylefeng.guns.base.oauth2.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 第三方用户信息表
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-09
 */
@TableName("oauth_user_info")
public class OauthUserInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "oauth_id", type = IdType.ID_WORKER)
    private Long oauthId;

    /**
     * 用户主键id
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 昵称
     */
    @TableField("nick_name")
    private String nickName;

    /**
     * 头像
     */
    @TableField("avatar")
    private String avatar;

    /**
     * 用户网址
     */
    @TableField("blog")
    private String blog;

    /**
     * 所在公司
     */
    @TableField("company")
    private String company;

    /**
     * 位置
     */
    @TableField("location")
    private String location;

    /**
     * 邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 用户备注（各平台中的用户个人介绍）
     */
    @TableField("remark")
    private String remark;

    /**
     * 性别，1-男，0-女
     */
    @TableField("gender")
    private Integer gender;

    /**
     * 用户来源
     */
    @TableField("source")
    private String source;

    /**
     * 用户授权的token
     */
    @TableField("token")
    private String token;

    /**
     * 第三方平台的用户唯一di
     */
    @TableField("uuid")
    private String uuid;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 创建用户
     */
    @TableField(value = "create_user", fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 更新用户
     */
    @TableField(value = "update_user", fill = FieldFill.UPDATE)
    private Long updateUser;


    public Long getOauthId() {
        return oauthId;
    }

    public void setOauthId(Long oauthId) {
        this.oauthId = oauthId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBlog() {
        return blog;
    }

    public void setBlog(String blog) {
        this.blog = blog;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Long updateUser) {
        this.updateUser = updateUser;
    }

    @Override
    public String toString() {
        return "OauthUserInfo{" +
                "oauthId=" + oauthId +
                ", userId=" + userId +
                ", nickName=" + nickName +
                ", avatar=" + avatar +
                ", blog=" + blog +
                ", company=" + company +
                ", location=" + location +
                ", email=" + email +
                ", remark=" + remark +
                ", gender=" + gender +
                ", source=" + source +
                ", token=" + token +
                ", uuid=" + uuid +
                ", createTime=" + createTime +
                ", createUser=" + createUser +
                ", updateTime=" + updateTime +
                ", updateUser=" + updateUser +
                "}";
    }
}
