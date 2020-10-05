package cn.stylefeng.guns.modular.distribution.aop.vaildate;

import cn.stylefeng.roses.kernel.model.response.ResponseData;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.Arrays;

/**
 * 作用范围在分销模块的controller，且末尾参数是BindingResult
 * 帮助查看在使用@Validated(分组)后，检查BindingResult是否存在参数错误
 * 避免在每个接口处写相同的语句。
 *
 * @author Fu Fei
 * @date 2020/7/18
 */
@Aspect
@Component
@Order(200)
public class ValidateAop {

    private static final int PARAM_ERROR_CODE = 400;


    /**
     * controller中需要进行校验的接口的连接点
     */
    @Pointcut("execution(public * cn.stylefeng.guns.modular.distribution..*.*(.., org.springframework.validation.BindingResult))")
    public void controllerPointcut() {
    }


    @Around("controllerPointcut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        // 获取入参
        Object[] args = pjp.getArgs();
        // 根据execution表达式，最后一个参数绝对是BindingResult
        BindingResult bindingResult = (BindingResult) args[args.length - 1];
        // 此aop的order设置较小，所以在此aop前，bindingResult已经被spring的aop赋予了对应的值。
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            String message = fieldError != null ? fieldError.getDefaultMessage() : "参数错误！".concat(Arrays.toString(args));
            // 每个检查注解需要填写message字段
            return ResponseData.error(PARAM_ERROR_CODE, message);
        }
        return pjp.proceed();
    }


}
