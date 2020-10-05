package cn.stylefeng.guns.config.datasource;

import cn.hutool.core.util.ArrayUtil;
import cn.stylefeng.guns.base.auth.context.LoginContextHolder;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import cn.stylefeng.roses.core.metadata.CustomMetaObjectHandler;
import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * mp的插件拓展和资源扫描
 *
 * @author fengshuonan
 * @date 2019/5/10 21:33
 */
@Configuration
@MapperScan(basePackages = {"cn.stylefeng.**.mapper"})
public class PluginsConfig {

    /**
     * guns相关的表，不需要多租户
     */
    private final String[] gunsIgnoreTables = {"database_info", "excel_export_deploy", "oauth_user_info", "sys_config", "sys_dept"
            , "sys_dict", "sys_dict_type", "sys_file_info", "sys_login_log", "sys_menu", "sys_notice", "sys_operation_log", "sys_position"
            , "sys_relation", "sys_role", "sys_user", "sys_user_pos"};

    /**
     * 分销模块不需要多租户的表
     */
    private final String[] distIgnoreTables = {"dist_platform", "dist_account", "dist_profit_record"};

    /**
     * 多租户标识字段
     */
    private final String tenantId = "platform_username";


    /**
     * 重新对分页器做一些自定义操作
     * {@link cn.stylefeng.roses.core.config.MybatisPluginAutoConfiguration}
     * 这里注入了PaginationInterceptor
     */
    @Autowired
    public void paginationInterceptor(PaginationInterceptor paginationInterceptor) {
        // 【多租户】 SQL 解析处理拦截器
        List<ISqlParser> sqlParserList = new ArrayList<>();
        TenantSqlParser tenantSqlParser = new TenantSqlParser();
        tenantSqlParser.setTenantHandler(new TenantHandler() {
            @Override
            public Expression getTenantId(boolean select) {
                // select since: 3.3.2，参数 true 表示为 select 下的 where 条件,false 表示 insert/update/delete 下的条件
                // 只有 select 下才允许多参(ValueListExpression),否则只支持单参
                // LoginContextHolder其底层也是走的sessionManager获得用户，即platform_username
                return new StringValue(TenantHelper.getTenant());
            }

            @Override
            public String getTenantIdColumn() {
                // 租户字段名
                return tenantId;
            }

            @Override
            public boolean doTableFilter(String tableName) {
                // 忽略不需要走租户的字段的表
                return Arrays.stream(ArrayUtil.addAll(gunsIgnoreTables, distIgnoreTables))
                        .anyMatch((e) -> e.equalsIgnoreCase(tableName));
            }
        });
        sqlParserList.add(tenantSqlParser);
        paginationInterceptor.setSqlParserList(sqlParserList);

    }

    /**
     * 拓展核心包中的字段包装器
     *
     * @author fengshuonan
     * @Date 2019/5/10 21:35
     */
    @Bean
    public CustomMetaObjectHandler gunsMpFieldHandler() {
        return new CustomMetaObjectHandler() {
            @Override
            protected Object getUserUniqueId() {
                return LoginContextHolder.getContext().getUser().getId();
            }
        };
    }

}
