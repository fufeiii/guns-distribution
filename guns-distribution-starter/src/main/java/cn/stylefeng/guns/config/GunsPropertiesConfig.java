package cn.stylefeng.guns.config;

import cn.stylefeng.guns.sys.core.properties.BeetlProperties;
import cn.stylefeng.guns.sys.core.properties.GunsProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 项目中的配置
 *
 * @author fengshuonan
 * @Date 2019/5/10 22:45
 */
@Configuration
public class GunsPropertiesConfig {

    /**
     * beetl模板的配置
     *
     * @author fengshuonan
     * @Date 2019-06-13 08:55
     */
    @Bean
    @ConfigurationProperties(prefix = BeetlProperties.BEETLCONF_PREFIX)
    public BeetlProperties beetlProperties() {
        return new BeetlProperties();
    }

    /**
     * Guns的属性配置
     *
     * @author fengshuonan
     * @Date 2019-06-13 08:56
     */
    @Bean
    @ConfigurationProperties(prefix = GunsProperties.PREFIX)
    public GunsProperties gunsProperties() {
        return new GunsProperties();
    }

}
