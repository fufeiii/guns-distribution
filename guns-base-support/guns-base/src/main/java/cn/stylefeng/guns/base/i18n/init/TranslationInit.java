package cn.stylefeng.guns.base.i18n.init;

import cn.stylefeng.guns.base.i18n.context.TranslationContext;
import cn.stylefeng.guns.base.i18n.dict.TranslationDict;
import cn.stylefeng.guns.base.i18n.entity.Translation;
import cn.stylefeng.guns.base.i18n.enums.DefaultDicts;
import cn.stylefeng.guns.base.i18n.enums.TranslationEnum;
import cn.stylefeng.guns.base.i18n.service.TranslationService;
import cn.stylefeng.roses.core.util.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 参数配置 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2019-06-20
 */
@Component
@Slf4j
public class TranslationInit implements CommandLineRunner {

    @Override
    public void run(String... args) {
        try {
            //从数据库加载字典
            initFromTable();
        } catch (Exception e) {
            log.warn("从数据库初始化字典失败，读取默认字典!");
            //加载默认的一些字典
            initDefaultDicts();
        }
    }

    /**
     * 从数据库加载字典
     *
     * @author fengshuonan
     * @Date 2020/3/18 12:59
     */
    private void initFromTable() {
        ArrayList<TranslationDict> translationDicts = new ArrayList<>();

        //从数据库读取字典
        TranslationService translationService = SpringContextHolder.getBean(TranslationService.class);
        List<Translation> list = translationService.list();

        if (list != null) {
            for (Translation translation : list) {
                TranslationDict translationDict = new TranslationDict();
                translationDict.setTranCode(translation.getTranCode());
                translationDict.setTranName(translation.getTranName());
                translationDict.setTranslationLanguages(TranslationEnum.valueOf(translation.getLanguages()));
                translationDict.setTranValue(translation.getTranValue());
                translationDicts.add(translationDict);
            }
            TranslationContext.init(translationDicts);
            log.info("初始化所有的翻译字典" + list.size() + "条！");
        }
    }

    /**
     * 初始化默认系统字典
     *
     * @author fengshuonan
     * @Date 2020/3/18 12:58
     */
    private void initDefaultDicts() {
        ArrayList<TranslationDict> translationDicts = new ArrayList<>();

        DefaultDicts[] values = DefaultDicts.values();
        for (DefaultDicts value : values) {
            TranslationDict translationDict = new TranslationDict();
            translationDict.setTranCode(value.getTranCode());
            translationDict.setTranslationLanguages(value.getTranslationLanguages());
            translationDict.setTranValue(value.getTranValue());
            translationDicts.add(translationDict);
        }

        TranslationContext.init(translationDicts);
        log.info("初始化所有的翻译字典" + translationDicts.size() + "条！");
    }
}
