package cn.stylefeng.guns.modular.distribution.profit;

/**
 * 分润的标记接口
 * 一般指的是某种分润模式下的主体参数
 *
 * @author Fu Fei
 * @date 2020/8/3
 */
public interface ProfitAccess {

    /**
     * 获得主体的名字，即触发分润的人员账号
     */
    String getSubjectName();

}
