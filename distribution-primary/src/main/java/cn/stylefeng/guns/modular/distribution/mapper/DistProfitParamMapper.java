package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistProfitParam;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitParamVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 分润参数 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitParamMapper extends BaseMapper<DistProfitParam> {

    /**
     * 获取列表
     */
    List<DistProfitParamVO> customList(@Param("paramCondition") DistProfitParamDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistProfitParamDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistProfitParamVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistProfitParamDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistProfitParamDTO paramCondition);

}
