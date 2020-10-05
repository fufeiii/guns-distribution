package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistAccount;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountVO;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 会员账户 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistAccountService extends IService<DistAccount> {

    /**
     * 更新
     */
    void update(DistAccountDTO param);

    /**
     * 查询单条数据，Specification模式
     */
    DistAccountVO findBySpec(DistAccountDTO param);


    /**
     * 查询分页数据，Specification模式
     */
    LayuiPageInfo findPageBySpec(DistAccountDTO param);

}
