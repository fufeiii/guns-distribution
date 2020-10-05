package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistAccountRecord;
import cn.stylefeng.guns.modular.distribution.mapper.DistAccountRecordMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountRecordService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 账户明细记录 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistAccountRecordServiceImpl extends ServiceImpl<DistAccountRecordMapper, DistAccountRecord> implements DistAccountRecordService {

    @Override
    public DistAccountRecordVO findBySpec(DistAccountRecordDTO param){
        return null;
    }


    @Override
    public LayuiPageInfo findPageBySpec(DistAccountRecordDTO param){
        Page<DistAccountRecordVO> pageContext = this.getPageContext();
        IPage<DistAccountRecordVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }


    private Page<DistAccountRecordVO> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }



}
