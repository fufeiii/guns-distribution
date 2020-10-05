package cn.stylefeng.guns.modular.distribution.exception.handler;

import cn.stylefeng.guns.modular.distribution.exception.DistributionException;
import cn.stylefeng.guns.sys.core.exception.enums.BizExceptionEnum;
import cn.stylefeng.roses.kernel.model.response.ErrorResponseData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


/**
 * 此异常处理器，在guns的{@link cn.stylefeng.guns.sys.core.exception.aop.GlobalExceptionHandler}之前加入到容器。
 * 只对分销模块(cn.stylefeng.guns.modular.distribution)发生的异常做处理
 * 其他的会被guns的ExceptionHandler处理。
 *
 * @author Fu Fei
 * @date 2020/7/5
 */
@Order(-101)
@Slf4j
@RestControllerAdvice("cn.stylefeng.guns.modular.distribution")
public class DistributionExceptionHandler {


    /**
     * 拦截分销业务异常
     */
    @ExceptionHandler(DistributionException.class)
    @ResponseStatus(HttpStatus.OK)
    public ErrorResponseData business(DistributionException e) {
        final String title = "[biz exception]: ";
        log.error(title, e);
        return new ErrorResponseData(e.getCode(), e.getMessage());
    }


    /**
     * 拦截其他异常
     */
    @ExceptionHandler(Throwable.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResponseData notFount(Throwable e) {
        final String title = "[unknown exception]: ";
        log.error(title, e);
        String message = title + e.getClass().getName() + ": " + e.getMessage()
                + ", [stackTrace]: " + e.getStackTrace()[0];
        return new ErrorResponseData(BizExceptionEnum.SERVER_ERROR.getCode(), message);
    }

}
