package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.api.request.CommonQuery;
import cn.stylefeng.guns.modular.distribution.api.response.MemberIndexVO;
import cn.stylefeng.guns.modular.distribution.api.response.MemberTeamVO;
import cn.stylefeng.guns.modular.distribution.api.response.PageResponseData;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ProfitTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.event.TradeGoodsEvent;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import cn.stylefeng.guns.modular.distribution.service.*;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/**
 * 模拟操作 控制器
 *
 * @author Fu Fei
 * @date 2020/9/12
 */
//@Profile({"dev", "local"})
@Controller
@RequestMapping("/mock")
public class MockController extends BaseController {
    @Autowired
    private DistMemberService distMemberService;
    @Autowired
    private DistAccountService distAccountService;
    @Autowired
    private DistAccountRecordService distAccountRecordService;
    @Autowired
    private DistProfitEventService distProfitEventService;
    @Autowired
    private DistProfitRecordService distProfitRecordService;
    @Autowired
    private DistWithdrawRecordService distWithdrawRecordService;
    @Autowired
    private DistDashboardService distDashboardService;
    @Autowired
    private DistWithdrawRecordService withdrawRecordService;

    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;


    @Value("${spring.profiles.active}")
    private String active;


    private boolean isProd() {
        return "prod".equalsIgnoreCase(active);
    }

    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("isProd", this.isProd());
        return "/mock/mock.html";
    }

    private void packageModel(Model model) {
        List<Map<String, Object>> mtList = new LinkedList<>();
        for (MemberTypeEnum value : MemberTypeEnum.values()) {
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("name", value.name());
            map.put("message", value.getMessage());
            mtList.add(map);
        }
        model.addAttribute("mt", mtList);

        List<Map<String, Object>> csList = new LinkedList<>();
        for (StateEnum value : StateEnum.values()) {
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("name", value.name());
            map.put("message", value.getMessage());
            csList.add(map);
        }
        model.addAttribute("cs", csList);
    }

    @RequestMapping("/memberAdd")
    public String memberAdd(Model model) {
        this.packageModel(model);
        model.addAttribute("isProd", this.isProd());
        return "/mock/memberAdd.html";
    }

    @RequestMapping("/profitTrade")
    public String profitTrade(Model model) {
        model.addAttribute("isProd", this.isProd());
        return "/mock/profitTrade.html";
    }

    @RequestMapping("/withdrawalRequest")
    public String withdrawalRequest(Model model) {
        model.addAttribute("isProd", this.isProd());
        return "/mock/withdrawalRequest.html";
    }

    @RequestMapping("/memberIndex")
    public String memberIndex(Model model) {
        model.addAttribute("isProd", this.isProd());
        return "/mock/memberIndex.html";
    }


    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/tenantClear")
    @ResponseBody
    public ResponseData tenantClear() {
        distAccountService.remove(null);
        distMemberService.remove(null);
        distAccountRecordService.remove(null);
        distMemberService.remove(null);
        distProfitRecordService.remove(null);
        distProfitEventService.remove(null);
        distWithdrawRecordService.remove(null);
        return ResponseData.success();
    }


    @PostMapping("/forward/member/add")
    @ResponseBody
    public ResponseData forwardMemberAdd(@Validated(ValidateGroup.Insert.class)
                                @RequestBody DistMemberDTO distMemberDTO, BindingResult result) {
        this.distMemberService.add(distMemberDTO);
        return ResponseData.success();
    }

    @GetMapping("/forward/member/index")
    @ResponseBody
    public ResponseData forwardMemberIndex(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) throws ExecutionException, InterruptedException {
        MemberIndexVO memberIndex = distDashboardService.memberIndex4App(query.getMemberUsername());
        return ResponseData.success(memberIndex);
    }

    @PostMapping("/forward/profit/trade")
    @ResponseBody
    public ResponseData forwardProfitTrade(@Validated(ValidateGroup.Insert.class)
                                           @RequestBody DistProfitEventDTO distProfitEventDTO, BindingResult result) {
        applicationEventPublisher.publishEvent(new TradeGoodsEvent(this, distProfitEventDTO));
        return ResponseData.success();
    }

    @GetMapping("/forward/profit/record/list")
    @ResponseBody
    public ResponseData forwardProfitRecordList(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        IPage<DistProfitRecordVO> page4App = distProfitEventService.findProfitRecordPage4App(query.getMemberUsername(), null);
        return PageResponseData.page(page4App.getTotal(), page4App.getRecords());
    }

    @GetMapping("/forward/profit/trade/list")
    @ResponseBody
    public ResponseData forwardProfitTradeList(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        IPage<DistProfitRecordVO> page4App = distProfitEventService.findProfitRecordPage4App(query.getMemberUsername(), ProfitTypeEnum.TRADE);
        return PageResponseData.page(page4App.getTotal(), page4App.getRecords());
    }


    @GetMapping("/forward/withdraw/list")
    @ResponseBody
    public ResponseData forwardWithdrawList(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        LayuiPageInfo pageInfo = withdrawRecordService.findPageBySpec(new DistWithdrawRecordDTO().setMemberUsername(query.getMemberUsername()));
        return PageResponseData.page(pageInfo.getCount(), pageInfo.getData());
    }


    @PostMapping("/forward/withdraw/initiate")
    @ResponseBody
    public ResponseData forwardWithdrawInitiate(@Validated(ValidateGroup.Insert.class)
                                 @RequestBody DistWithdrawRecordDTO withdrawRecordDTO, BindingResult result) {
        withdrawRecordService.initiate(withdrawRecordDTO);
        return ResponseData.success();
    }

    @GetMapping("/forward/member/team")
    @ResponseBody
    public ResponseData team(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        MemberTeamVO team = this.distMemberService.team(query.getMemberUsername());
        return ResponseData.success(team);
    }

}
