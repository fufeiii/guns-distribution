package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.stylefeng.guns.modular.distribution.api.response.MemberIndexVO;
import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import cn.stylefeng.guns.modular.distribution.model.vo.SummaryNumsVO;
import cn.stylefeng.guns.modular.distribution.service.DistDashboardService;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.guns.modular.distribution.service.DistProfitEventService;
import cn.stylefeng.guns.modular.distribution.service.DistWithdrawRecordService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import cn.stylefeng.guns.modular.distribution.util.TransactionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;

/**
 * 控制台服务类
 *
 * @author Fu Fei
 * @date 2020/9/4
 */
@Service
public class DistDashboardServiceImpl implements DistDashboardService {

    @Qualifier("dashboardExecutorService")
    @Autowired
    private ExecutorService executorService;

    /**
     * 使用了多线程，需要使用编程式事务保证查询的数据的一致性
     */
    @Autowired
    private PlatformTransactionManager platformTransactionManager;
    @Autowired
    private TransactionDefinition transactionDefinition;

    @Autowired
    private DistMemberService distMemberService;
    @Autowired
    private DistProfitEventService distProfitEventService;
    @Autowired
    private DistWithdrawRecordService distWithdrawRecordService;


    @Transactional(readOnly = true)
    @Override
    public SummaryNumsVO summaryNums() {
        String tenant = TenantHelper.getTenant();
        Date now = DateUtil.date();
        DateTime beginOfWeek = DateUtil.beginOfWeek(now);
        DateTime endOfWeek = DateUtil.endOfWeek(now);
        DateTime beginOfMonth = DateUtil.beginOfMonth(now);
        DateTime endOfMonth = DateUtil.endOfMonth(now);
        SummaryNumsVO summaryNumsVO = new SummaryNumsVO();

        // 会员新增数
        CompletableFuture<Void> memTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            int memTiny = distMemberService.countBetweenDate(beginOfWeek, endOfWeek);
            int memLarge = distMemberService.countBetweenDate(beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            summaryNumsVO.setMember(new SummaryNumsVO.Nums().setTiny(memTiny).setLarge(memLarge));
        }, executorService);

        // 商品交易额
        CompletableFuture<Void> traTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal traTiny = distProfitEventService.findTradeMoney(null, beginOfWeek, endOfWeek);
            BigDecimal traLarge = distProfitEventService.findTradeMoney(null, beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            summaryNumsVO.setTrade(new SummaryNumsVO.Nums().setTiny(traTiny).setLarge(traLarge));
        }, executorService);

        // 订单交易数
        CompletableFuture<Void> ordTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            QueryWrapper<DistProfitEvent> ordQuery1 = new QueryWrapper<DistProfitEvent>().eq("profit_type", ProfitTypeEnum.TRADE.getCode())
                    .between("create_time", beginOfWeek, endOfWeek);
            int ordTiny = distProfitEventService.count(ordQuery1);
            QueryWrapper<DistProfitEvent> ordQuery2 = new QueryWrapper<DistProfitEvent>().eq("profit_type", ProfitTypeEnum.TRADE.getCode())
                    .between("create_time", beginOfMonth, endOfMonth);
            int ordLarge = distProfitEventService.count(ordQuery2);
            this.finishTransaction(transactionStatus);
            summaryNumsVO.setOrder(new SummaryNumsVO.Nums().setTiny(ordTiny).setLarge(ordLarge));
        }, executorService);

        // 佣金支出额
        CompletableFuture<Void> proTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal proTiny = distProfitEventService.findProfitMoney(null, beginOfWeek, endOfWeek);
            BigDecimal proLarge = distProfitEventService.findProfitMoney(null, beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            summaryNumsVO.setProfit(new SummaryNumsVO.Nums().setTiny(proTiny).setLarge(proLarge));
        }, executorService);

        // 等待所有任务完成
        CompletableFuture.allOf(memTask, traTask, ordTask, proTask).join();

        return summaryNumsVO;
    }


    @Transactional(readOnly = true)
    @Override
    public List<DistMemberVO> memberTop4Web(Integer top) {
        return distMemberService.memberTop4Web(top);
    }


    @Transactional(readOnly = true)
    @Override
    public MemberIndexVO memberIndex4App(String memberUsername) {
        // 验证会员是否存在
        DistMember member = distMemberService.findByMemberUsername(memberUsername);
        AssertHelper.isTrue(Objects.nonNull(member), DistributionException.BizEnum.MEMBER_NOT_EXIST);

        Date now = DateUtil.date();
        DateTime beginOfDay = DateUtil.beginOfDay(now);
        DateTime endOfDay = DateUtil.endOfDay(now);
        String tenant = TenantHelper.getTenant();
        MemberIndexVO memberIndex = new MemberIndexVO();

        // 今日模块（今日分销出去的产品/商品，下单总金额） && 今日收益（今日分润获利金额） && 今日邀请会员人数
        CompletableFuture<Void> todTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal tradeMoney = distProfitEventService.findTradeMoney(memberUsername, beginOfDay, endOfDay);
            BigDecimal profitMoney = distProfitEventService.findProfitMoney(memberUsername, beginOfDay, endOfDay);
            QueryWrapper<DistMember> memberQueryWrapper = new QueryWrapper<DistMember>().eq("fir_parent", memberUsername)
                    .between("create_time", beginOfDay, endOfDay);
            int inviteCount = distMemberService.count(memberQueryWrapper);
            this.finishTransaction(transactionStatus);
            memberIndex.setToday(new MemberIndexVO.Today().setTradeMoney(tradeMoney).setProfitMoney(profitMoney).setInviteCount(inviteCount));
        }, executorService);

        // 提现模块
        CompletableFuture<Void> witTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            // 已提现金额
            BigDecimal doneRemit = distWithdrawRecordService.findWithdrawMoney(memberUsername, DisposeStateEnum.DONE_REMIT);
            // 未结算金额
            BigDecimal waitRemit = distWithdrawRecordService.findWithdrawMoney(memberUsername, DisposeStateEnum.WAIT_REMIT);
            this.finishTransaction(transactionStatus);
            memberIndex.setWithdraw(new MemberIndexVO.Withdraw().setDoneRemit(doneRemit).setWaitRemit(waitRemit));
        }, executorService);

        // 汇总模块
        CompletableFuture<Void> sumTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            // 推广佣金（总获利分润金额）
            BigDecimal allProfitMoney = distProfitEventService.findProfitMoney(memberUsername, null, null);
            // 分销订单（即直接或间接获得【商品交易】这种分润的所有订单金额）
            BigDecimal allTradeMoney = distProfitEventService.findTradeMoney(memberUsername, null, null);
            // 提现明细 （总的可提现金额）
            BigDecimal allAvailableWithdraw = distMemberService.account(member.getId()).getMoneyAvailable();
            // 我的团队 （我的一二三下级的总数）
            QueryWrapper<DistMember> queryWrapper = new QueryWrapper<DistMember>()
                    .eq("fir_parent", memberUsername)
                    .or().eq("sec_parent", memberUsername)
                    .or().eq("thr_parent", memberUsername);
            int allTeamCount = distMemberService.count(queryWrapper);
            this.finishTransaction(transactionStatus);
            MemberIndexVO.Summary summary = new MemberIndexVO.Summary().setAllProfitMoney(allProfitMoney).setAllTradeMoney(allTradeMoney)
                    .setAllAvailableWithdraw(allAvailableWithdraw).setAllTeamCount(allTeamCount);
            memberIndex.setSummary(summary);
        }, executorService);

        // 会员模块
        CompletableFuture<Void> memTask = CompletableFuture.runAsync(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            DistMember parentMember = distMemberService.findByMemberUsername(member.getFirParent());
            this.finishTransaction(transactionStatus);
            MemberIndexVO.Member currentMember = new MemberIndexVO.Member();
            currentMember.setMemberId(member.getId());
            currentMember.setMemberUsername(member.getMemberUsername());
            currentMember.setMemberNickname(member.getMemberNickname());
            currentMember.setMemberRank(member.getMemberRank().getMessage());
            if (Objects.nonNull(parentMember)) {
                currentMember.setParent(parentMember.getMemberNickname());
            } else {
                currentMember.setParent("无");
            }
            memberIndex.setMember(currentMember);
        }, executorService);

        // 等待...
        CompletableFuture.allOf(todTask, witTask, sumTask, memTask).join();

        return memberIndex;
    }


    /**
     * 准备dao层的环境
     * 设置租户 && 开启新事务
     */
    private TransactionStatus startTransaction(String tenant) {
        TenantHelper.setTenant(tenant);
        return TransactionUtil.getTransaction(platformTransactionManager, transactionDefinition);
    }

    /**
     * 提交本次查询事务
     */
    private void finishTransaction(TransactionStatus transactionStatus) {
        TransactionUtil.commit(platformTransactionManager, transactionStatus);
    }


}
