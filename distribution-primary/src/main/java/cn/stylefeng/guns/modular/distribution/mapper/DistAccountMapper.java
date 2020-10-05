package cn.stylefeng.guns.modular.distribution.mapper;

import cn.stylefeng.guns.modular.distribution.entity.DistAccount;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 会员账户 Mapper 接口
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistAccountMapper extends BaseMapper<DistAccount> {

    /**
     * 获取分页实体列表
     */
    Page<DistAccountVO> customPageList(@Param("page") Page page, @Param("paramCondition") DistAccountDTO paramCondition);


}
