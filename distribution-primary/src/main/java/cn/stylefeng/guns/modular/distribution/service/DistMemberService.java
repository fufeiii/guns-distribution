package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.api.response.MemberTeam;
import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountVO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 会员 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistMemberService extends IService<DistMember> {

    /**
     * 新增
     */
    void add(DistMemberDTO param);

    /**
     * 更新
     */
    void update(DistMemberDTO param);

    /**
     * 属性查询
     */
    DistMember findByAttribute(String column, String value);

    /**
     * 检查一个会员是否存在
     * @param memberUsername
     */
    boolean exists(String memberUsername);

    /**
     * 属性查询
     */
    DistMember findByMemberUsername(String memberUsername);

    /**
     * 查询单条数据，Specification模式
     */
    DistMemberVO findBySpec(DistMemberDTO param);

    /**
     * 查询列表，Specification模式
     */
    List<DistMemberVO> findListBySpec(DistMemberDTO param);

    /**
     * 查询分页数据，Specification模式
     */
    LayuiPageInfo findPageBySpec(DistMemberDTO param);

    /**
     * 当前会员账户
     */
    DistAccountVO account(Long memberId);

    /**
     * 升级会员段位，如果达到了升级标准
     */
    void upgradeMemberRankIf(Long memberId);

    /**
     * 查看某个会员的代理下级
     *
     * @param parent 当前人员的父级
     */
    MemberTeam team(String parent);

    /**
     * 统计某个时间区间加入的会员个数
     */
    int countBetweenDate(Date begin, Date end);

    /**
     * 查询发展会员最多的会员
     *
     * @param top 查询个数
     */
    List<DistMemberVO> memberTop4Web(Integer top);
}
