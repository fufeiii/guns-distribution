package cn.stylefeng.guns.modular.distribution.event;

import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import org.springframework.context.ApplicationEvent;

/**
 * 邀请其他会员加入的事件
 *
 * @author Fu Fei
 * @date 2020/7/19
 */
public class TradeGoodsEvent extends ApplicationEvent {

    private static final long serialVersionUID = -6760900680825563319L;

    /**
     * 交易事件中的订单相关
     */
    private final DistProfitEventDTO distProfitEventDTO;

    public TradeGoodsEvent(Object source, DistProfitEventDTO distProfitEventDTO) {
        super(source);
        this.distProfitEventDTO = distProfitEventDTO;
    }

    public DistProfitEventDTO getDistProfitEventDTO() {
        return distProfitEventDTO;
    }

}
