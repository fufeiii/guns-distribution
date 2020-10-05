package cn.stylefeng.guns.modular.distribution.profit;

import cn.stylefeng.guns.modular.distribution.exception.DistributionException;

/**
 * 分润
 *
 * @author Fu Fei
 * @date 2020/8/5
 */
public interface Profit {

    /**
     * 开始分润，所有分润策略的入口
     *
     * @param subject 主体，实现accessProfit标记接口的类
     * @throws DistributionException 分销异常
     */
    void startProfit(ProfitAccess subject) throws DistributionException;

}
