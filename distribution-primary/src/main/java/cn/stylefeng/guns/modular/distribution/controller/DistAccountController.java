package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountDTO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 会员账户控制器
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Controller
@RequestMapping("/distAccount")
public class DistAccountController extends BaseController {

    private final String PREFIX = "/distAccount";

    @Autowired
    private DistAccountService distAccountService;


    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/distAccount.html";
    }


    /**
     * 启用/禁用
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(DistAccountDTO distAccountDTO) {
        distAccountService.update(distAccountDTO);
        return ResponseData.success();
    }


    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistAccountDTO distAccountDTO) {
        return distAccountService.findPageBySpec(distAccountDTO);
    }

}


