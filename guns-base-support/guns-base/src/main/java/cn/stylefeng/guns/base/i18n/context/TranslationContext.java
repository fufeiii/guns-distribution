package cn.stylefeng.guns.base.i18n.context;

import cn.stylefeng.guns.base.i18n.dict.TranslationDict;
import cn.stylefeng.guns.base.i18n.enums.TranslationEnum;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 翻译字典的容器
 *
 * @author fengshuonan
 * @Date 2019-06-20 13:37
 */
@Slf4j
public class TranslationContext {

    /**
     * 所有翻译字典
     */
    private static Map<TranslationEnum, Map<String, String>> TRAN_DICT_CONTAINER = new ConcurrentHashMap<>();

    /**
     * 初始化所有字典
     *
     * @author fengshuonan
     * @Date 2019/10/18 10:29
     */
    public static void init(List<TranslationDict> list) {

        //根据语种数量，创建多个map
        for (TranslationEnum type : TranslationEnum.values()) {
            HashMap<String, String> typeMap = new HashMap<>();
            TRAN_DICT_CONTAINER.put(type, typeMap);
        }

        //整理数据库中的字典
        for (TranslationDict translationDict : list) {
            TranslationEnum translationLanguages = translationDict.getTranslationLanguages();
            TRAN_DICT_CONTAINER.get(translationLanguages).put(translationDict.getTranCode(), translationDict.getTranValue());
        }

    }

    /**
     * 通过语种获取一套翻译字典
     *
     * @author fengshuonan
     * @Date 2019/10/18 10:41
     */
    public static Map<String, String> getTranslationByLanguage(TranslationEnum translationLanguages) {
        return TRAN_DICT_CONTAINER.get(translationLanguages);
    }

}
