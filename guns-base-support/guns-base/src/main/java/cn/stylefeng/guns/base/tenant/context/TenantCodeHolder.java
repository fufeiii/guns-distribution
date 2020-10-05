package cn.stylefeng.guns.base.tenant.context;

/**
 * 租户编码的临时存放
 *
 * @author fengshuonan
 * @date 2019-06-19-14:08
 */
public class TenantCodeHolder {

    private static ThreadLocal<String> threadLocal = new ThreadLocal<>();

    public static void put(String value) {
        threadLocal.set(value);
    }

    public static String get() {
        return threadLocal.get();
    }

    public static void remove() {
        threadLocal.remove();
    }
}
