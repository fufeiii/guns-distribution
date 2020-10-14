package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 平台
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Data
@Accessors(chain = true)
@TableName("dist_platform")
public class DistPlatform implements Serializable {

    private static final long serialVersionUID = 1517883941927509903L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
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
     * 平台名称
     */
    @TableField("platform_nickname")
    private String platformNickname;

    /**
     * webhook
     */
    @TableField("webhook")
    private String webhook;

    /**
     * 状态
     */
    @TableField("state")
    private StateEnum state;

    /**
     * 备注
     */
    @TableField("memo")
    private String memo;

    /**
     * 系统管理员id
     */
    @TableField("sys_id")
    private Long sysId;

}
