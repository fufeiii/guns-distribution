package cn.stylefeng.guns.modular.distribution.util;


import java.util.function.Consumer;
import java.util.function.Supplier;

/**
 * 函数式接口工具类
 *
 * @author Fu Fei
 * @date 2020/7/22
 */
public class FunctionalUtil {

    private FunctionalUtil() {}

    public static <T> void consumerIf(boolean ex, T t, Consumer<T> consumer) {
        if (ex) {
            consumer.accept(t);
        }
    }

    public static <T> T supplierIf(boolean ex, T t, Supplier<T> supplier) {
        if (ex) {
            return supplier.get();
        } else {
            return t;
        }
    }



}
