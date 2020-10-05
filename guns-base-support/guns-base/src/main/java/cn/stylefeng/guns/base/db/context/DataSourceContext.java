package cn.stylefeng.guns.base.db.context;

import cn.stylefeng.guns.base.db.dao.DataBaseInfoDao;
import cn.stylefeng.guns.base.db.factory.AtomikosFactory;
import cn.stylefeng.roses.core.config.properties.DruidProperties;

import javax.sql.DataSource;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 数据源的上下文容器(单例)
 *
 * @author fengshuonan
 * @date 2019-06-12-13:37
 */
public class DataSourceContext {

    /**
     * 主数据源名称
     */
    public static final String MASTER_DATASOURCE_NAME = "master";

    /**
     * 数据源容器
     */
    private static Map<String, DataSource> DATA_SOURCES = new ConcurrentHashMap<>();

    /**
     * 数据源的配置容器
     */
    private static Map<String, DruidProperties> DATA_SOURCES_CONF = new ConcurrentHashMap<>();

    /**
     * 初始化所有dataSource
     *
     * @author fengshuonan
     * @Date 2019-06-12 13:48
     */
    public static void initDataSource(DruidProperties masterDataSourceProperties, DataSource dataSourcePrimary) {

        //清空数据库中的主数据源信息
        new DataBaseInfoDao(masterDataSourceProperties).deleteMasterDatabaseInfo();

        //初始化主数据源信息
        new DataBaseInfoDao(masterDataSourceProperties).createMasterDatabaseInfo();

        //从数据库中获取所有的数据源信息
        DataBaseInfoDao dataBaseInfoDao = new DataBaseInfoDao(masterDataSourceProperties);
        Map<String, DruidProperties> allDataBaseInfo = dataBaseInfoDao.getAllDataBaseInfo();

        //赋给全局变量
        DATA_SOURCES_CONF = allDataBaseInfo;

        //根据数据源信息初始化所有的DataSource
        for (Map.Entry<String, DruidProperties> entry : allDataBaseInfo.entrySet()) {

            String dbName = entry.getKey();
            DruidProperties druidProperties = entry.getValue();

            //如果是主数据源，不用初始化第二遍，如果是其他数据源就通过property初始化
            if (dbName.equalsIgnoreCase(MASTER_DATASOURCE_NAME)) {
                DATA_SOURCES_CONF.put(dbName, druidProperties);
                DATA_SOURCES.put(dbName, dataSourcePrimary);
            } else {
                DataSource dataSource = createDataSource(dbName, druidProperties);
                DATA_SOURCES.put(dbName, dataSource);
            }
        }
    }

    /**
     * 新增datasource
     *
     * @author fengshuonan
     * @Date 2019-06-12 14:51
     */
    public static void addDataSource(String dbName, DataSource dataSource) {
        DATA_SOURCES.put(dbName, dataSource);
    }

    /**
     * 获取数据源
     *
     * @author fengshuonan
     * @Date 2019-06-12 13:50
     */
    public static Map<String, DataSource> getDataSources() {
        return DATA_SOURCES;
    }

    /**
     * 获取数据源的配置
     *
     * @author fengshuonan
     * @Date 2019-06-18 19:26
     */
    public static Map<String, DruidProperties> getDataSourcesConfs() {
        return DATA_SOURCES_CONF;
    }

    /**
     * 数据源创建模板
     */
    public static DataSource createDataSource(String dataSourceName, DruidProperties druidProperties) {

        //添加到全局配置里
        DATA_SOURCES_CONF.put(dataSourceName, druidProperties);

        return AtomikosFactory.create(dataSourceName, druidProperties);
    }

}
