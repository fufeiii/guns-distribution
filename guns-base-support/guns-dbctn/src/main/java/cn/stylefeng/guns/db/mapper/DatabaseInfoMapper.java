package cn.stylefeng.guns.db.mapper;

import cn.stylefeng.guns.base.db.entity.DatabaseInfo;
import cn.stylefeng.guns.base.db.model.params.DatabaseInfoParam;
import cn.stylefeng.guns.base.db.model.result.DatabaseInfoResult;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 数据库信息表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-15
 */
public interface DatabaseInfoMapper extends BaseMapper<DatabaseInfo> {

    /**
     * 获取列表
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    List<DatabaseInfoResult> customList(@Param("paramCondition") DatabaseInfoParam paramCondition);

    /**
     * 获取map列表
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DatabaseInfoParam paramCondition);

    /**
     * 获取分页实体列表
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    Page<DatabaseInfoResult> customPageList(@Param("page") Page page, @Param("paramCondition") DatabaseInfoParam paramCondition);

    /**
     * 获取分页map列表
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DatabaseInfoParam paramCondition);

}
