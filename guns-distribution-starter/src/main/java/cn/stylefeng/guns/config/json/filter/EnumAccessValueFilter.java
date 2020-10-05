package cn.stylefeng.guns.config.json.filter;

import cn.stylefeng.guns.modular.distribution.enums.EnumAccess;
import com.alibaba.fastjson.serializer.ValueFilter;

import java.util.HashMap;
import java.util.Map;

/**
 * 通过{@link EnumAccess}接口和当前ValueFilter
 * 间接实现分销模块中的枚举类序列化成更加友好json格式
 *
 * @author Fu Fei
 * @date 2020/8/2
 */
public class EnumAccessValueFilter implements ValueFilter {

    @Override
    public Object process(Object o, String name, Object value) {
        // o是待转换的对象，name是字段名，value是字段值
        if (value instanceof EnumAccess) {
            EnumAccess enumAccess = (EnumAccess) value;
            Map<String, Object> map = new HashMap<>(3);
            map.put(enumAccess.getEnumFieldName(), enumAccess.getName());
            map.put(enumAccess.getCodeFieldName(), enumAccess.getCode());
            map.put(enumAccess.getMessageFieldName(), enumAccess.getMessage());
            return map;
        }
        return value;
    }

}
