package cn.stylefeng.guns.modular.distribution.api.response;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * MemberIndex接口返回参数模型封装
 *
 * @author Fu Fei
 * @date 2020/9/25
 */
@ApiModel
@Data
public class MemberIndexVO {

    private Member member;
    private Today today;
    private Withdraw withdraw;
    private Summary summary;


    @Data
    @Accessors(chain = true)
    public static class Member {
        private Long memberId;
        private String memberUsername;
        private String memberNickname;
        private String memberRank;
        private String parent;
    }

    @Data
    @Accessors(chain = true)
    public static class Today {
        private BigDecimal tradeMoney;
        private BigDecimal profitMoney;
        private Integer inviteCount;
    }

    @Data
    @Accessors(chain = true)
    public static class Withdraw {
        private BigDecimal doneRemit;
        private BigDecimal waitRemit;
    }

    @Data
    @Accessors(chain = true)
    public static class Summary {
        private BigDecimal allProfitMoney;
        private BigDecimal allTradeMoney;
        private BigDecimal allAvailableWithdraw;
        private Integer allTeamCount;
    }


}
