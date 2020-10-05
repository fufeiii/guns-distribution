package cn.stylefeng.guns.modular.distribution.enums;

/**
 * 此接口仅供分销业务所用到的枚举类使用
 * 其目的是希望把枚举类当作一个javabean输出
 * 详情查看{@link cn.stylefeng.guns.config.json.filter.EnumAccessValueFilter}
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
public interface EnumAccess {

    /**
     * key 前端需要显示的关于code的字段的字段名
     *
     * @return 字段名
     */
    default String getCodeFieldName() {
        return "code";
    }

    /**
     * key 前端需要显示的关于message的字段的字段名
     *
     * @return 字段名
     */
    default String getMessageFieldName() {
        return "message";
    }

    /**
     * key 前端需要显示的关于枚举常量的name的字段的字段名
     *
     * @return 字段名
     */
    default String getEnumFieldName() {
        return "name";
    }

    /**
     * value 枚举类的name值
     *
     * @return name属性值
     */
    String getName();


    /**
     * value 获得当前枚举类的code值
     *
     * @return 值
     */
    Integer getCode();

    /**
     * value 获得当前枚举类的message值
     *
     * @return 值
     */
    String getMessage();
}
