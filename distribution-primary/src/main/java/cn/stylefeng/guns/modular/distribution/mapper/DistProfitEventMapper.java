package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitEventVO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitEventMapper extends BaseMapper<DistProfitEvent> {

    /**
     * 获取列表
     */
    List<DistProfitEventVO> customList(@Param("paramCondition") DistProfitEventDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistProfitEventDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistProfitEventVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistProfitEventDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistProfitEventDTO paramCondition);

    /**
     * 查看当前事件所属的分润记录
     */
    Page<DistProfitRecordVO> records(@Param("page") Page page, @Param("eventId") Long eventId);

    /**
     * 统计交易金额
     * 仅限分润类型为 {@link  cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum#TRADE}
     */
    BigDecimal tradeMoney(@Param("impactMemberUsername") String impactMemberUsername, @Param("begin") Date begin, @Param("end") Date end);

    /**
     * 统计在一个时间段内产生的分润金额
     */
    BigDecimal profitMoney(@Param("impactMemberUsername") String impactMemberUsername, @Param("begin") Date begin, @Param("end") Date end);

    /**
     * 查询某个会员的分润记录
     */
    IPage<DistProfitRecordVO> findProfitRecordPage(@Param("page") Page page, @Param("memberUsername") String memberUsername, @Param("profitType") ProfitTypeEnum profitType, @Param("accountType") AccountTypeEnum accountType);

}
