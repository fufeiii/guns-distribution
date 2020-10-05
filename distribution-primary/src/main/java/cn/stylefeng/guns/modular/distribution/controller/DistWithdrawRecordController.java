package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.DisposeStateEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistWithdrawRecordDTO;
import cn.stylefeng.guns.modular.distribution.service.DistWithdrawRecordService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * 提现申请记录控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distWithdrawRecord")
public class DistWithdrawRecordController extends BaseController {

    private final String PREFIX = "/distWithdrawRecord";

    @Autowired
    private DistWithdrawRecordService distWithdrawRecordService;



    private void packageModel(Model model) {
        List<Map<String, Object>> dseList = new LinkedList<>();
        for (DisposeStateEnum disposeStateEnum : DisposeStateEnum.values()) {
            Map<String, Object> dse = new HashMap<>(2);
            dse.put("name", disposeStateEnum.name());
            dse.put("message", disposeStateEnum.getMessage());
            dseList.add(dse);
        }
        model.addAttribute("dse", dseList);
    }

    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index(Model model) {
        this.packageModel(model);
        return PREFIX + "/distWithdrawRecord.html";
    }

    /**
     * 新增页面
     */
    @RequestMapping("/add")
    public String add() {
        return PREFIX + "/distWithdrawRecord_add.html";
    }

    /**
     * 编辑页面
     */
    @RequestMapping("/edit")
    public String edit() {
        return PREFIX + "/distWithdrawRecord_edit.html";
    }


    /**
     * 审核接口
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData audit(DistWithdrawRecordDTO distWithdrawRecordDTO) {
        distWithdrawRecordService.audit(distWithdrawRecordDTO);
        return ResponseData.success();
    }

    /**
     * 测试发起资金变动
     */
    @RequestMapping("/doWithdrawDeposit")
    @ResponseBody
    public ResponseData doWithdrawDeposit(DistWithdrawRecordDTO distWithdrawRecordDTO) {
        distWithdrawRecordService.doWithdrawDeposit(distWithdrawRecordDTO);
        return ResponseData.success();
    }


    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistWithdrawRecordDTO distWithdrawRecordDTO) {
        return distWithdrawRecordService.findPageBySpec(distWithdrawRecordDTO);
    }

}


