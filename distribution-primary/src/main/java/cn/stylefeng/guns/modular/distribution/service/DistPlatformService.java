package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistPlatform;
import cn.stylefeng.guns.modular.distribution.model.dto.DistPlatformDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistPlatformVO;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 平台 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistPlatformService extends IService<DistPlatform> {

    /**
     * 新增
     */
    void add(DistPlatformDTO param);

    /**
     * 删除
     */
    void delete(DistPlatformDTO param);

    /**
     * 更新
     */
    void update(DistPlatformDTO param);

    /**
     * 查询单条数据，Specification模式
     */
    DistPlatformVO findBySpec(DistPlatformDTO param);


    /**
     * 查询分页数据，Specification模式
     */
     LayuiPageInfo findPageBySpec(DistPlatformDTO param);

}
