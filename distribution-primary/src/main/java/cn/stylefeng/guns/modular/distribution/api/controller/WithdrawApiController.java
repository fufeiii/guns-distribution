package cn.stylefeng.guns.modular.distribution.api.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.api.request.CommonQuery;
import cn.stylefeng.guns.modular.distribution.api.response.PageResponseData;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import cn.stylefeng.guns.modular.distribution.service.DistWithdrawRecordService;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 提现相关api接口
 *
 * @author Fu Fei
 * @date 2020/9/13
 */
@RestController
@RequestMapping("/api/v1/withdraw")
@Api(tags = "提现业务")
public class WithdrawApiController {

    @Autowired
    private DistWithdrawRecordService withdrawRecordService;

    @ApiOperation("发起提现申请")
    @PostMapping("/initiate")
    public ResponseData initiate(@Validated(ValidateGroup.Insert.class)
                                 @RequestBody DistWithdrawRecordDTO withdrawRecordDTO, BindingResult result) {
        withdrawRecordService.initiate(withdrawRecordDTO);
        return ResponseData.success();
    }

    @ApiOperation("查询提现记录")
    @GetMapping("/list")
    public ResponseData list(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        LayuiPageInfo pageInfo = withdrawRecordService.findPageBySpec(new DistWithdrawRecordDTO().setMemberUsername(query.getMemberUsername()));
        return PageResponseData.page(pageInfo.getCount(), pageInfo.getData());
    }

}
