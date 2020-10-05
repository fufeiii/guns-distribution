package cn.stylefeng.guns.sys.modular.system.controller;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.stylefeng.guns.sys.core.util.UeditorUtil;
import cn.stylefeng.guns.sys.modular.system.model.UeditorFileResult;
import cn.stylefeng.roses.kernel.model.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;

import static cn.stylefeng.guns.sys.core.exception.enums.BizExceptionEnum.UE_CONFIG_ERROR;

/**
 * UEditor相关文件操作
 *
 * @author fengshuonan
 * @Date 2019-08-27 10:02
 */
@Controller
@RequestMapping("/ueditor")
@Slf4j
public class UeditorController {

    /**
     * 获取ueditor的配置
     *
     * @author fengshuonan
     * @Date 2019/8/26 15:18
     */
    @RequestMapping("/config")
    @ResponseBody
    public void getConfigInfo(HttpServletResponse response) {
        try {
            response.setContentType("application/json;charset=utf-8");
            String json = ResourceUtil.readStr("classpath:ueditor.json", StandardCharsets.UTF_8);
            response.getWriter().write(json);
            response.getWriter().flush();
        } catch (Exception e) {
            log.error("读取ueditor配置失败!", e);
            throw new ServiceException(UE_CONFIG_ERROR);
        }
    }

    /**
     * 图片上传
     *
     * @author fengshuonan
     * @Date 2019/8/26 15:19
     */
    @RequestMapping(value = "/imgUpdate")
    @ResponseBody
    public UeditorFileResult imgUpdate(@RequestParam(value = "upfile") MultipartFile upfile) {
        return UeditorUtil.uploadFile(upfile, UeditorUtil.FileType.IMG);
    }

    /**
     * ueditor文件上传方法
     *
     * @author fengshuonan
     * @Date 2019-08-27 10:05
     */
    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @ResponseBody
    public UeditorFileResult uploadFile(@RequestParam(value = "upfile") MultipartFile upfile) {
        return UeditorUtil.uploadFile(upfile, UeditorUtil.FileType.FILE);
    }

    /**
     * 视频上传
     *
     * @author fengshuonan
     * @Date 2019-04-08 16:12
     */
    @RequestMapping(value = "/uploadvideo")
    @ResponseBody
    public UeditorFileResult uploadvideo(@RequestParam(value = "upfile") MultipartFile upfile) {
        return UeditorUtil.uploadFile(upfile, UeditorUtil.FileType.VIDEO);
    }

    /**
     * 通过url请求返回图像的字节流
     *
     * @author fengshuonan
     * @Date 2019-04-08 16:12
     */
    @RequestMapping("/images/{fileName}")
    public void getImages(@PathVariable("fileName") String fileName, HttpServletResponse response) {
        UeditorUtil.readFile(fileName, response, UeditorUtil.FileType.IMG, null);
    }


    /**
     * 通过url请求返回文件的字节流
     *
     * @author fengshuonan
     * @Date 2019-04-08 16:12
     */
    @RequestMapping("/file/{fileName}/{orginalName}")
    public void getIco(@PathVariable("fileName") String fileName, @PathVariable("orginalName") String orginalName, HttpServletResponse response) {
        UeditorUtil.readFile(fileName, response, UeditorUtil.FileType.FILE, orginalName);
    }


    /**
     * 通过url请求返回图像的字节流
     *
     * @author fengshuonan
     * @Date 2019-04-08 16:12
     */
    @RequestMapping("/video/{fileName}")
    public void getVideo(@PathVariable("fileName") String fileName, HttpServletResponse response) {
        UeditorUtil.readFile(fileName, response, UeditorUtil.FileType.VIDEO, null);
    }
}
