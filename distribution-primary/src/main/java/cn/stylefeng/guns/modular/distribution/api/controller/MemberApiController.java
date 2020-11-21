package cn.stylefeng.guns.modular.distribution.api.controller;

import cn.stylefeng.guns.modular.distribution.aop.vaildate.ValidateGroup;
import cn.stylefeng.guns.modular.distribution.api.request.CommonQuery;
import cn.stylefeng.guns.modular.distribution.api.response.MemberIndexVO;
import cn.stylefeng.guns.modular.distribution.api.response.MemberTeamVO;
import cn.stylefeng.guns.modular.distribution.model.dto.DistMemberDTO;
import cn.stylefeng.guns.modular.distribution.service.DistDashboardService;
import cn.stylefeng.guns.modular.distribution.service.DistMemberService;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 会员相关api接口
 *
 * @author Fu Fei
 * @date 2020/9/13
 */
@RestController
@RequestMapping("/api/v1/member")
@Api(tags = "会员业务")
public class MemberApiController {

    @Autowired
    private DistMemberService distMemberService;
    @Autowired
    private DistDashboardService distDashboardService;

    @ApiOperation(value = "新增用户", notes = "新增时，用户标识和用户昵称为必填字段，id为不填字段，其余为可选字段")
    @PostMapping("/add")
    public ResponseData addItem(@Validated(ValidateGroup.Insert.class)
                                @RequestBody DistMemberDTO distMemberDTO, BindingResult result) {
        this.distMemberService.add(distMemberDTO);
        return ResponseData.success();
    }


    @ApiOperation(value = "首页数据总览", notes = "包含相关模块的数字")
    @GetMapping("/index")
    public ResponseData index(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        MemberIndexVO memberIndex = distDashboardService.memberIndex4App(query.getMemberUsername());
        return ResponseData.success(memberIndex);
    }


    @ApiOperation(value = "我的团队", notes = "")
    @GetMapping("/team")
    public ResponseData team(@Validated(ValidateGroup.Special.class) CommonQuery query, BindingResult result) {
        MemberTeamVO team = this.distMemberService.team(query.getMemberUsername());
        return ResponseData.success(team);
    }


}
