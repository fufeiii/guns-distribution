package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitEventVO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitEventService extends IService<DistProfitEvent> {

    /**
     * 查询最近发生的分润的动态
     * 默认查最新的10条数据
     */
    List<DistProfitEventVO> findLatestList();

    /**
     * 查询分页数据，Specification模式
     */
    LayuiPageInfo findPageBySpec(DistProfitEventDTO param);

    /**
     * 查看当前事件所属的分润记录
     */
    LayuiPageInfo findRecords(Long eventId);

    /**
     * 统计交易金额
     * 仅限分润类型为 {@link  cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum#TRADE}
     *
     * @param impactMemberUsername 获利人
     * @param begin                开始时间
     * @param end                  结束时间
     */
    BigDecimal findTradeMoney(String impactMemberUsername, Date begin, Date end);


    /**
     * 统分润金额
     * 仅限分润类型为 {@link  cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum#TRADE}
     *
     * @param impactMemberUsername 获利人
     * @param begin                开始时间
     * @param end                  结束时间
     */
    BigDecimal findProfitMoney(String impactMemberUsername, Date begin, Date end);

    /**
     * app端查询某个会员的分润佣金记录
     */
    IPage<DistProfitRecordVO> findProfitRecordPage4App(String memberUsername, ProfitTypeEnum profitType);


}
