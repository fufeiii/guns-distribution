package cn.stylefeng.guns.db.controller;

import cn.stylefeng.guns.base.db.entity.DatabaseInfo;
import cn.stylefeng.guns.base.db.util.DbUtil;
import cn.stylefeng.guns.base.pojo.page.LayuiPageFactory;
import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.base.db.model.params.DatabaseInfoParam;
import cn.stylefeng.guns.base.db.service.DatabaseInfoService;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


/**
 * 数据库信息表控制器
 *
 * @author stylefeng
 * @Date 2019-06-15 17:05:23
 */
@Controller
@RequestMapping("/databaseInfo")
public class DatabaseInfoController extends BaseController {

    /**
     * session中标识已选择条件字段的key
     */
    public static String CONDITION_FIELDS = "CONDITION_FIELDS";

    private String PREFIX = "/modular/databaseInfo";

    @Autowired
    private DatabaseInfoService databaseInfoService;

    /**
     * 跳转到主页面
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/databaseInfo.html";
    }

    /**
     * 新增页面
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @RequestMapping("/add")
    public String add() {
        return PREFIX + "/databaseInfo_add.html";
    }

    /**
     * 新增接口
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public ResponseData addItem(DatabaseInfoParam databaseInfoParam) {
        this.databaseInfoService.add(databaseInfoParam);
        return ResponseData.success();
    }

    /**
     * 编辑接口
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @RequestMapping("/editItem")
    @ResponseBody
    public ResponseData editItem(DatabaseInfoParam databaseInfoParam) {
        //this.databaseInfoService.update(databaseInfoParam);
        return ResponseData.success();
    }

    /**
     * 删除接口
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(DatabaseInfoParam databaseInfoParam) {
        this.databaseInfoService.delete(databaseInfoParam);
        return ResponseData.success();
    }

    /**
     * 查询列表
     *
     * @author stylefeng
     * @Date 2019-06-15
     */
    @ResponseBody
    @RequestMapping("/list")
    public LayuiPageInfo list(@RequestParam(value = "condition", required = false) String condition) {
        DatabaseInfoParam databaseInfoParam = new DatabaseInfoParam();
        databaseInfoParam.setDbName(condition);
        return this.databaseInfoService.findPageBySpec(databaseInfoParam);
    }

    /**
     * 获取某个数据源下的所有表
     *
     * @author fengshuonan
     * @Date 2019/1/30 2:49 PM
     */
    @RequestMapping("/tableList")
    @ResponseBody
    public Object tableList(Long dbId, HttpServletRequest request) {

        if (ToolUtil.isEmpty(dbId)) {
            return new LayuiPageInfo();
        }

        //清空session中的字段条件信息
        HttpSession session = request.getSession();
        session.removeAttribute(CONDITION_FIELDS);

        try {
            DatabaseInfo databaseInfo = databaseInfoService.getById(dbId);
            List<Map<String, Object>> maps = DbUtil.selectTables(databaseInfo);
            Page<Map<String, Object>> objectPage = new Page<>();
            objectPage.setRecords(maps);
            return LayuiPageFactory.createPageInfo(objectPage);
        } catch (Exception e) {
            Page<Map<String, Object>> objectPage = new Page<>();
            return LayuiPageFactory.createPageInfo(objectPage);
        }
    }
}


