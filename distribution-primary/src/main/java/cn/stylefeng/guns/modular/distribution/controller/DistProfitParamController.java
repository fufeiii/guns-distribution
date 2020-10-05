package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.*;
import cn.stylefeng.guns.modular.distribution.model.dto.DistProfitParamDTO;
import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.model.vo.DistProfitParamVO;
import cn.stylefeng.guns.modular.distribution.service.DistProfitParamService;
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
 * 分润参数控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distProfitParam")
public class DistProfitParamController extends BaseController {

    private final String PREFIX = "/distProfitParam";

    @Autowired
    private DistProfitParamService distProfitParamService;

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

        // 遍历 分润计算方式 枚举
        List<Map<String, Object>> cmeList = new LinkedList<>();
        for (CalculateModeEnum calculateModeEnum : CalculateModeEnum.values()) {
            Map<String, Object> cme = new HashMap<>(2);
            cme.put("name", calculateModeEnum.name());
            cme.put("message", calculateModeEnum.getMessage());
            cmeList.add(cme);
        }
        model.addAttribute("cme", cmeList);

        // 分销等级 暂时先这样模拟一下
        List<Map<String, Object>> levelList = new LinkedList<>();
        for (ProfitLevelEnum profitLevelEnum : ProfitLevelEnum.values()) {
            Map<String, Object> le = new HashMap<>(2);
            le.put("name", profitLevelEnum.name());
            le.put("message", profitLevelEnum.getMessage());
            levelList.add(le);
        }
        model.addAttribute("ple", levelList);

        // 遍历 用户段位 枚举
        List<Map<String, Object>> mreList = new LinkedList<>();
        for (MemberRankEnum memberRankEnum : MemberRankEnum.values()) {
            Map<String, Object> mre = new HashMap<>(2);
            mre.put("name", memberRankEnum.name());
            mre.put("message", memberRankEnum.getMessage());
            mreList.add(mre);
        }
        model.addAttribute("mre", mreList);

        // 遍历 用户身份 枚举
        List<Map<String, Object>> mteList = new LinkedList<>();
        for (MemberTypeEnum memberTypeEnum : MemberTypeEnum.values()) {
            Map<String, Object> mte = new HashMap<>(2);
            mte.put("name", memberTypeEnum.name());
            mte.put("message", memberTypeEnum.getMessage());
            mteList.add(mte);
        }
        model.addAttribute("mte", mteList);

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
    public String index(Model model) {
        this.packageModel(model);
        return PREFIX + "/distProfitParam.html";
    }

    /**
     * 新增页面
     */
    @RequestMapping("/add")
    public String add(Model model) {
        this.packageModel(model);
        return PREFIX + "/distProfitParam_add.html";
    }

    /**
     * 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(Model model) {
        this.packageModel(model);
        return PREFIX + "/distProfitParam_edit.html";
    }

    /**
     * 新增接口
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public ResponseData addItem(@Validated(ValidateGroup.Insert.class) DistProfitParamDTO distProfitParamDTO, BindingResult result) {
        distProfitParamService.add(distProfitParamDTO);
        return ResponseData.success();
    }

    /**
     * 编辑接口
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(@Validated({ValidateGroup.PrimaryKey.class, ValidateGroup.Insert.class})
                                     DistProfitParamDTO distProfitParamDTO, BindingResult result) {
        distProfitParamService.update(distProfitParamDTO);
        return ResponseData.success();
    }

    /**
     * 删除接口
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(@Validated({ValidateGroup.PrimaryKey.class}) DistProfitParamDTO distProfitParamDTO) {
        distProfitParamService.delete(distProfitParamDTO);
        return ResponseData.success();
    }

    /**
     * 查看详情接口
     */
    @RequestMapping("/detail")
    @ResponseBody
    public ResponseData detail(DistProfitParamDTO distProfitParamDTO) {
        DistProfitParamVO detail = distProfitParamService.findBySpec(distProfitParamDTO);
        return ResponseData.success(detail);
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistProfitParamDTO distProfitParamDTO) {
        return distProfitParamService.findPageBySpec(distProfitParamDTO);
    }

}


