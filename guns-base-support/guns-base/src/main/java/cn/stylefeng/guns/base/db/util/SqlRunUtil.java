package cn.stylefeng.guns.base.db.util;

import cn.stylefeng.guns.base.db.context.DataSourceContext;
import cn.stylefeng.guns.base.db.context.SqlSessionFactoryContext;
import cn.stylefeng.roses.core.config.properties.DruidProperties;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.jdbc.datasource.init.ScriptUtils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * sql文件执行
 *
 * @author fengshuonan
 * @date 2019-06-18-17:10
 */
@Slf4j
public class SqlRunUtil {

    /**
     * 执行sql脚本文件，使用Spring工具类
     */
    public static void runClassPathSql(String classpathFileName, String dbName) {

        DruidProperties druidProperties = DataSourceContext.getDataSourcesConfs().get(dbName);

        try {
            Class.forName(druidProperties.getDriverClassName());
            Connection conn = DriverManager.getConnection(druidProperties.getUrl(), druidProperties.getUsername(), druidProperties.getPassword());

            ClassPathResource classPathResource = new ClassPathResource(classpathFileName);
            EncodedResource encodedResource = new EncodedResource(classPathResource, "utf-8");
            ScriptUtils.executeSqlScript(conn, encodedResource);
        } catch (Exception e) {
            log.error("执行sql错误！", e);
            throw new RuntimeException("执行sql错误！");
        }

    }

    /**
     * 执行系统路径sql的文件
     */
    public static void runFileSystemSql(String dbName, String sqlPath) {

        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryContext.getSqlSessionFactorys().get(dbName);

        try {
            SqlSession sqlSession = sqlSessionFactory.openSession();
            Connection conn = sqlSession.getConnection();

            FileSystemResource classPathResource = new FileSystemResource(sqlPath);
            EncodedResource encodedResource = new EncodedResource(classPathResource, "GBK");
            ScriptUtils.executeSqlScript(conn, encodedResource);
        } catch (Exception e) {
            log.error("执行sql错误！", e);
            throw new RuntimeException("执行sql错误！");
        }
    }

}
