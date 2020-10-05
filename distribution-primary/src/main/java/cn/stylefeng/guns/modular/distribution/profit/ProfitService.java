package cn.stylefeng.guns.modular.distribution.profit;

import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;

/**
 * 分润性服务
 *
 * @author Fu Fei
 * @date 2020/8/16
 */
public interface ProfitService extends Profit {

    /**
     * 验证业务合法性。
     * 不同的分润有不同的业务验证逻辑
     *
     * @param subject 主体
     * @throws DistributionException 业务异常
     */
    void validateBiz(ProfitAccess subject) throws DistributionException;

    /**
     * 记录当前所触发的分润所属于的分润事件
     *
     * @param subject 主体
     * @return 分润事件，便于后续推送分润事件{@link #pushEvent}和记录执行分润期间的信息{@link #executeProfit}
     */
    DistProfitEvent recordEvent(ProfitAccess subject);

    /**
     * websocket推送分润事件
     *
     * @param event 事件
     */
    void pushEvent(DistProfitEvent event);

    /**
     * 执行真正的分润。包含佣金和积分。
     * 注意，有分润事件，不一定会产生分润，这取决于分润参数
     *
     * @param subject 主体
     * @param event 当前分润事件
     */
    void executeProfit(ProfitAccess subject, DistProfitEvent event);

}
