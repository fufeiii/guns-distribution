package cn.stylefeng.guns.config;

import cn.stylefeng.guns.sys.core.properties.BeetlProperties;
import cn.stylefeng.guns.sys.core.properties.GunsProperties;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * 项目中的配置
 *
 * @author fengshuonan
 * @Date 2019/5/10 22:45
 */
@Configuration
public class GunsPropertiesConfig {

    @Bean
    public RestTemplate restTemplate() {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        // 设置建立连接超时时间毫秒
        requestFactory.setConnectTimeout(30000);
        // 设置读取数据超时时间毫秒
        requestFactory.setReadTimeout(30000);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        // StringHttpMessageConverter 默认使用 IS0-8859-编码，此处修改为 UTF-8
        List<HttpMessageConverter<?>> messageConverters = restTemplate.getMessageConverters();
        for (HttpMessageConverter<?> converter : messageConverters) {
            if (converter instanceof StringHttpMessageConverter) {
                ((StringHttpMessageConverter) converter).setDefaultCharset(StandardCharsets.UTF_8);
            }
        }
        // 跟随系统，使用FastJson
        messageConverters.add(new FastJsonHttpMessageConverter());
        restTemplate.setMessageConverters(messageConverters);
        return restTemplate;
    }


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
