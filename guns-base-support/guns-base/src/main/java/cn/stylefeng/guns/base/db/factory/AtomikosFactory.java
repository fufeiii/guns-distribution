package cn.stylefeng.guns.base.db.factory;

import cn.stylefeng.roses.core.config.properties.DruidProperties;
import com.atomikos.jdbc.AtomikosDataSourceBean;
import com.atomikos.jdbc.AtomikosSQLException;

import java.util.Properties;

/**
 * AtomikosDataSourceBean数据源工厂
 *
 * @author fengshuonan
 * @Date 2019/11/19 18:22
 */
public class AtomikosFactory {

    public static AtomikosDataSourceBean create(String dataSourceName, DruidProperties druidProperties) {
        AtomikosDataSourceBean atomikosDataSourceBean = new AtomikosDataSourceBean();
        atomikosDataSourceBean.setXaDataSourceClassName("com.alibaba.druid.pool.xa.DruidXADataSource");
        atomikosDataSourceBean.setUniqueResourceName(dataSourceName);
        atomikosDataSourceBean.setMaxPoolSize(100);
        atomikosDataSourceBean.setBorrowConnectionTimeout(60);

        Properties properties = druidProperties.createProperties();
        atomikosDataSourceBean.setXaProperties(properties);

        try {
            atomikosDataSourceBean.init();
        } catch (AtomikosSQLException e) {
            e.printStackTrace();
        }

        return atomikosDataSourceBean;
    }

}
