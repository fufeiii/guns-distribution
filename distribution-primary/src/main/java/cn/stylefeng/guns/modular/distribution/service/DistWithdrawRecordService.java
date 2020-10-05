package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.entity.DistWithdrawRecord;
import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;

/**
 * <p>
 * 提现申请记录 服务类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
public interface DistWithdrawRecordService extends IService<DistWithdrawRecord> {

    /**
     * 发起提现申请
     */
    void initiate(DistWithdrawRecordDTO param);

    /**
     * 审核
     */
    void audit(DistWithdrawRecordDTO param);

    /**
     * 提现
     */
    void doWithdrawDeposit(DistWithdrawRecordDTO param);

    /**
     * 查询分页数据，Specification模式
     */
    LayuiPageInfo findPageBySpec(DistWithdrawRecordDTO param);

    /**
     * 查询某个状态的总金额
     *
     * @param memberUsername 用户标识
     * @param disposeState   状态
     * @return
     */
    BigDecimal findWithdrawMoney(String memberUsername, DisposeStateEnum disposeState);
}
