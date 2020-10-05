package cn.stylefeng.guns.sys.core.auth.filter;

import cn.stylefeng.guns.base.auth.jwt.JwtTokenUtil;
import cn.stylefeng.guns.sys.core.auth.cache.SessionManager;
import cn.stylefeng.guns.sys.core.auth.util.TokenUtil;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.response.ErrorResponseData;
import cn.stylefeng.roses.kernel.model.response.ResponseData;
import com.alibaba.fastjson.JSON;
import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * 这个过滤器，在所有请求之前，也在spring security filters之前
 * <p>
 * 这个过滤器的作用是：接口在进业务之前，添加登录上下文（SecurityContext和LoginContext）
 * <p>
 * 因为现在的Guns没有用session了，只能token来校验当前的登录人的身份，所以在进业务之前要给当前登录人设置登录状态
 *
 * @author fengshuonan
 * @Date 2019/7/20 21:33
 */
@Component
public class ApiJwtAuthorizationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private SessionManager sessionManager;
    private final ResponseData responseData = new ErrorResponseData(401, "token认证失败");

    public ApiJwtAuthorizationTokenFilter() {
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        AntPathMatcher antPathMatcher = new AntPathMatcher();
        String jsonFormat  = "application/json;charset=UTF-8";
        String servletPath = request.getServletPath();
        // 1、放行非api开头的请求 和 获取token的请求
        if (!antPathMatcher.match(NoneAuthedResources.API_PREFIX_PATTERN, servletPath) || NoneAuthedResources.API_TOKEN_PATH.equals(servletPath)) {
            chain.doFilter(request, response);
            return;
        }

        // 2.从cookie和header获取token，如果是api请求，只会存在token中
        String authToken = TokenUtil.getApiToken();
        if (ToolUtil.isEmpty(authToken)) {
            this.doResponse(response, jsonFormat);
            return;
        }

        // 3.通过token获取用户名
        String username;

        try {
            username = JwtTokenUtil.getJwtPayLoad(authToken).getAccount();
        } catch (IllegalArgumentException | JwtException e) {
            this.doResponse(response, jsonFormat);
            return;
        }

        // guns-distribution新增 假设是api请求
        UserDetails apiUserDetails = sessionManager.getApiSession(username);
        if (Objects.isNull(apiUserDetails)) {
            this.doResponse(response, jsonFormat);
            return;
        }

        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                apiUserDetails, null, apiUserDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        chain.doFilter(request, response);

    }

    private void doResponse(HttpServletResponse response, String jsonFormat) throws IOException {
        response.setContentType(jsonFormat);
        response.getWriter().write(JSON.toJSONString(responseData));
    }

}
