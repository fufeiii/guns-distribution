package cn.stylefeng.guns.base.i18n.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 多语言表
 * </p>
 *
 * @author stylefeng
 * @since 2019-10-17
 */
@TableName("sys_translation")
public class Translation implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "tran_id", type = IdType.ID_WORKER)
    private Long tranId;

    /**
     * 编码
     */
    @TableField("tran_code")
    private String tranCode;

    /**
     * 多语言条例名称
     */
    @TableField("tran_name")
    private String tranName;

    /**
     * 1:中文  2:英语
     */
    @TableField("languages")
    private Integer languages;

    /**
     * 翻译的值
     */
    @TableField("tran_value")
    private String tranValue;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 创建人
     */
    @TableField(value = "create_user", fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 更新人
     */
    @TableField(value = "update_user", fill = FieldFill.UPDATE)
    private Long updateUser;


    public Long getTranId() {
        return tranId;
    }

    public void setTranId(Long tranId) {
        this.tranId = tranId;
    }

    public String getTranCode() {
        return tranCode;
    }

    public void setTranCode(String tranCode) {
        this.tranCode = tranCode;
    }

    public String getTranName() {
        return tranName;
    }

    public void setTranName(String tranName) {
        this.tranName = tranName;
    }

    public Integer getLanguages() {
        return languages;
    }

    public void setLanguages(Integer languages) {
        this.languages = languages;
    }

    public String getTranValue() {
        return tranValue;
    }

    public void setTranValue(String tranValue) {
        this.tranValue = tranValue;
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
        return "Translation{" +
        "tranId=" + tranId +
        ", tranCode=" + tranCode +
        ", tranName=" + tranName +
        ", languages=" + languages +
        ", tranValue=" + tranValue +
        ", createTime=" + createTime +
        ", createUser=" + createUser +
        ", updateTime=" + updateTime +
        ", updateUser=" + updateUser +
        "}";
    }
}
