package cn.stylefeng.guns.config.json;

import cn.stylefeng.guns.config.json.filter.BigDecimalValueFilter;
import cn.stylefeng.roses.core.converter.CustomFastJsonHttpMessageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 对默认配置的fastjson做自定义修改
 *
 * @author Fu Fei
 * @date 2020/8/2
 */
@Component
public class CustomFastJsonConfig {

    /**
     * 对guns配置的FastJson做一些个性化操作
     *
     * @param converter converter
     */
    @Autowired
    public CustomFastJsonConfig(CustomFastJsonHttpMessageConverter converter) {
        converter.getFastJsonConfig()
                .setSerializeFilters(new BigDecimalValueFilter());
    }

}
