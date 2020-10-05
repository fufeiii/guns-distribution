package cn.stylefeng.guns.base.db.dao.sqls;

/**
 * 异构sql获取
 *
 * @author fengshuonan
 * @date 2019-07-16-13:13
 */
public abstract class AbstractSql {

    /**
     * 获取异构sql
     *
     * @author fengshuonan
     * @Date 2019-07-16 13:14
     */
    public String getSql(String jdbcUrl) {
        if (jdbcUrl.contains("oracle")) {
            return oracle();
        } else if (jdbcUrl.contains("postgresql")) {
            return pgSql();
        } else if (jdbcUrl.contains("sqlserver")) {
            return sqlServer();
        } else {
            return mysql();
        }
    }

    protected abstract String mysql();

    protected abstract String sqlServer();

    protected abstract String pgSql();

    protected abstract String oracle();

}
