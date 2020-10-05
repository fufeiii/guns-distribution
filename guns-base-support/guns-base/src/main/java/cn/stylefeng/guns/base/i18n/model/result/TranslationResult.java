package cn.stylefeng.guns.base.i18n.model.result;

import lombok.Data;

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
@Data
public class TranslationResult implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 主键id
     */
    private Long tranId;

    /**
     * 编码
     */
    private String tranCode;

    /**
     * 多语言条例名称
     */
    private String tranName;

    /**
     * 1:中文  2:英语
     */
    private Integer languages;

    /**
     * 翻译的值
     */
    private String tranValue;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private Long createUser;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private Long updateUser;

}
