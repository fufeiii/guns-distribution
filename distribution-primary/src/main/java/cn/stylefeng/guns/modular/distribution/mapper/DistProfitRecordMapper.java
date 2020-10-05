package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistProfitRecord;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 分润记录 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitRecordMapper extends BaseMapper<DistProfitRecord> {

    /**
     * 获取列表
     */
    List<DistProfitRecordVO> customList(@Param("paramCondition") DistProfitRecordDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistProfitRecordDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistProfitRecordVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistProfitRecordDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistProfitRecordDTO paramCondition);

}
