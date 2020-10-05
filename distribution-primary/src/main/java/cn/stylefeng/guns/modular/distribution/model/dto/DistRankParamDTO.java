package cn.stylefeng.guns.modular.distribution.model.dto;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

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
public class DistRankParamDTO implements Serializable {

    private static final long serialVersionUID = 281330130868238719L;

    /**
     * 主键
     */
    private Long id;


    /**
     * 平台标识
     */
    private String platformUsername;

    /**
     * 用户段位
     */
    @NotNull(message = "用户段位不能为空", groups = ValidateGroup.Insert.class)
    private MemberRankEnum memberRank;

    /**
     * 开始积分
     */
    @DecimalMin(value = "0", message = "开始积分不能小于0", groups = ValidateGroup.Insert.class)
    @NotNull(message = "开始积分不能为空", groups = ValidateGroup.Insert.class)
    private Integer beginIntegral;

    /**
     * 结束积分
     */
    @DecimalMin(value = "0", inclusive = false, message = "结束积分不能小于0", groups = ValidateGroup.Insert.class)
    @NotNull(message = "结束积分不能为空", groups = ValidateGroup.Insert.class)
    private Integer endIntegral;

    /**
     * 状态
     */
    @NotNull(message = "状态不能为空", groups = ValidateGroup.Insert.class)
    private StateEnum state;

}
