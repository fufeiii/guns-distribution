package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitParam;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitParamDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitParamVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 分润参数 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitParamService extends IService<DistProfitParam> {

    /**
     * 新增
     */
    void add(DistProfitParamDTO param);

    /**
     * 删除
     */
    void delete(DistProfitParamDTO param);

    /**
     * 更新
     */
    void update(DistProfitParamDTO param);

    /**
     * 查询单条数据，Specification模式
     */
    DistProfitParamVO findBySpec(DistProfitParamDTO param);

    /**
     * 查询列表，Specification模式
     */
    List<DistProfitParamVO> findListBySpec(DistProfitParamDTO param);

    /**
     * 查询分页数据，Specification模式
     */
     LayuiPageInfo findPageBySpec(DistProfitParamDTO param);

}
