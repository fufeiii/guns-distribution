package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistPlatformDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistPlatformVO;
import cn.stylefeng.guns.modular.distribution.service.DistPlatformService;
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
 * 平台控制器
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Controller
@RequestMapping("/distPlatform")
public class DistPlatformController extends BaseController {

    private final String PREFIX = "/distPlatform";

    @Autowired
    private DistPlatformService distPlatformService;

    private void packageModel(Model model) {
        List<Map<String, Object>> csList = new LinkedList<>();
        for (StateEnum value : StateEnum.values()) {
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("name", value.name());
            map.put("message", value.getMessage());
            csList.add(map);
        }
        model.addAttribute("cs", csList);
    }

    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/distPlatform.html";
    }

    /**
     * 新增页面
     */
    @RequestMapping("/add")
    public String add(Model model) {
        this.packageModel(model);
        return PREFIX + "/distPlatform_add.html";
    }

    /**
     * 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(Model model) {
        this.packageModel(model);
        return PREFIX + "/distPlatform_edit.html";
    }

    /**
     * 新增接口
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public ResponseData addItem(DistPlatformDTO distPlatformDTO) {
        distPlatformService.add(distPlatformDTO);
        return ResponseData.success();
    }

    /**
     * 编辑接口
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(DistPlatformDTO distPlatformDTO) {
        distPlatformService.update(distPlatformDTO);
        return ResponseData.success();
    }

    /**
     * 删除接口
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(DistPlatformDTO distPlatformDTO) {
        distPlatformService.delete(distPlatformDTO);
        return ResponseData.success();
    }

    /**
     * 查看详情接口
     */
    @RequestMapping("/detail")
    @ResponseBody
    public ResponseData detail(DistPlatformDTO distPlatformDTO) {
        DistPlatformVO detail = distPlatformService.findBySpec(distPlatformDTO);
        return ResponseData.success(detail);
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistPlatformDTO distPlatformDTO) {
        return distPlatformService.findPageBySpec(distPlatformDTO);
    }

}


