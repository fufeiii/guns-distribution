package cn.stylefeng.guns.modular.distribution.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * summaryNums接口封装对象
 * {@link cn.stylefeng.guns.modular.distribution.controller.DistDashboardController#summaryNums()}
 *
 * @author Fu Fei
 * @date 2020/9/23
 */
@Data
public class SummaryNumsVO implements Serializable {

    private static final long serialVersionUID = 1886831394016500041L;
    public static final String MEMBER_GROUP = "member";
    public static final String TRADE_GROUP = "trade";
    public static final String ORDER_GROUP = "order";
    public static final String PROFIT_GROUP = "profit";

    private Nums member;

    private Nums trade;

    private Nums order;

    private Nums profit;

    @Data
    @Accessors(chain = true)
    static public class Nums implements Serializable {

        private static final long serialVersionUID = -7699684467813515965L;


        /**
         * 组名
         */
        private String group;

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
