package cn.stylefeng.guns.modular.distribution.api.request;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 通用查询请求参数参数封装
 *
 * @author Fu Fei
 * @date 2020/9/25
 */
@ApiModel
@Data
public class CommonQuery implements Serializable {

    private static final long serialVersionUID = -3530389285217407631L;

    @ApiModelProperty(value = "用户标识")
    @NotBlank(message = "用户标识不能为空", groups = ValidateGroup.Special.class)
    private String memberUsername;

    @ApiModelProperty(value = "页数")
    private String page;

    @ApiModelProperty(value = "页码")
    private String limit;

}
