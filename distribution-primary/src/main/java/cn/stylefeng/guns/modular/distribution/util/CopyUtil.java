package cn.stylefeng.guns.modular.distribution.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 复制工具类
 *
 * @author Fu Fei
 * @date 2020/9/5
 */
public class CopyUtil {

    private CopyUtil() {
    }

    /**
     * 深度复制list对象,先序列化对象，再反序列化对象
     * 从一个类型到另一个类型，注意可能会强转失败
     *
     * @param src 需要复制的对象列表
     * @return 返回新的对象列表
     */
    @SuppressWarnings("unchecked")
    public static <T> List<T> deepCopy(List<T> src) {
        List<T> ret = new ArrayList<>();
        try (
                ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
                ObjectOutputStream out = new ObjectOutputStream(byteOut);
                ByteArrayInputStream byteIn = new ByteArrayInputStream(byteOut.toByteArray());
                ObjectInputStream in = new ObjectInputStream(byteIn)
        ) {
            out.writeObject(src);
            ret = (List<T>) in.readObject();
        } catch (IOException | ClassNotFoundException e) {
            // 静默处理
        }
        return ret;
    }


}
