package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.modular.distribution.service.DistDashboardService;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 控制台
 *
 * @author Fu Fei
 * @date 2020/9/4
 */
@Controller
@RequestMapping("/distDashboard")
public class DistDashboardController {

    @Autowired
    private DistDashboardService distDashboardService;

    private final String PREFIX = "/distDashboard";

    @RequestMapping("/workplace")
    public String workplace() {
        return PREFIX + "/workplace.html";
    }

    @RequestMapping("/businessStatistics")
    public String businessStatistics() {
        return PREFIX + "/businessStatistics.html";
    }


    /**
     * 首页的所有的数字
     */
    @RequestMapping("/workplace/summaryNums")
    @ResponseBody
    public ResponseData summaryNums() {
        return ResponseData.success(distDashboardService.summaryNums());
    }

    /**
     * 会员邀请排名
     */
    @RequestMapping("/workplace/memberTop")
    @ResponseBody
    public ResponseData memberTop(@RequestParam(required = false, defaultValue = "10") Integer top) {
        return ResponseData.success(distDashboardService.memberTop4Web(top));
    }

}
