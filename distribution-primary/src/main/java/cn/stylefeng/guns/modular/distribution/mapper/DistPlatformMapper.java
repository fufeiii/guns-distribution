package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistPlatform;
import cn.stylefeng.guns.modular.distribution.model.dto.DistPlatformDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistPlatformVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 平台 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistPlatformMapper extends BaseMapper<DistPlatform> {

    /**
     * 获取列表
     */
    List<DistPlatformVO> customList(@Param("paramCondition") DistPlatformDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistPlatformDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistPlatformVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistPlatformDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistPlatformDTO paramCondition);

    /**
     * 查找平台是否存在
     */
    Integer exists(@Param("username")String platformUsername);
}
