package cn.stylefeng.guns.modular.distribution.service;

import cn.hutool.core.date.DateTime;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitRecord;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitRecordDTO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;

/**
 * <p>
 * 分润记录 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistProfitRecordService extends IService<DistProfitRecord> {

    /**
     * 查询分页数据，Specification模式
     */
     LayuiPageInfo findPageBySpec(DistProfitRecordDTO param);

}
