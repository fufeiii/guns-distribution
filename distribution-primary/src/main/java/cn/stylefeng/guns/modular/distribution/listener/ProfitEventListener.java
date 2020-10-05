package cn.stylefeng.guns.modular.distribution.listener;

import cn.stylefeng.guns.modular.distribution.profit.ProfitStrategyContext;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.event.InviteMemberEvent;
import cn.stylefeng.guns.modular.distribution.event.RankUpgradeEvent;
import cn.stylefeng.guns.modular.distribution.event.TradeGoodsEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

/**
 * 分润事件监听器。
 *
 * @author Fu Fei
 * @date 2020/7/19
 */
@Component
public class ProfitEventListener {

    @Autowired
    private ProfitStrategyContext profitStrategyContext;

    /**
     * 监听InviteMemberEvent事件，触发事件所在事务成功提交后
     * 异步执行
     *
     * @param inviteMemberEvent 会员邀请事件
     */
    @Async
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handle(InviteMemberEvent inviteMemberEvent) {
        // 执行邀请分润机制
        profitStrategyContext.getProfitStrategy(ProfitTypeEnum.INVITE).startProfit(inviteMemberEvent.getInviter());
    }

    /**
     * 监听RankUpgradeEvent事件，触发事件所在事务成功提交后
     * 异步执行
     *
     * @param rankUpgradeEvent 段位升级事件
     */
    @Async
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handle(RankUpgradeEvent rankUpgradeEvent) {
        // 执行邀请分润机制
        profitStrategyContext.getProfitStrategy(ProfitTypeEnum.RANK).startProfit(rankUpgradeEvent.getUpgradeMember());
    }


    /**
     * 监听TradeGoodsEvent事件，因为是来自接口调用
     * 同步执行
     *
     * @param tradeGoodsEvent 商品交易事件
     */
    @EventListener
    public void handle(TradeGoodsEvent tradeGoodsEvent) {
        // 执行交易分润机制
        profitStrategyContext.getProfitStrategy(ProfitTypeEnum.TRADE).startProfit(tradeGoodsEvent.getDistProfitEventDTO());
    }


}
