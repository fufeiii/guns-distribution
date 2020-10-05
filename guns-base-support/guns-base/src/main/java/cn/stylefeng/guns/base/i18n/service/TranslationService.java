package cn.stylefeng.guns.base.i18n.service;

import cn.stylefeng.guns.base.pojo.page.LayuiPageInfo;
import cn.stylefeng.guns.base.i18n.entity.Translation;
import cn.stylefeng.guns.base.i18n.model.params.TranslationParam;
import cn.stylefeng.guns.base.i18n.model.result.TranslationResult;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 多语言表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2019-10-17
 */
public interface TranslationService extends IService<Translation> {

    /**
     * 新增
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
    void add(TranslationParam param);

    /**
     * 删除
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
    void delete(TranslationParam param);

    /**
     * 更新
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
    void update(TranslationParam param);

    /**
     * 查询单条数据，Specification模式
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
    TranslationResult findBySpec(TranslationParam param);

    /**
     * 查询列表，Specification模式
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
    List<TranslationResult> findListBySpec(TranslationParam param);

    /**
     * 查询分页数据，Specification模式
     *
     * @author stylefeng
     * @Date 2019-10-17
     */
     LayuiPageInfo findPageBySpec(TranslationParam param);

}
