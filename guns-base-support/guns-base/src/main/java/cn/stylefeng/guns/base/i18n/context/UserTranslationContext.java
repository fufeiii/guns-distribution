package cn.stylefeng.guns.base.i18n.context;

import cn.stylefeng.guns.base.i18n.enums.TranslationEnum;
import cn.stylefeng.roses.core.util.HttpContext;
import cn.stylefeng.roses.core.util.ToolUtil;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 带有用户信息的翻译字典的上下文
 *
 * @author fengshuonan
 * @Date 2019-06-20 13:37
 */
@Slf4j
public class UserTranslationContext {

    private static final String TRAN_COOKIE_NAME = "guns-tran";

    private static final Integer EXP_SECONDES = 7 * 24 * 3600;

    /**
     * 获取当前用户选择的语种
     *
     * @author fengshuonan
     * @Date 2019/10/18 11:06
     */
    public static void setUserCurrentTrans(TranslationEnum translationEnum) {
        Cookie languageCookie = new Cookie(TRAN_COOKIE_NAME, String.valueOf(translationEnum.getCode()));
        languageCookie.setMaxAge(EXP_SECONDES);
        languageCookie.setHttpOnly(true);
        languageCookie.setPath("/");
        HttpServletResponse response = HttpContext.getResponse();
        response.addCookie(languageCookie);
    }


    /**
     * 获取当前用户选择的语种
     *
     * @author fengshuonan
     * @Date 2019/10/18 11:06
     */
    public static TranslationEnum getUserCurrentTrans() {
        Cookie[] cookies = HttpContext.getRequest().getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (TRAN_COOKIE_NAME.equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (ToolUtil.isNotEmpty(value)) {
                        try {
                            return TranslationEnum.valueOf(Integer.valueOf(value));
                        } catch (Exception e) {
                            //非法输入，直接返回中文
                            return TranslationEnum.CHINESE;
                        }
                    }
                }
            }
        }

        //cookie没值，返回中文
        return TranslationEnum.CHINESE;
    }

    /**
     * 根据当前登陆用户选择的语言，翻译成指定编码对应语言的值
     *
     * @author fengshuonan
     * @Date 2019/10/18 10:41
     */
    public static String get(String code) {
        TranslationEnum translationEnum = getUserCurrentTrans();
        Map<String, String> translationByLanguage = TranslationContext.getTranslationByLanguage(translationEnum);
        return translationByLanguage.get(code);
    }

    /**
     * 根据当前登陆用户选择的语言，翻译成指定编码对应语言的值
     * <p>
     * 若查找不到code对应的值，则以第二个参数为准
     *
     * @author fengshuonan
     * @Date 2019/10/18 10:41
     */
    public static String get(String code, String defaultName) {
        TranslationEnum translationEnum = getUserCurrentTrans();
        Map<String, String> translationByLanguage = TranslationContext.getTranslationByLanguage(translationEnum);
        if (translationByLanguage == null || ToolUtil.isEmpty(translationByLanguage.get(code))) {
            return defaultName;
        } else {
            return translationByLanguage.get(code);
        }
    }

}
