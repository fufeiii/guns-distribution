package cn.stylefeng.guns.modular.distribution.util;

import cn.stylefeng.roses.core.util.ToolUtil;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.Set;

/**
 * 验证工具类，配合javax.validation使用
 *
 * @author Fu Fei
 * @date 2020/7/5
 */
public class ValidatorUtil {

    private final static Validator VALIDATOR = Validation.buildDefaultValidatorFactory().getValidator();

    private ValidatorUtil() {
    }

    /**
     * 验证对象是否符合要求，不符合时抛出异常
     *
     * @param object 被验证的对象
     * @param groups 验证组
     * @throws ValidationException 验证失败
     */
    public static Result validate(Object object, Class<?>... groups) {
        boolean pass = true;
        String message = null;
        Set<ConstraintViolation<Object>> constraintViolations = VALIDATOR.validate(object, groups);
        if (ToolUtil.isNotEmpty(constraintViolations)) {
            // 获取第一个不符合规范的约束。
            ConstraintViolation<Object> constraint = constraintViolations.iterator().next();
            pass = false;
            message = constraint.getMessage();
        }
        return new Result(pass, message);
    }

    /**
     * 验证对象是否符合要求，不符合返回false
     *
     * @param object 被验证的对象
     * @param groups 验证组
     * @return 是否验证成功
     */
    public static boolean isValidate(Object object, Class<?>... groups) {
        boolean result = true;
        Set<ConstraintViolation<Object>> constraintViolations = VALIDATOR.validate(object, groups);
        if (ToolUtil.isNotEmpty(constraintViolations)) {
            result = false;
        }
        return result;
    }

    /**
     * 校验结果bean
     */
     public static class Result {
        private final boolean passed;
        private final String message;

        private Result(boolean passed, String message) {
            this.passed = passed;
            this.message = message;
        }
        public boolean isPassed() {
            return passed;
        }
        public String getMessage() {
            return message;
        }
    }

}
