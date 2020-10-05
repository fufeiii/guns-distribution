package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitRecordService;
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
 * 分润记录控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distProfitRecord")
public class DistProfitRecordController extends BaseController {

    private final String PREFIX = "/distProfitRecord";

    @Autowired
    private DistProfitRecordService distProfitRecordService;

    /**
     * 封装固定的参数
     *
     * @param model model
     */
    private void packageModel(Model model) {
        // 遍历 账户类型 枚举
        List<Map<String, Object>> ateList = new LinkedList<>();
        for (AccountTypeEnum accountTypeEnum : AccountTypeEnum.values()) {
            Map<String, Object> ate = new HashMap<>(2);
            ate.put("name", accountTypeEnum.name());
            ate.put("message", accountTypeEnum.getMessage());
            ateList.add(ate);
        }
        model.addAttribute("ate", ateList);

        // 遍历 分润类型 枚举
        List<Map<String, Object>> pteList = new LinkedList<>();
        for (ProfitTypeEnum profitTypeEnum : ProfitTypeEnum.values()) {
            Map<String, Object> pte = new HashMap<>(2);
            pte.put("name", profitTypeEnum.name());
            pte.put("message", profitTypeEnum.getMessage());
            pteList.add(pte);
        }
        model.addAttribute("pte", pteList);
    }


    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index(Model model) {
        this.packageModel(model);
        return PREFIX + "/distProfitRecord.html";
    }



    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistProfitRecordDTO distProfitRecordDTO) {
        return distProfitRecordService.findPageBySpec(distProfitRecordDTO);
    }

}


