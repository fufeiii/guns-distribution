package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistProfitEventMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitEventVO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.guns.modular.distribution.service.DistProfitEventService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * <p>
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistProfitEventServiceImpl extends ServiceImpl<DistProfitEventMapper, DistProfitEvent> implements DistProfitEventService {

    @Autowired
    private DistMemberService distMemberService;

    @Transactional(readOnly = true)
    @Override
    public List<DistProfitEventVO> findLatestList() {
        return baseMapper.customPageList(new Page<>(1, 8), new DistProfitEventDTO()).getRecords();
    }

    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findPageBySpec(DistProfitEventDTO param) {
        Page<DistProfitEventVO> pageContext = this.getPageContext();
        IPage<DistProfitEventVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findRecords(Long eventId) {
        Page<DistProfitRecordVO> pageContext = this.getPageContext();
        IPage<DistProfitRecordVO> page = baseMapper.records(pageContext, eventId);
        return LayuiPageFactory.createPageInfo(page);
    }

    @Transactional(readOnly = true)
    @Override
    public BigDecimal findTradeMoney(String impactMemberUsername, Date begin, Date end) {
        Optional<BigDecimal> money = Optional.ofNullable(baseMapper.tradeMoney(impactMemberUsername, begin, end));
        return money.orElse(BigDecimal.ZERO);
    }

    @Transactional(readOnly = true)
    @Override
    public BigDecimal findProfitMoney(String impactMemberUsername, Date begin, Date end) {
        Optional<BigDecimal> money = Optional.ofNullable(baseMapper.profitMoney(impactMemberUsername, begin, end));
        return money.orElse(BigDecimal.ZERO);
    }

    @Transactional(readOnly = true)
    @Override
    public IPage<DistProfitRecordVO> findProfitRecordPage4App(String memberUsername, ProfitTypeEnum profitType) {
        DistMember member = distMemberService.findByMemberUsername(memberUsername);
        AssertHelper.isTrue(Objects.nonNull(member), DistributionException.BizEnum.MEMBER_NOT_EXIST);
        Page<DistProfitRecordVO> pageContext = this.getPageContext();
        return baseMapper.findProfitRecordPage(pageContext, memberUsername, profitType, AccountTypeEnum.MONEY);
    }

    private <T> Page<T> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

}
