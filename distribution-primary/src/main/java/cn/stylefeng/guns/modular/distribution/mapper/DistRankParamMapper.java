package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistRankParam;
import cn.stylefeng.guns.modular.distribution.model.dto.DistRankParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistRankParamVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 段位配置 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistRankParamMapper extends BaseMapper<DistRankParam> {

    /**
     * 获取列表
     */
    List<DistRankParamVO> customList(@Param("paramCondition") DistRankParamDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistRankParamDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistRankParamVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistRankParamDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistRankParamDTO paramCondition);

}
