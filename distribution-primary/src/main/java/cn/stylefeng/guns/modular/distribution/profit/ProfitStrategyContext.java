package cn.stylefeng.guns.modular.distribution.profit;

import cn.stylefeng.guns.modular.distribution.profit.strategy.InviteProfitStrategy;
import cn.stylefeng.guns.modular.distribution.profit.strategy.RankProfitStrategy;
import cn.stylefeng.guns.modular.distribution.profit.strategy.TradeProfitStrategy;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 分润策略上下文
 *
 * @author Fu Fei
 * @date 2020/8/5
 */
@Component
public class ProfitStrategyContext {

    @Autowired
    private TradeProfitStrategy tradeProfitStrategy;

    @Autowired
    private InviteProfitStrategy inviteProfitStrategy;

    @Autowired
    private RankProfitStrategy rankProfitStrategy;


    /**
     * 获得对应的分润策略
     *
     * @param profitType 分润策略枚举
     */
    public Profit getProfitStrategy(ProfitTypeEnum profitType) {
        if (ProfitTypeEnum.TRADE.equals(profitType)) {
            return tradeProfitStrategy;
        }
        if (ProfitTypeEnum.INVITE.equals(profitType)) {
            return inviteProfitStrategy;
        }
        if (ProfitTypeEnum.RANK.equals(profitType)) {
            return rankProfitStrategy;
        }
        return null;
    }

}
