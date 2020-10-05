package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberRankEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistRankParamDTO;
import cn.stylefeng.guns.modular.distribution.service.DistRankParamService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * 段位配置控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distRankParam")
public class DistRankParamController extends BaseController {

    private final String PREFIX = "/distRankParam";

    @Autowired
    private DistRankParamService distRankParamService;

    /**
     * 封装固定的参数
     *
     * @param model model
     */
    private void packageModel(Model model) {
        // 遍历 用户段位 枚举
        List<Map<String, Object>> mreList = new LinkedList<>();
        for (MemberRankEnum memberRankEnum : MemberRankEnum.values()) {
            Map<String, Object> mre = new HashMap<>(2);
            mre.put("name", memberRankEnum.name());
            mre.put("message", memberRankEnum.getMessage());
            mreList.add(mre);
        }
        model.addAttribute("mre", mreList);

        // 遍历 状态 枚举
        List<Map<String, Object>> seList = new LinkedList<>();
        for (StateEnum stateEnum : StateEnum.values()) {
            Map<String, Object> se = new HashMap<>(2);
            se.put("name", stateEnum.name());
            se.put("message", stateEnum.getMessage());
            seList.add(se);
        }
        model.addAttribute("se", seList);
    }

    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/distRankParam.html";
    }

    /**
     * 新增页面
     */
    @RequestMapping("/add")
    public String add(Model model) {
        this.packageModel(model);
        return PREFIX + "/distRankParam_add.html";
    }

    /**
     * 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(Model model) {
        this.packageModel(model);
        return PREFIX + "/distRankParam_edit.html";
    }

    /**
     * 新增接口
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public ResponseData addItem(@Validated(ValidateGroup.Insert.class) DistRankParamDTO distRankParamDTO, BindingResult result) {
        distRankParamService.add(distRankParamDTO);
        return ResponseData.success();
    }

    /**
     * 编辑接口
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(@Validated({ValidateGroup.PrimaryKey.class, ValidateGroup.Insert.class}) DistRankParamDTO distRankParamDTO, BindingResult result) {
        distRankParamService.update(distRankParamDTO);
        return ResponseData.success();
    }

    /**
     * 删除接口
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(DistRankParamDTO distRankParamDTO) {
        distRankParamService.delete(distRankParamDTO);
        return ResponseData.success();
    }

    /**
     * 查看详情接口
     */
    @RequestMapping("/detail")
    @ResponseBody
    public ResponseData detail(DistRankParamDTO distRankParamDTO) {
        return ResponseData.success(distRankParamService.findBySpec(distRankParamDTO));
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistRankParamDTO distRankParamDTO) {
        return this.distRankParamService.findPageBySpec(distRankParamDTO);
    }

}


