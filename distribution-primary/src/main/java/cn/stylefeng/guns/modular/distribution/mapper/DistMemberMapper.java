package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 会员 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistMemberMapper extends BaseMapper<DistMember> {

    /**
     * 获取列表
     */
    List<DistMemberVO> customList(@Param("paramCondition") DistMemberDTO paramCondition);

    /**
     * 获取map列表
     */
    List<Map<String, Object>> customMapList(@Param("paramCondition") DistMemberDTO paramCondition);

    /**
     * 获取分页实体列表
     */
    Page<DistMemberVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistMemberDTO paramCondition);

    /**
     * 获取分页map列表
     */
    Page<Map<String, Object>> customPageMapList(@Param("page") Page page, @Param("paramCondition") DistMemberDTO paramCondition);

    /**
     * 查找会员是否存在
     */
    Integer exists(@Param("username") String memberUsername);

    /**
     * 属性查询
     */
    DistMember selectByAttribute(@Param("column") String column, @Param("value") String value);

    /**
     * 查询某个会员的下级
     */
    List<DistMemberVO> team(@Param("parent") String parent, @Param("level") Integer level);

    /**
     * 查询邀请人数最多的会员
     */
    List<DistMemberVO> memberTop(@Param("top") Integer top);

    /**
     * 查询一个集合里面的会员
     */
    List<DistMemberVO> selectMemberList(@Param("memberUsernameList") List<String> memberUsernameList);
}
