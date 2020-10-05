package cn.stylefeng.guns.modular.distribution.event;

import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import org.springframework.context.ApplicationEvent;

/**
 * 邀请其他会员加入的事件
 *
 * @author Fu Fei
 * @date 2020/7/19
 */
public class InviteMemberEvent extends ApplicationEvent {

    private static final long serialVersionUID = -5904603262579267324L;

    /**
     * 发出邀请的人
     */
    private final DistMemberDTO inviter;
    //根据需要可以设置被邀请人，比如说新人红包等营销策略。

    public InviteMemberEvent(Object source, DistMemberDTO inviter) {
        super(source);
        this.inviter = inviter;
    }

    public DistMemberDTO getInviter() {
        return inviter;
    }
}
