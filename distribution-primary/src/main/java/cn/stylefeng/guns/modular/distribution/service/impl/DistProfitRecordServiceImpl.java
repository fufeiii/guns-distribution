package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistProfitRecord;
import cn.stylefeng.guns.modular.distribution.mapper.DistProfitRecordMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitRecordService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 分润记录 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistProfitRecordServiceImpl extends ServiceImpl<DistProfitRecordMapper, DistProfitRecord> implements DistProfitRecordService {


    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findPageBySpec(DistProfitRecordDTO param){
        Page<DistProfitRecordVO> pageContext = this.getPageContext();
        IPage<DistProfitRecordVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    private Page<DistProfitRecordVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

}
