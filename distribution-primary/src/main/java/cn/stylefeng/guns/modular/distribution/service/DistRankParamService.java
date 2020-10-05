package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistRankParam;
import cn.stylefeng.guns.modular.distribution.model.dto.DistRankParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistRankParamVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 段位配置 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistRankParamService extends IService<DistRankParam> {

    /**
     * 新增
     */
    void add(DistRankParamDTO param);

    /**
     * 删除
     */
    void delete(DistRankParamDTO param);

    /**
     * 更新
     */
    void update(DistRankParamDTO param);

    /**
     * 查询单条数据，Specification模式
     */
    DistRankParamVO findBySpec(DistRankParamDTO param);

    /**
     * 查询列表，Specification模式
     */
    List<DistRankParamVO> findListBySpec(DistRankParamDTO param);

    /**
     * 查询分页数据，Specification模式
     */
     LayuiPageInfo findPageBySpec(DistRankParamDTO param);

}
