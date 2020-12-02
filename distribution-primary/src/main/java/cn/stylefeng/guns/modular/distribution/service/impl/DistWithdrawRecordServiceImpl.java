package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.stylefeng.guns.base.consts.ConstantsContext;
import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.retry.RetryOnFailure;
import cn.stylefeng.guns.modular.distribution.entity.DistAccount;
import cn.stylefeng.guns.modular.distribution.entity.DistAccountRecord;
import cn.stylefeng.guns.modular.distribution.entity.DistMember;
import cn.stylefeng.guns.modular.distribution.entity.DistWithdrawRecord;
import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ChangeTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.modular.distribution.mapper.DistWithdrawRecordMapper;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistWithdrawRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountRecordService;
import cn.stylefeng.guns.modular.distribution.service.DistAccountService;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.guns.modular.distribution.service.DistWithdrawRecordService;
import cn.stylefeng.guns.modular.distribution.util.AssertHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Optional;

/**
 * <p>
 * 提现申请记录 服务实现类
 * </p>
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Service
public class DistWithdrawRecordServiceImpl extends ServiceImpl<DistWithdrawRecordMapper, DistWithdrawRecord> implements DistWithdrawRecordService {

    @Autowired
    private DistMemberService distMemberService;
    @Autowired
    private DistAccountService distAccountService;
    @Autowired
    private DistAccountRecordService distAccountRecordService;


    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void initiate(DistWithdrawRecordDTO param) {
        DistWithdrawRecord withdrawRecord = this.getEntity(param);
        // 验证会员是否存在
        DistMember member = distMemberService.findByMemberUsername(param.getMemberUsername());
        AssertHelper.notNull(member, DistributionException.BizEnum.MEMBER_NOT_EXIST);
        // 验证会员账户
        DistAccount account = distAccountService.getById(member.getId());
        AssertHelper.isTrue(StateEnum.ENABLE.equals(account.getState()), DistributionException.BizEnum.ACCOUNT_FORBIDDEN);

        BigDecimal moneyAvailable = account.getMoneyAvailable();
        BigDecimal withdrawAmount = withdrawRecord.getWithdrawAmount();
        BigDecimal fee = withdrawAmount.multiply(ConstantsContext.getDistWithdrawRatio());
        withdrawRecord.setFeeAmount(fee);
        BigDecimal freezeMoney = withdrawAmount.add(fee);
        // 提现金额不应比账户可用余额高
        AssertHelper.isTrue(moneyAvailable.compareTo(freezeMoney) > 0, DistributionException.BizEnum.ACCOUNT_BALANCE_LACK);

        // 添加提现申请记录
        String memberUsername = member.getMemberUsername();
        withdrawRecord.setWithdrawNumber(memberUsername.concat("_") + DateUtil.format(new Date(), DatePattern.PURE_DATETIME_MS_FORMAT))
                .setDisposeState(DisposeStateEnum.WAIT_AUDIT).setVersion(1);
        this.save(withdrawRecord);

        // 添加账户变动记录
        DistAccountRecord accountRecord = new DistAccountRecord()
                .setAccountType(AccountTypeEnum.MONEY)
                .setChangeType(ChangeTypeEnum.WITHDRAW_FREEZE)
                .setMemberUsername(memberUsername)
                .setBeforeChangeTotal(account.getMoneyTotal())
                .setAfterChangeTotal(account.getMoneyTotal())
                .setChangeAmount(freezeMoney)
                .setChangeRecordId(withdrawRecord.getId())
                .setMemo(StrUtil.format("账户：{}，发起提现申请，金额：{}，冻结：{}",
                        memberUsername,
                        freezeMoney.toPlainString(), freezeMoney.toPlainString()));
        distAccountRecordService.save(accountRecord);

        // 更新账户
        account.setMoneyAvailable(moneyAvailable.subtract(freezeMoney))
                .setMoneyFrozen(account.getMoneyFrozen().add(freezeMoney));

        // 如果更新账户失败，回滚事务，重新开始
        AssertHelper.retryOnFailure(distAccountService.updateById(account));

    }


    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void audit(DistWithdrawRecordDTO param) {
        // 验证会员是否存在
        DistMember member = distMemberService.findByMemberUsername(param.getMemberUsername());
        AssertHelper.notNull(member, DistributionException.BizEnum.MEMBER_NOT_EXIST);
        // 验证会员账户
        DistAccount account = distAccountService.getById(member.getId());
        AssertHelper.isTrue(StateEnum.ENABLE.equals(account.getState()), DistributionException.BizEnum.ACCOUNT_FORBIDDEN);

        DistWithdrawRecord oldWithdrawRecord = this.getOldEntity(param);
        DistWithdrawRecord withdrawRecord = this.getEntity(param);
        if (DisposeStateEnum.REJECT.equals(param.getDisposeState())) {
            // 拒绝提现申请
            // 解冻被扣的钱
            BigDecimal freezeMoney = oldWithdrawRecord.getWithdrawAmount().add(oldWithdrawRecord.getFeeAmount());
            account.setMoneyAvailable(account.getMoneyAvailable().add(freezeMoney))
                    .setMoneyFrozen(account.getMoneyFrozen().subtract(freezeMoney));

            // 添加账户变动记录
            DistAccountRecord accountRecord = new DistAccountRecord()
                    .setAccountType(AccountTypeEnum.MONEY)
                    .setChangeType(ChangeTypeEnum.WITHDRAW_UNFREEZE)
                    .setMemberUsername(member.getMemberUsername())
                    .setBeforeChangeTotal(account.getMoneyTotal())
                    .setAfterChangeTotal(account.getMoneyTotal())
                    .setChangeAmount(freezeMoney)
                    .setChangeRecordId(withdrawRecord.getId());
            distAccountRecordService.save(accountRecord);

            AssertHelper.retryOnFailure(distAccountService.updateById(account));
        } else {
            // 通过 有前端调用doWithdrawDeposit方法，模拟其他模块正在处理资金
            // 请重写下面的方法，替换模拟体现操作
            // this.doWithdrawDeposit()
            log.error("请补充提现审核通过后的业务操作....");
        }
        ToolUtil.copyProperties(withdrawRecord, oldWithdrawRecord);
        oldWithdrawRecord.setHandleTime(new Date());
        AssertHelper.retryOnFailure(this.updateById(oldWithdrawRecord));
    }


    /**
     * 这里应该是执行真正的打款操作
     * 成功了则将修改状态为已到账
     */
    @RetryOnFailure
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void doWithdrawDeposit(DistWithdrawRecordDTO param) {
        log.error("-------------正在模拟资金转账操作 开始-----");
        // 模拟其他系统已完成，现在进行本系统的计算
        DistWithdrawRecord record = this.getById(param.getId());
        if (DisposeStateEnum.DONE_REMIT.equals(record.getDisposeState())) {
            return;
        }

        DistMember member = distMemberService.findByMemberUsername(record.getMemberUsername());
        DistAccount account = distAccountService.getById(member.getId());

        // 修改账户 添加变动记录
        BigDecimal withdrawAmount = record.getWithdrawAmount();
        BigDecimal feeAmount = record.getFeeAmount();
        BigDecimal frozen = feeAmount.add(withdrawAmount);
        DistAccountRecord accountRecord = new DistAccountRecord()
                .setAccountType(AccountTypeEnum.MONEY)
                .setChangeType(ChangeTypeEnum.WITHDRAW_DEPOSIT)
                .setMemberUsername(record.getMemberUsername())
                .setBeforeChangeTotal(account.getMoneyTotal())
                .setAfterChangeTotal(account.getMoneyTotal().subtract(frozen))
                .setChangeAmount(frozen)
                .setChangeRecordId(record.getId())
                .setMemo(StrUtil.format("用户提现取出{}元，手续费{}元", withdrawAmount.stripTrailingZeros(), feeAmount.stripTrailingZeros()));

        // 插入记录账户变动记录
        distAccountRecordService.save(accountRecord);

        // 更新账户
        account.setMoneyFrozen(account.getMoneyFrozen().subtract(frozen))
                .setMoneyTotal(account.getMoneyTotal().subtract(frozen));
        AssertHelper.retryOnFailure(distAccountService.updateById(account));

        // 更新提现处置记录
        record.setDisposeState(DisposeStateEnum.DONE_REMIT);
        AssertHelper.retryOnFailure(this.updateById(record));

        log.error("-------------正在模拟资金转账操作 结束-----");
    }


    @Transactional(readOnly = true)
    @Override
    public LayuiPageInfo findPageBySpec(DistWithdrawRecordDTO param) {
        Page<DistWithdrawRecordVO> pageContext = this.getPageContext();
        IPage<DistWithdrawRecordVO> page = baseMapper.customPageList(pageContext, param);
        return LayuiPageFactory.createPageInfo(page);
    }

    @Transactional(readOnly = true)
    @Override
    public BigDecimal findWithdrawMoney(String memberUsername, DisposeStateEnum disposeState) {
        Optional<BigDecimal> money = Optional.ofNullable(baseMapper.withdrawMoney(memberUsername, disposeState.getCode()));
        return money.orElse(BigDecimal.ZERO);
    }

    private Serializable getKey(DistWithdrawRecordDTO param) {
        return param.getId();
    }

    private <T> Page<T> getPageContext() {
        return LayuiPageFactory.defaultPage();
    }

    private DistWithdrawRecord getOldEntity(DistWithdrawRecordDTO param) {
        return this.getById(this.getKey(param));
    }

    private DistWithdrawRecord getEntity(DistWithdrawRecordDTO param) {
        DistWithdrawRecord entity = new DistWithdrawRecord();
        ToolUtil.copyProperties(param, entity);
        return entity;
    }

}
