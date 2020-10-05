package cn.stylefeng.guns.modular.distribution.entity;

import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import com.baomidou.mybatisplus.annotation.*;
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
@TableName("dist_rank_param")
public class DistRankParam implements Serializable {

    private static final long serialVersionUID = 3165521228470606543L;

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
     * 用户段位
     */
    @TableField("member_rank")
    private MemberRankEnum memberRank;

    /**
     * 开始积分
     */
    @TableField("begin_integral")
    private Integer beginIntegral;

    /**
     * 结束积分
     */
    @TableField("end_integral")
    private Integer endIntegral;

    /**
     * 状态
     */
    @TableField("state")
    private StateEnum state;

}
