package cn.stylefeng.guns.modular.distribution.api.controller;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.api.request.CommonQuery;
import cn.stylefeng.guns.modular.distribution.api.response.PageResponseData;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.event.TradeGoodsEvent;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitEventService;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 分润相关的api接口
 *
 * @author Fu Fei
 * @date 2020/9/13
 */
@RestController
@RequestMapping("/api/v1/profit")
@Api(tags = "分润业务")
public class ProfitApiController {

    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    private DistProfitEventService distProfitEventService;


    @ApiOperation("发生交易分润")
    @PostMapping("/trade")
    public ResponseData profit(@Validated(ValidateGroup.Insert.class)
                               @RequestBody DistProfitEventDTO distProfitEventDTO, BindingResult result) {
        applicationEventPublisher.publishEvent(new TradeGoodsEvent(this, distProfitEventDTO));
        return ResponseData.success();
    }

    @ApiOperation("查询会员的分润佣金记录")
    @GetMapping("/record/list")
    public ResponseData recordList(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        IPage<DistProfitRecordVO> page4App = distProfitEventService.findProfitRecordPage4App(query.getMemberUsername(), null);
        return PageResponseData.page(page4App.getTotal(), page4App.getRecords());
    }

    @ApiOperation("查询会员的分销订单记录")
    @GetMapping("/trade/list")
    public ResponseData tradeList(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        IPage<DistProfitRecordVO> page4App = distProfitEventService.findProfitRecordPage4App(query.getMemberUsername(), ProfitTypeEnum.TRADE);
        return PageResponseData.page(page4App.getTotal(), page4App.getRecords());
    }


}
