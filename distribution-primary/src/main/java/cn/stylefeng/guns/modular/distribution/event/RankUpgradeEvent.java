package cn.stylefeng.guns.modular.distribution.event;

import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import org.springframework.context.ApplicationEvent;

/**
 * 段位升级事件
 * 这是一个特殊的事件，因为他通常是由其他分润事件触发的
 * 因为在其他分润事件中获得了积分，导致当前会员发生了升级事件
 *
 * @author Fu Fei
 * @date 2020/8/22
 */
public class RankUpgradeEvent extends ApplicationEvent {

    private static final long serialVersionUID = 3499615561996992087L;

    /**
     * 升级的会员
     */
    private final DistMemberDTO upgradeMember;

    public RankUpgradeEvent(Object source, DistMemberDTO upgradeMember) {
        super(source);
        this.upgradeMember = upgradeMember;
    }

    public DistMemberDTO getUpgradeMember() {
        return upgradeMember;
    }

}
