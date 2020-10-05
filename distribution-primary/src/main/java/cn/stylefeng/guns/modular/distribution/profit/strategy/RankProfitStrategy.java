package cn.stylefeng.guns.modular.distribution.profit.strategy;

import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitEvent;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitParam;
import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitLevelEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.profit.ProfitAccess;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

/**
 * 段位升级时的分润策略
 *
 * @author Fu Fei
 * @date 2020/8/8
 */
@Component
@Slf4j
public class RankProfitStrategy extends AbstractProfit {

    @Override
    protected void setTenantForCurrentThread(ProfitAccess subject) {
        TenantHelper.setTenant(((DistMemberDTO) subject).getPlatformUsername());
    }

    @Override
    public void validateBiz(ProfitAccess subject) throws DistributionException {
        log.debug("【段位分润】 ---> 验证业务合法性 开始");
        DistMemberDTO upgradeMember = (DistMemberDTO) subject;
        TenantHelper.setTenant(upgradeMember.getPlatformUsername());
        log.debug("【段位分润】 ---> 验证业务合法性 结束");
    }

    @Override
    public DistProfitEvent recordEvent(ProfitAccess subject) {
        log.debug("【段位分润】 ---> 记录分润事件 开始");
        // 记录发生了邀请分润事件
        DistMemberDTO upgradeMember = (DistMemberDTO) subject;
        ProfitTypeEnum eventEnum = ProfitTypeEnum.RANK;
        DistProfitEvent event = new DistProfitEvent()
                .setProfitType(eventEnum)
                .setEventNumber(eventEnum.generateEventNumber())
                .setTriggerMemberUsername(upgradeMember.getMemberUsername());
        profitEventService.save(event);
        log.debug("【段位分润】 ---> 记录分润事件 结束");
        return event;
    }

    @Override
    public void executeProfit(ProfitAccess subject, DistProfitEvent event) {
        log.debug("【段位分润】 ---> 执行分润 开始 .....");
        // 执行真正的分润
        DistMemberDTO upgradeMember = (DistMemberDTO) subject;
        // 组装分润人员数组，
        String profitPath = upgradeMember.getMemberUsername() + "." + upgradeMember.getParentPath();
        String[] pathArray = profitPath.split("\\.");
        log.debug("【段位分润】 ---> 当前分润人员标识为：[{}]", Arrays.toString(pathArray));

        // 记录当前能获得分润的人员
        List<String> profitMembers = new LinkedList<>();

        // 循环当前需要分润的人员，进行分润参数的匹配
        for (int level = 0; level < pathArray.length; level++) {

            // 验证分润等级是否需要进行分润。分润参数的等级取自当前枚举，如果当前枚举匹配匹配不到，则肯定不存在对应的分润参数
            ProfitLevelEnum levelEnum = ProfitLevelEnum.matches(level);
            String memberUsername = pathArray[level];
            if (Objects.isNull(levelEnum)) {
                // 如果不存在分润参数，则直接返回，即当前人员无分润
                log.debug("未匹配到对应的分润等级, 跳过当前人员的分润。等级level=[{}] 人员memberUsername=[{}]", level, memberUsername);
                continue;
            }

            DistMember member = memberService.findByMemberUsername(memberUsername);
            // 分润类型（邀请）、分润等级、会员类型、会员段位、参数状态
            // 查询佣金和积分的分润参数
            DistProfitParam moneyParam = this.getProfitParam(AccountTypeEnum.MONEY, ProfitTypeEnum.RANK, levelEnum, member.getMemberType(), member.getMemberRank());
            DistProfitParam integralParam = this.getProfitParam(AccountTypeEnum.INTEGRAL, ProfitTypeEnum.RANK, levelEnum, member.getMemberType(), member.getMemberRank());

            boolean moneyParamExist = Objects.nonNull(moneyParam);
            boolean integralParamExist = Objects.nonNull(integralParam);

            if (!integralParamExist) {
                log.debug("未匹配到对应的积分分润参数, 等级level=[{}] 人员memberUsername=[{}]", level, memberUsername);
            }
            if (!moneyParamExist) {
                log.debug("未匹配到对应的佣金分润参数, 等级level=[{}] 人员memberUsername=[{}]", level, memberUsername);
                log.debug("跳过当前人员的分润, 等级level=[{}] 人员memberUsername=[{}]", level, memberUsername);
                continue;
            }

            // 为当前人员分润
            this.profit(event, member, moneyParam, integralParam);
            profitMembers.add(memberUsername);
        }

        // 更新一下分润事件
        // 删掉 开头的"[" 和末尾的"]" 符号，并组装描述
        event.setMemo(this.packageEventMemo(profitMembers));
        profitEventService.updateById(event);
        log.debug("【段位分润】 ---> 执行分润 结束 .....");
    }

}
