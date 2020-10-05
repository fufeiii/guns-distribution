package cn.stylefeng.guns.base.db.dao.sqls;

import lombok.Getter;

/**
 * 删除数据源sql
 *
 * @author fengshuonan
 * @date 2019-07-16-13:06
 */
@Getter
public class DeleteDatabaseInfoSql extends AbstractSql {

    @Override
    protected String mysql() {
        return "DELETE from database_info where db_name = ?";
    }

    @Override
    protected String sqlServer() {
        return "DELETE from database_info where db_name = ?";
    }

    @Override
    protected String pgSql() {
        return "DELETE from database_info where db_name = ?";
    }

    @Override
    protected String oracle() {
        return "DELETE from database_info where db_name = ?";
    }
}
