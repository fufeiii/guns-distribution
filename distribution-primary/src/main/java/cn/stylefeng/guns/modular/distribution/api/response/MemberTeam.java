package cn.stylefeng.guns.modular.distribution.api.response;

import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 会员团队接口封装参数
 *
 * @author Fu Fei
 * @date 2020/9/26
 */
@ApiModel
@Data
public class MemberTeam implements Serializable {

    private static final long serialVersionUID = -1535782119376687982L;

    private List<DistMemberVO> first;

    private List<DistMemberVO> second;

    private List<DistMemberVO> three;

}
