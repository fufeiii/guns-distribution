package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistAccountRecord;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 账户明细记录 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistAccountRecordMapper extends BaseMapper<DistAccountRecord> {

    /**
     * 获取列表
     */
    List<DistAccountRecordVO> customList(@Param("paramCondition") DistAccountRecordDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistAccountRecordDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistAccountRecordVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistAccountRecordDTO paramCondition);

}
