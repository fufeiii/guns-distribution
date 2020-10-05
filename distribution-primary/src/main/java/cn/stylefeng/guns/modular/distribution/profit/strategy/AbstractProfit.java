package cn.stylefeng.guns.modular.distribution.profit.strategy;

import cn.stylefeng.guns.modular.distribution.entity.*;
import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitEventVO;
import cn.stylefeng.guns.modular.distribution.profit.ProfitAccess;
import cn.stylefeng.guns.modular.distribution.profit.ProfitService;
import cn.stylefeng.guns.modular.distribution.service.*;
import cn.stylefeng.guns.modular.distribution.socket.ProfitEventWsHandler;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 分润策略抽象父类
 *
 * @author Fu Fei
 * @date 2020/8/10
 */
@Slf4j
public abstract class AbstractProfit implements ProfitService {
    @Autowired
    protected DistMemberService memberService;
    @Autowired
    protected DistPlatformService platformService;
    @Autowired
    protected DistProfitParamService profitParamService;
    @Autowired
    protected DistProfitEventService profitEventService;
    @Autowired
    protected DistProfitRecordService profitRecordService;
    @Autowired
    protected DistAccountService accountService;
    @Autowired
    protected DistAccountRecordService accountRecordService;
    @Autowired
    protected ProfitEventWsHandler profitEventWsHandler;


    /**
     * 开始分润，所有分润策略的入口
     *
     * @param subject 主体，实现accessProfit标记接口的类
     * @throws DistributionException 分销异常
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void startProfit(ProfitAccess subject) throws DistributionException {
        log.debug("\n\n----------------分润策略 {}  开始----------------", this.getClass().getSimpleName());
        this.setTenantForCurrentThread(subject);
        this.validateBiz(subject);
        DistProfitEvent event = this.recordEvent(subject);
        this.executeProfit(subject, event);
        this.pushEvent(event);
        log.debug("----------------分润策略 {} 结束----------------\n\n", this.getClass().getSimpleName());
    }


    /**
     * websocket推送分润事件
     *
     * @param event 事件
     */
    @Override
    public void pushEvent(DistProfitEvent event) {
        log.debug("【{}】 ---> 推送分润事件 开始", event.getProfitType().getMessage());
        try {
            DistProfitEventVO eventVO = new DistProfitEventVO();
            ToolUtil.copyProperties(event, eventVO);
            profitEventWsHandler.sendMessage(TenantHelper.getTenant(), eventVO);
        } catch (Exception e) {
            // 静默处理，需要当前存在WebSocketSession才能发送成功
            log.debug("pushInviteEvent fail", e);
        }
        log.debug("【{}】 ---> 推送分润事件 结束", event.getProfitType().getMessage());
    }


    /**
     * 为当前线程设置租户标识，如果异步执行，或者多线程环境下
     * 需要重写Override此方法
     *
     * @param subject 分润的主体，此对象中应该包含租户信息
     */
    protected void setTenantForCurrentThread(ProfitAccess subject) {
        // 默认当前属于同步操作，即当前线程中存在租户标识
        // 异步时，子类需要重写该方法，并在此方法中设置租户信息
    }


    /**
     * 获得一个分润参数
     *
     * @param accountType 账户类型
     * @param profitType  分润类型
     * @param level       分润等级
     * @param memberType  用户类型
     * @param memberRank  用户段位
     */
    protected DistProfitParam getProfitParam(AccountTypeEnum accountType, ProfitTypeEnum profitType, ProfitLevelEnum level, MemberTypeEnum memberType, MemberRankEnum memberRank) {
        DistProfitParam profitQuery = new DistProfitParam()
                .setAccountType(accountType)
                .setProfitType(profitType)
                .setProfitLevel(level)
                .setMemberType(memberType)
                .setMemberRank(memberRank)
                .setState(StateEnum.ENABLE);
        return profitParamService.getOne(new QueryWrapper<>(profitQuery));
    }

    /**
     * 计算分润值。保留小数点两位。小数点两位后的值，直接丢弃。
     *
     * @param profitType  分润类型
     * @param eventPrice  如果是交易分润，且为百分比计算模型时，需要交易价格
     * @param profitParam 分润参数
     * @return 分润值
     */
    protected BigDecimal calculateProfit(ProfitTypeEnum profitType, BigDecimal eventPrice, DistProfitParam profitParam) {
        BigDecimal income = profitParam.getProfitRatio();
        // 只有是 百分比计算 && 交易分润 时，才需要进一步计算，因为其他情况都时固定分润的范畴，直接取分润比列就好了
        if (CalculateModeEnum.PERCENTAGE.equals(profitParam.getCalculateMode()) && ProfitTypeEnum.TRADE.equals(profitType)) {
            income = eventPrice.multiply(income);
        }
        income = income.setScale(2, BigDecimal.ROUND_DOWN);
        return income;
    }


    /**
     * 为某个用户执行分分润
     * 即增加积分和佣金到账户
     * 所有记录的时间都以分润事件的时间为主
     *
     * @param event         分润事件
     * @param member        当前分润
     * @param moneyParam    佣金分润参数
     * @param integralParam 积分分润参数
     */
    protected void profit(DistProfitEvent event, DistMember member, DistProfitParam moneyParam, DistProfitParam integralParam) {
        log.debug(" ---> 执行分润 ---> 真正的分润 开始");
        log.debug(" ---> 执行分润 ---> 当前相关参数 member=[{}], eventId=[{}], moneyParam=[{}], integralParam=[{}]",
                member.getMemberUsername(), event.getId(), moneyParam, integralParam);

        Date eventCreateTime = event.getCreateTime();
        // 获取会员账户
        DistAccount memberAccount = accountService.getById(member.getId());

        // 设置一些统一的参数，
        // 基础分润记录
        DistProfitRecord baseProfitRecord = new DistProfitRecord()
                .setCreateTime(eventCreateTime)
                .setEventId(event.getId())
                .setImpactMemberUsername(member.getMemberUsername());
        // 基础账户变动记录
        DistAccountRecord baseAccountRecord = new DistAccountRecord()
                .setCreateTime(eventCreateTime)
                .setMemberUsername(member.getMemberUsername())
                .setChangeType(ChangeTypeEnum.PROFIT);

        // 佣金相关运算
        if (Objects.nonNull(moneyParam)) {
            // 计算佣金分润值
            BigDecimal money = this.calculateProfit(event.getProfitType(), event.getEventPrice(), moneyParam);

            // 佣金分润记录
            DistProfitRecord moneyProfitRecord = new DistProfitRecord()
                    .setAccountType(AccountTypeEnum.MONEY)
                    .setIncomeAmount(money);
            ToolUtil.copyProperties(baseProfitRecord, moneyProfitRecord);
            profitRecordService.save(moneyProfitRecord);

            // 分润账户变动记录
            BigDecimal accountMoneyTotal = memberAccount.getMoneyTotal();
            DistAccountRecord moneyAccountRecord = new DistAccountRecord()
                    .setAccountType(AccountTypeEnum.MONEY)
                    .setChangeAmount(money)
                    .setBeforeChangeTotal(accountMoneyTotal)
                    .setAfterChangeTotal(accountMoneyTotal.add(money))
                    .setChangeRecordId(moneyProfitRecord.getId());
            ToolUtil.copyProperties(baseAccountRecord, moneyAccountRecord);
            accountRecordService.save(moneyAccountRecord);

            // 设置账户的佣金
            memberAccount.setMoneyTotal(accountMoneyTotal.add(money))
                    .setMoneyAvailable(money.add(memberAccount.getMoneyAvailable()));
        }

        // 积分相关运算
        if (Objects.nonNull(integralParam)) {
            // 计算积分分润值，忽略小数点后的积分值 并新增佣金分润记录，
            int integral = this.calculateProfit(event.getProfitType(), event.getEventPrice(), integralParam).intValue();
            BigDecimal integralBigDecimal = BigDecimal.valueOf(integral);
            DistProfitRecord integralProfitRecord = new DistProfitRecord()
                    .setAccountType(AccountTypeEnum.INTEGRAL)
                    .setIncomeAmount(integralBigDecimal);
            ToolUtil.copyProperties(baseProfitRecord, integralProfitRecord);
            profitRecordService.save(integralProfitRecord);

            // 账户变动记录
            int accountIntegralTotal = memberAccount.getIntegralTotal();
            BigDecimal valueOfAccountIntegralTotal = BigDecimal.valueOf(accountIntegralTotal);
            DistAccountRecord integralAccountRecord = new DistAccountRecord()
                    .setAccountType(AccountTypeEnum.INTEGRAL)
                    .setChangeAmount(integralBigDecimal)
                    .setBeforeChangeTotal(valueOfAccountIntegralTotal)
                    .setAfterChangeTotal(valueOfAccountIntegralTotal.add(integralBigDecimal))
                    .setChangeRecordId(integralProfitRecord.getId());
            ToolUtil.copyProperties(baseAccountRecord, integralAccountRecord);
            accountRecordService.save(integralAccountRecord);

            // 设置账户的积分
            memberAccount.setUpdateTime(eventCreateTime)
                    .setIntegralTotalHistory(integral + memberAccount.getIntegralTotalHistory())
                    .setIntegralTotal(integral + accountIntegralTotal)
                    .setIntegralAvailable(integral + memberAccount.getIntegralAvailable());
        }

        // 更新账户
        accountService.updateById(memberAccount);

        log.debug(" --->  检查会员是否达到段位升级条件");
        // 检查当前会员的历史积分，匹配一个新的段位，如果和当前段位不一致就更新段位，并发布升级事件
        // 比较的是历史积分，所以肯定是积分增加了
        memberService.upgradeMemberRankIf(member.getId());

        log.debug(" ---> 执行分润 ---> 真正的分润 结束");
    }


    /**
     * 包装分销事件的memo字段
     *
     * @param profitMembers 获得了分润的人
     */
    protected String packageEventMemo(List<String> profitMembers) {
        // 删掉 开头的"[" 和末尾的"]" 符号，并组装描述
        if (ToolUtil.isEmpty(profitMembers)) {
            return "0人获得分润";
        } else {
            String toString = profitMembers.toString();
            return toString.substring(1, toString.length() - 1).concat("等, ").concat(String.valueOf(profitMembers.size())).concat("人获得分润");
        }
    }


}
