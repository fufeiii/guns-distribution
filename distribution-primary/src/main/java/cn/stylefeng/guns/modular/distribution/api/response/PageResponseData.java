package cn.stylefeng.guns.modular.distribution.api.response;

import cn.stylefeng.roses.kernel.model.response.ResponseData;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Collection;

/**
 * api请求相关分页
 *
 * @author Fu Fei
 * @date 2020/9/22
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PageResponseData extends ResponseData implements Serializable {

    private static final long serialVersionUID = -4689738536215323109L;

    private long total;

    private PageResponseData() {
    }

    public static <T> PageResponseData page(long total, Collection<T> data) {
        PageResponseData pageResponseData = new PageResponseData();
        pageResponseData.setCode(DEFAULT_SUCCESS_CODE);
        pageResponseData.setMessage(DEFAULT_SUCCESS_MESSAGE);
        pageResponseData.setSuccess(true);
        pageResponseData.setTotal(total);
        pageResponseData.setData(data);
        return pageResponseData;
    }

}
