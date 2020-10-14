package cn.stylefeng.guns.modular.distribution.model.vo;

import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
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
public class DistPlatformVO implements Serializable {

    private static final long serialVersionUID = 1244677663186129161L;

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
     * 平台名称
     */
    private String platformNickname;

    /**
     * webhook
     */
    private String webhook;

    /**
     * 状态
     */
    private StateEnum state;

    /**
     * 备注
     */
    private String memo;

    /**
     * 系统管理员id
     */
    private Long sysId;

    private String stateMessage;

    public String getStateMessage() {
        return state == null ? null : state.getMessage();
    }
}
