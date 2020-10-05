package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.stylefeng.guns.modular.distribution.api.response.MemberIndex;
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
import java.util.*;
import java.util.concurrent.*;

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
    public SummaryNumsVO summaryNums() throws InterruptedException, ExecutionException {
        String tenant = TenantHelper.getTenant();
        Date now = DateUtil.date();
        DateTime beginOfWeek = DateUtil.beginOfWeek(now);
        DateTime endOfWeek = DateUtil.endOfWeek(now);
        DateTime beginOfMonth = DateUtil.beginOfMonth(now);
        DateTime endOfMonth = DateUtil.endOfMonth(now);

        CompletionService<SummaryNumsVO.Nums> completionService = new ExecutorCompletionService<>(executorService);

        // 会员新增数
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            int memTiny = distMemberService.countBetweenDate(beginOfWeek, endOfWeek);
            int memLarge = distMemberService.countBetweenDate(beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            return new SummaryNumsVO.Nums().setGroup(SummaryNumsVO.MEMBER_GROUP).setTiny(memTiny).setLarge(memLarge);
        });

        // 商品交易额
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal traTiny = distProfitEventService.findTradeMoney(null, beginOfWeek, endOfWeek);
            BigDecimal traLarge = distProfitEventService.findTradeMoney(null, beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            return new SummaryNumsVO.Nums().setGroup(SummaryNumsVO.TRADE_GROUP).setTiny(traTiny).setLarge(traLarge);
        });

        // 订单交易数
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            QueryWrapper<DistProfitEvent> ordQuery1 = new QueryWrapper<DistProfitEvent>()
                    .eq("profit_type", ProfitTypeEnum.TRADE.getCode())
                    .between("create_time", beginOfWeek, endOfWeek);
            int ordTiny = distProfitEventService.count(ordQuery1);
            QueryWrapper<DistProfitEvent> ordQuery2 = new QueryWrapper<DistProfitEvent>()
                    .eq("profit_type", ProfitTypeEnum.TRADE.getCode())
                    .between("create_time", beginOfMonth, endOfMonth);
            int ordLarge = distProfitEventService.count(ordQuery2);
            this.finishTransaction(transactionStatus);
            return new SummaryNumsVO.Nums().setGroup(SummaryNumsVO.ORDER_GROUP).setTiny(ordTiny).setLarge(ordLarge);
        });

        // 佣金支出额
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal proTiny = distProfitEventService.findProfitMoney(null, beginOfWeek, endOfWeek);
            BigDecimal proLarge = distProfitEventService.findProfitMoney(null, beginOfMonth, endOfMonth);
            this.finishTransaction(transactionStatus);
            return new SummaryNumsVO.Nums().setGroup(SummaryNumsVO.PROFIT_GROUP).setTiny(proTiny).setLarge(proLarge);
        });


        SummaryNumsVO summaryNumsVO = new SummaryNumsVO();
        // 开启了4个异步线程，所以轮询4次
        for (int i = 0; i < 4; i++) {
            SummaryNumsVO.Nums nums = completionService.take().get();
            if (SummaryNumsVO.MEMBER_GROUP.equals(nums.getGroup())) {
                summaryNumsVO.setMember(nums);
            } else if (SummaryNumsVO.TRADE_GROUP.equals(nums.getGroup())) {
                summaryNumsVO.setTrade(nums);
            } else if (SummaryNumsVO.PROFIT_GROUP.equals(nums.getGroup())) {
                summaryNumsVO.setProfit(nums);
            } else if (SummaryNumsVO.ORDER_GROUP.equals(nums.getGroup())) {
                summaryNumsVO.setOrder(nums);
            }
        }

        return summaryNumsVO;
    }


    @Transactional(readOnly = true)
    @Override
    public List<DistMemberVO> memberTop4Web(Integer top) {
        return distMemberService.memberTop4Web(top);
    }


    @Transactional(readOnly = true)
    @Override
    public MemberIndex memberIndex4App(String memberUsername) throws InterruptedException, ExecutionException {
        // 验证会员是否存在
        DistMember member = distMemberService.findByMemberUsername(memberUsername);
        AssertHelper.isTrue(Objects.nonNull(member), DistributionException.BizEnum.MEMBER_NOT_EXIST);

        Date now = DateUtil.date();
        DateTime beginOfDay = DateUtil.beginOfDay(now);
        DateTime endOfDay = DateUtil.endOfDay(now);
        String tenant = TenantHelper.getTenant();

        CompletionService<Map<String, Object>> completionService = new ExecutorCompletionService<>(executorService);

        // 今日模块（今日分销出去的产品/商品，下单总金额） && 今日收益（今日分润获利金额） && 今日邀请会员人数
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            BigDecimal tradeMoney = distProfitEventService.findTradeMoney(memberUsername, beginOfDay, endOfDay);
            BigDecimal profitMoney = distProfitEventService.findProfitMoney(memberUsername, beginOfDay, endOfDay);
            QueryWrapper<DistMember> memberQueryWrapper = new QueryWrapper<DistMember>()
                    .eq("fir_parent", memberUsername)
                    .between("create_time", beginOfDay, endOfDay);
            int inviteCount = distMemberService.count(memberQueryWrapper);
            this.finishTransaction(transactionStatus);
            MemberIndex.Today today = new MemberIndex.Today();
            today.setTradeMoney(tradeMoney);
            today.setProfitMoney(profitMoney);
            today.setInviteCount(inviteCount);
            HashMap<String, Object> todayMap = CollUtil.newHashMap(1);
            todayMap.put(MemberIndex.TODAY_GROUP, today);
            return todayMap;
        });

        // 提现模块
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            // 已提现金额
            BigDecimal doneRemit = distWithdrawRecordService.findWithdrawMoney(memberUsername, DisposeStateEnum.DONE_REMIT);
            // 未结算金额
            BigDecimal waitRemit = distWithdrawRecordService.findWithdrawMoney(memberUsername, DisposeStateEnum.WAIT_REMIT);
            this.finishTransaction(transactionStatus);
            MemberIndex.Withdraw withdraw = new MemberIndex.Withdraw();
            withdraw.setDoneRemit(doneRemit);
            withdraw.setWaitRemit(waitRemit);
            HashMap<String, Object> withdrawMap = CollUtil.newHashMap(1);
            withdrawMap.put(MemberIndex.WITHDRAW_GROUP, withdraw);
            return withdrawMap;
        });

        // 汇总模块
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            // 推广佣金（总获利分润金额）
            BigDecimal allProfitMoney = distProfitEventService.findProfitMoney(memberUsername, null, null);
            // 分销订单（即直接或间接获得【商品交易】这种分润的所有订单金额）
            BigDecimal allTradeMoney = distProfitEventService.findTradeMoney(memberUsername, null, null);
            // 提现明细 （总的可提现金额）
            BigDecimal alAvailableWithdraw = distMemberService.account(member.getId()).getMoneyAvailable();
            // 我的团队 （我的一二三下级的总数）
            QueryWrapper<DistMember> queryWrapper = new QueryWrapper<DistMember>()
                    .eq("fir_parent", memberUsername)
                    .or().eq("sec_parent", memberUsername)
                    .or().eq("thr_parent", memberUsername);
            int allTeamCount = distMemberService.count(queryWrapper);
            this.finishTransaction(transactionStatus);
            MemberIndex.Summary summary = new MemberIndex.Summary();
            summary.setAllProfitMoney(allProfitMoney);
            summary.setAllTradeMoney(allTradeMoney);
            summary.setAllAvailableWithdraw(alAvailableWithdraw);
            summary.setAllTeamCount(allTeamCount);
            HashMap<String, Object> summaryMap = CollUtil.newHashMap(1);
            summaryMap.put(MemberIndex.SUMMARY_GROUP, summary);
            return summaryMap;
        });

        // 会员模块
        completionService.submit(() -> {
            TransactionStatus transactionStatus = this.startTransaction(tenant);
            DistMember parentMember = distMemberService.findByMemberUsername(member.getFirParent());
            this.finishTransaction(transactionStatus);
            MemberIndex.Member currentMember = new MemberIndex.Member();
            currentMember.setMemberId(member.getId());
            currentMember.setMemberUsername(member.getMemberUsername());
            currentMember.setMemberNickname(member.getMemberNickname());
            currentMember.setMemberRank(member.getMemberRank().getMessage());
            if (Objects.nonNull(parentMember)) {
                currentMember.setParent(parentMember.getMemberNickname());
            } else {
                currentMember.setParent("无");
            }
            HashMap<String, Object> memberMap = CollUtil.newHashMap(1);
            memberMap.put(MemberIndex.MEMBER_GROUP, currentMember);
            return memberMap;
        });

        // 开启了4个异步线程，所以轮询4次
        MemberIndex memberIndex = new MemberIndex();
        for (int i = 0; i < 4; i++) {
            Map<String, Object> data = completionService.take().get();
            String groupName = data.keySet().iterator().next();
            Object group = data.get(groupName);
            if (MemberIndex.MEMBER_GROUP.equals(groupName)) {
                memberIndex.setMember((MemberIndex.Member) group);
            } else if (MemberIndex.WITHDRAW_GROUP.equals(groupName)) {
                memberIndex.setWithdraw((MemberIndex.Withdraw) group);
            } else if (MemberIndex.TODAY_GROUP.equals(groupName)) {
                memberIndex.setToday((MemberIndex.Today) group);
            } else if (MemberIndex.SUMMARY_GROUP.equals(groupName)) {
                memberIndex.setSummary((MemberIndex.Summary) group);
            }
        }
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
