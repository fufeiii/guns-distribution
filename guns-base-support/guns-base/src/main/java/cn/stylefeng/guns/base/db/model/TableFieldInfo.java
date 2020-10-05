package cn.stylefeng.guns.base.db.model;

import lombok.Data;

/**
 * 字段详情
 *
 * @author fengshuonan
 * @date 2020-01-19-5:40 下午
 */
@Data
public class TableFieldInfo {

    /**
     * 字段名称(和数据库中的字段名称一致，可能为带下划线的)
     */
    private String columnName;

    /**
     * 驼峰命名法的名称
     */
    private String camelFieldName;

    /**
     * 字段注释
     */
    private String columnComment;

}
