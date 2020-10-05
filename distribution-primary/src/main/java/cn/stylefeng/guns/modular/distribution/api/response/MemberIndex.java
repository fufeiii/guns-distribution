package cn.stylefeng.guns.modular.distribution.api.response;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * MemberIndex接口返回参数模型封装
 *
 * @author Fu Fei
 * @date 2020/9/25
 */
@ApiModel
@Data
public class MemberIndex implements Serializable {

    private static final long serialVersionUID = -9089901887877230535L;
    public static final String MEMBER_GROUP = "member";
    public static final String TODAY_GROUP = "today";
    public static final String WITHDRAW_GROUP = "withdraw";
    public static final String SUMMARY_GROUP = "summary";

    private Member member;
    private Today today;
    private Withdraw withdraw;
    private Summary summary;


    @Data
    public static class Member implements Serializable {
        private static final long serialVersionUID = 2685971472771779500L;
        private Long memberId;
        private String memberUsername;
        private String memberNickname;
        private String memberRank;
        private String parent;
    }

    @Data
    public static class Today implements Serializable {
        private static final long serialVersionUID = 6122379017148920094L;
        private BigDecimal tradeMoney;
        private BigDecimal profitMoney;
        private Integer inviteCount;
    }

    @Data
    public static class Withdraw implements Serializable {
        private static final long serialVersionUID = 1898421399544677331L;
        private BigDecimal doneRemit;
        private BigDecimal waitRemit;
    }

    @Data
    public static class Summary implements Serializable {
        private static final long serialVersionUID = 7428763597696491797L;
        private BigDecimal allProfitMoney;
        private BigDecimal allTradeMoney;
        private BigDecimal allAvailableWithdraw;
        private Integer allTeamCount;
    }


}
