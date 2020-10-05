package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistWithdrawRecord;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistWithdrawRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * <p>
 * 提现申请记录 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistWithdrawRecordMapper extends BaseMapper<DistWithdrawRecord> {

    /**
     * 获取分页实体列表
     */
    Page<DistWithdrawRecordVO> customPageList(@Param("page") Page<DistWithdrawRecordVO> page, @Param("paramCondition") DistWithdrawRecordDTO paramCondition);


    /**
     * 查询某个状态的总金额
     */
    BigDecimal withdrawMoney(@Param("memberUsername") String memberUsername, @Param("disposeState") int disposeState);
}
