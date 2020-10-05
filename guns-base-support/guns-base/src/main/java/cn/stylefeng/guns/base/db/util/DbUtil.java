package cn.stylefeng.guns.base.db.util;

import cn.hutool.core.util.StrUtil;
import cn.stylefeng.guns.base.db.dao.sqls.CreateDatabaseSql;
import cn.stylefeng.guns.base.db.dao.sqls.TableFieldListSql;
import cn.stylefeng.guns.base.db.dao.sqls.TableListSql;
import cn.stylefeng.guns.base.db.entity.DatabaseInfo;
import cn.stylefeng.guns.base.db.exception.DataSourceInitException;
import cn.stylefeng.guns.base.db.model.TableFieldInfo;
import cn.stylefeng.roses.core.config.properties.DruidProperties;
import cn.stylefeng.roses.kernel.model.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据库操作工具类
 *
 * @author fengshuonan
 * @Date 2019/1/13 18:34
 */
@Slf4j
public class DbUtil {

    /**
     * 查询某个数据库连接的所有表
     *
     * @author fengshuonan
     * @Date 2019-05-04 20:30
     */
    public static List<Map<String, Object>> selectTables(DatabaseInfo dbInfo) {
        List<Map<String, Object>> tables = new ArrayList<>();
        try {
            Class.forName(dbInfo.getJdbcDriver());
            Connection conn = DriverManager.getConnection(
                    dbInfo.getJdbcUrl(), dbInfo.getUserName(), dbInfo.getPassword());

            //获取数据库名称
            String dbName = getDbName(dbInfo);

            //构造查询语句
            PreparedStatement preparedStatement = conn.prepareStatement(new TableListSql().getSql(dbInfo.getJdbcUrl()));

            //拼接设置数据库名称
            if (!dbInfo.getJdbcUrl().contains("sqlserver") && !dbInfo.getJdbcUrl().contains("postgresql")) {
                preparedStatement.setString(1, dbName);
            }

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                HashMap<String, Object> map = new HashMap<>();
                String tableName = resultSet.getString("tableName");
                String tableComment = resultSet.getString("tableComment");
                map.put("tableName", tableName);
                map.put("tableComment", tableComment);
                tables.add(map);
            }
            return tables;
        } catch (Exception ex) {
            log.error("查询所有表错误！", ex);
            throw new DataSourceInitException(DataSourceInitException.ExEnum.QUERY_DATASOURCE_INFO_ERROR);
        }
    }

    /**
     * 查询某个表的所有字段
     *
     * @author fengshuonan
     * @Date 2019-05-04 20:31
     */
    public static List<TableFieldInfo> getTableFields(DatabaseInfo dbInfo, String tableName) {
        ArrayList<TableFieldInfo> fieldList = new ArrayList<>();
        try {
            Class.forName(dbInfo.getJdbcDriver());
            Connection conn = DriverManager.getConnection(
                    dbInfo.getJdbcUrl(), dbInfo.getUserName(), dbInfo.getPassword());

            PreparedStatement preparedStatement = conn.prepareStatement(new TableFieldListSql().getSql(dbInfo.getJdbcUrl()));

            if (dbInfo.getJdbcUrl().contains("oracle")) {
                preparedStatement.setString(1, tableName);
            } else if (dbInfo.getJdbcUrl().contains("postgresql")) {
                preparedStatement.setString(1, tableName);
            } else if (dbInfo.getJdbcUrl().contains("sqlserver")) {
                preparedStatement.setString(1, tableName);
            } else {
                String dbName = getDbName(dbInfo);
                preparedStatement.setString(1, tableName);
                preparedStatement.setString(2, dbName);
            }

            //执行查询
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                TableFieldInfo tableFieldInfo = new TableFieldInfo();
                String columnName = resultSet.getString("columnName");
                String columnComment = resultSet.getString("columnComment");
                tableFieldInfo.setColumnName(columnName);
                tableFieldInfo.setColumnComment(columnComment);
                tableFieldInfo.setCamelFieldName(StrUtil.toCamelCase(columnName));
                fieldList.add(tableFieldInfo);
            }
            return fieldList;
        } catch (Exception ex) {
            log.error("查询表的所有字段错误！", ex);
            throw new DataSourceInitException(DataSourceInitException.ExEnum.QUERY_DATASOURCE_INFO_ERROR);
        }
    }

    /**
     * 创建数据库
     *
     * @author fengshuonan
     * @Date 2019-06-18 15:29
     */
    public static void createDatabase(DruidProperties druidProperties, String databaseName) {
        try {
            Class.forName(druidProperties.getDriverClassName());
            Connection conn = DriverManager.getConnection(druidProperties.getUrl(), druidProperties.getUsername(), druidProperties.getPassword());

            //创建sql
            String sql = new CreateDatabaseSql().getSql(druidProperties.getUrl());
            sql = sql.replaceAll("\\?", databaseName);

            PreparedStatement preparedStatement = conn.prepareStatement(sql);

            int i = preparedStatement.executeUpdate();
            log.info("创建数据库！数量：" + i);

        } catch (Exception ex) {
            log.error("执行sql出现问题！", ex);
            throw new ServiceException(500, "创建多租户-执行sql出现问题！");
        }
    }

    /**
     * 获取数据库名称
     *
     * @author fengshuonan
     * @Date 2019-06-18 15:25
     */
    private static String getDbName(DatabaseInfo dbInfo) {

        if (dbInfo.getJdbcUrl().contains("oracle")) {

            //如果是oracle，直接返回username
            return dbInfo.getUserName();

        } else if (dbInfo.getJdbcUrl().contains("postgresql")) {

            //postgresql，直接返回最后一个/后边的字符
            int first = dbInfo.getJdbcUrl().lastIndexOf("/") + 1;
            return dbInfo.getJdbcUrl().substring(first);

        } else if (dbInfo.getJdbcUrl().contains("sqlserver")) {

            //sqlserver，直接返回最后一个=后边的字符
            int first = dbInfo.getJdbcUrl().lastIndexOf("=") + 1;
            return dbInfo.getJdbcUrl().substring(first);

        } else {

            //mysql，返回/和?之间的字符
            String jdbcUrl = dbInfo.getJdbcUrl();
            int first = jdbcUrl.lastIndexOf("/") + 1;
            int last = jdbcUrl.indexOf("?");
            return jdbcUrl.substring(first, last);
        }
    }
}
