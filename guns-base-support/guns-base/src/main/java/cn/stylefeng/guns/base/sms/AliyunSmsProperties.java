package cn.stylefeng.guns.base.sms;

import lombok.Data;

/**
 * oss相关配置
 *
 * @author fengshuonan
 * @date 2018-06-27-下午1:20
 */
@Data
public class AliyunSmsProperties {

    /**
     * accessKeyId
     */
    private String accessKeyId;

    /**
     * accessKeySecret
     */
    private String accessKeySecret;

    /**
     * 签名名称
     */
    private String signName;

    /**
     * 登录验证码的模板
     */
    private String loginTemplateCode;

    /**
     * 短信失效时间（分钟）
     */
    private Integer invalidateMinutes = 2;

}
