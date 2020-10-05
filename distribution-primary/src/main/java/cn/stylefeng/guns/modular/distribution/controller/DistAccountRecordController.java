package cn.stylefeng.guns.modular.distribution.controller;

import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.modular.distribution.enums.biz.AccountTypeEnum;
import cn.stylefeng.guns.modular.distribution.enums.biz.ChangeTypeEnum;
import cn.stylefeng.guns.modular.distribution.model.dto.DistAccountRecordDTO;
import cn.stylefeng.guns.modular.distribution.model.vo.DistAccountRecordVO;
import cn.stylefeng.guns.modular.distribution.service.DistAccountRecordService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
 * 账户明细记录控制器
 *
 * @author Fu Fei
 * @date 2020-08-08 13:44:35
 */
@Controller
@RequestMapping("/distAccountRecord")
public class DistAccountRecordController extends BaseController {

    private final String PREFIX = "/distAccountRecord";

    @Autowired
    private DistAccountRecordService distAccountRecordService;

    private void packageModel(Model model) {
        List<Map<String, Object>> ctList = new LinkedList<>();
        for (ChangeTypeEnum value : ChangeTypeEnum.values()) {
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("name", value.name());
            map.put("message", value.getMessage());
            ctList.add(map);
        }
        model.addAttribute("cte", ctList);
        List<Map<String, Object>> atList = new LinkedList<>();
        for (AccountTypeEnum value : AccountTypeEnum.values()) {
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("name", value.name());
            map.put("message", value.getMessage());
            atList.add(map);
        }
        model.addAttribute("ate", atList);
    }

    /**
     * 跳转到主页面
     *
     * @param memberUsername 有值则是从账户管理那边过来查看明细的
     */
    @RequestMapping("")
    public String index(Model model, @RequestParam(required = false) String memberUsername) {
        this.packageModel(model);
        model.addAttribute("memberUsername", memberUsername);
        return PREFIX + "/distAccountRecord.html";
    }


    /**
     * 查看详情接口
     */
    @RequestMapping("/detail")
    @ResponseBody
    public ResponseData detail(DistAccountRecordDTO distAccountRecordDTO) {
        DistAccountRecordVO detail = distAccountRecordService.findBySpec(distAccountRecordDTO);
        return ResponseData.success(detail);
    }

    /**
     * 查询列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(DistAccountRecordDTO distAccountRecordDTO, @RequestParam(required = false) String type) {
        if (ToolUtil.isNotEmpty(type) && ToolUtil.isEmpty(distAccountRecordDTO.getMemberUsername())) {
            // 从账户管理的账户明细过来的,必须要有会员标识,否则返回空内容
            return LayuiPageFactory.createPageInfo(new Page<>());
        }
        return distAccountRecordService.findPageBySpec(distAccountRecordDTO);
    }

}


