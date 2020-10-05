package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.MemberTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.StateEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * 会员控制器
 *
 * @author Fu Fei
 * @date 2020-08-08
 */
@Controller
@RequestMapping("/distMember")
public class DistMemberController extends BaseController {

    private final String PREFIX = "/distMember";

    @Autowired
    private DistMemberService distMemberService;

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

    /**
     * 跳转到主页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/distMember.html";
    }

    /**
     * 跳转到层级页面
     */
    @RequestMapping("/tree")
    public String tree() {
        return PREFIX + "/distMemberTree.html";
    }


    /**
     * 新增页面
     */
    @RequestMapping("/add")
    public String add(Model model) {
        this.packageModel(model);
        return PREFIX + "/distMember_add.html";
    }

    /**
     * 编辑页面
     */
    @RequestMapping("/edit")
    public String edit(Model model) {
        this.packageModel(model);
        return PREFIX + "/distMember_edit.html";
    }

    /**
     * 查看层级代理
     *
     * @param parent 当前人员的父级，为空代表第一次初始化加载
     */
    @RequestMapping("/tree/getAll")
    @ResponseBody
    public ResponseData treeGetAll(@RequestParam(required = false) String parent) {
        return ResponseData.success(distMemberService.team(parent));
    }


    /**
     * 新增接口
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public ResponseData addItem(DistMemberDTO distMemberDTO) {
        this.distMemberService.add(distMemberDTO);
        return ResponseData.success();
    }

    /**
     * 编辑接口
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(DistMemberDTO distMemberDTO) {
        distMemberService.update(distMemberDTO);
        return ResponseData.success();
    }

    /**
     * 查看详情接口
     */
    @RequestMapping("/detail")
    @ResponseBody
    public ResponseData detail(DistMemberDTO distMemberDTO) {
        DistMemberVO detail = distMemberService.findBySpec(distMemberDTO);
        return ResponseData.success(detail);
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistMemberDTO distMemberDTO) {
        return distMemberService.findPageBySpec(distMemberDTO);
    }


    /**
     * 会员账户
     */
    @ResponseBody
    @RequestMapping("/account")
    public ResponseData account(Long memberId) {
        return ResponseData.success(this.distMemberService.account(memberId));
    }

}


