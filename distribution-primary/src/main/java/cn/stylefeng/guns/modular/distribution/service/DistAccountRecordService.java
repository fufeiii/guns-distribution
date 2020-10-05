package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistAccountRecord;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountRecordVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 账户明细记录 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistAccountRecordService extends IService<DistAccountRecord> {


    /**
     * 查询单条数据，Specification模式
     */
    DistAccountRecordVO findBySpec(DistAccountRecordDTO param);



    /**
     * 查询分页数据，Specification模式
     */
     LayuiPageInfo findPageBySpec(DistAccountRecordDTO param);

}
