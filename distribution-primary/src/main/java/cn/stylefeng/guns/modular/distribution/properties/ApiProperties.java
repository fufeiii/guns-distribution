package cn.stylefeng.guns.modular.distribution.properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * api相关设置
 *
 * @author Fu Fei
 * @date 2020/10/1
 */
@Getter
@Setter
@ConfigurationProperties(prefix = "dist.api")
@Component
public class ApiProperties {

    private Boolean enable;

    private Long tokenExpiredMonth;

}
