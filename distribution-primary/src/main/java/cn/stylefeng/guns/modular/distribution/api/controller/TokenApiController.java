package cn.stylefeng.guns.modular.distribution.api.controller;

import cn.stylefeng.guns.base.auth.exception.AuthException;
import cn.stylefeng.guns.base.auth.exception.enums.AuthExceptionEnum;
import cn.stylefeng.guns.base.auth.jwt.JwtTokenUtil;
import cn.stylefeng.guns.base.auth.jwt.payload.JwtPayLoad;
import cn.stylefeng.guns.base.auth.service.AuthService;
import cn.stylefeng.guns.modular.distribution.properties.ApiProperties;
import cn.stylefeng.guns.sys.core.auth.cache.SessionManager;
import cn.stylefeng.guns.sys.core.auth.util.TokenUtil;
import cn.stylefeng.guns.sys.core.util.SaltUtil;
import cn.stylefeng.guns.sys.modular.system.entity.User;
import cn.stylefeng.guns.sys.modular.system.service.UserService;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.exception.RequestEmptyException;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 处理token相关请求
 *
 * @author Fu Fei
 * @date 2020/10/1
 */
@RestController
@RequestMapping("/api/v1/token")
@Api(tags = "token业务")
public class TokenApiController {

    @Autowired
    private UserService userService;
    @Autowired
    private AuthService authService;
    @Autowired
    private SessionManager sessionManager;
    @Autowired
    private ApiProperties apiProperties;


    /**
     * 此接口的请求地址在 cn.stylefeng.guns.config.security.WebSecurityConfig#configure 配置了
     * 取消了校验，即不会被拦截。若修改了token路径，记得修改
     */
    @ApiOperation(value = "获取token", notes = "获取新的token")
    @PostMapping("/get")
    public ResponseData get(String password, String username) {
        if (ToolUtil.isOneEmpty(username, password)) {
            throw new RequestEmptyException("账号或密码为空！");
        }

        User user = userService.getByAccount(username);
        if (null == user) {
            throw new AuthException(AuthExceptionEnum.USERNAME_PWD_ERROR);
        }

        //验证账号密码是否正确
        String requestMd5 = SaltUtil.md5Encrypt(password, user.getSalt());
        String dbMd5 = user.getPassword();
        if (dbMd5 == null || !dbMd5.equalsIgnoreCase(requestMd5)) {
            throw new AuthException(AuthExceptionEnum.USERNAME_PWD_ERROR);
        }

        // 移除旧的api会话
        sessionManager.removeApiSession(username);

        JwtPayLoad payLoad = new JwtPayLoad(user.getUserId(), user.getAccount(), "xxxx");

        long timeout = apiProperties.getTokenExpiredMonth() * 30 * 24 * 60 * 60;
        //创建token
        String token = JwtTokenUtil.generateToken(payLoad, timeout);

        //创建API会话
        sessionManager.createApiSession(username, authService.user(username), timeout);

        return ResponseData.success(token);
    }


    @ApiOperation(value = "删除token", notes = "移除当前token")
    @PostMapping("/delete")
    public ResponseData delete() {
        sessionManager.removeApiSession(JwtTokenUtil.getJwtPayLoad(TokenUtil.getApiToken()).getAccount());
        return ResponseData.success();
    }

}
