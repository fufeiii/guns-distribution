package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitEventDTO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitEventService;
import cn.stylefeng.roses.core.base.controller.BaseController;
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
 * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distProfitEvent")
public class DistProfitEventController extends BaseController {

    private final String PREFIX = "/distProfitEvent";

    @Autowired
    private DistProfitEventService distProfitEventService;

    private void packageModel(Model model) {
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
        return PREFIX + "/distProfitEvent.html";
    }

    /**
     * 跳转到主页面
     */
    @RequestMapping("/eventRecords")
    public String records() {
        return PREFIX + "/distProfitEventRecords.html";
    }


    /**
     * 查看当前事件所属的分润记录
     */
    @RequestMapping("/records")
    @ResponseBody
    public LayuiPageInfo records(Long id) {
        return distProfitEventService.findRecords(id);
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistProfitEventDTO distProfitEventDTO) {
        return distProfitEventService.findPageBySpec(distProfitEventDTO);
    }

}


