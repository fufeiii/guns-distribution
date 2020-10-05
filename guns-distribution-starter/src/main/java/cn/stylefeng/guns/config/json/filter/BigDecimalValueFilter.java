package cn.stylefeng.guns.config.json.filter;

import com.alibaba.fastjson.serializer.ValueFilter;

import java.math.BigDecimal;

/**
 * 对BigDecimal保留两位小数显示
 * 关于取舍的问题 https://www.cnblogs.com/limin12891/p/11116680.html
 *
 * @author Fu Fei
 * @date 2020/8/2
 */
public class BigDecimalValueFilter implements ValueFilter {

    @Override
    public Object process(Object o, String name, Object value) {
        // o是待转换的对象，name是字段名，value是字段值
        if (value instanceof BigDecimal) {
            return ((BigDecimal) value).setScale(2, BigDecimal.ROUND_FLOOR).toPlainString();
        }
        return value;
    }

}
