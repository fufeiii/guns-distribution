package cn.stylefeng.guns.modular.distribution.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * summaryNums接口封装对象
 * {@link cn.stylefeng.guns.modular.distribution.controller.DistDashboardController#summaryNums()}
 *
 * @author Fu Fei
 * @date 2020/9/23
 */
@Data
public class SummaryNumsVO {

    private Nums member;

    private Nums trade;

    private Nums order;

    private Nums profit;

    @Data
    @Accessors(chain = true)
    static public class Nums {

        /**
         * 小值
         */
        private Number tiny;

        /**
         * 大值
         */
        private Number large;

    }

}
