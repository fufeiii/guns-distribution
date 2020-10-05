package cn.stylefeng.guns.modular.distribution.aop.vaildate;

/**
 * 验证组
 *
 * @author Fu Fei
 * @date 2020/8/5
 */
public final class ValidateGroup {

    private ValidateGroup() {
    }

    /**
     * 主键验证组
     */
    public interface PrimaryKey {
    }

    /**
     * 保存数据时的验证组
     */
    public interface Insert {
    }

    /**
     * 保存数据时的验证组
     */
    public interface Update {
    }

    /**
     * 特殊的校验组
     * 一般使用在一些无规律或者单个的字段上
     */
    public interface Special {
    }


}
