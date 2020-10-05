package cn.stylefeng.guns.modular.distribution.service;

import cn.stylefeng.guns.modular.distribution.api.response.MemberIndex;
import cn.stylefeng.guns.modular.distribution.model.vo.DistMemberVO;
import cn.stylefeng.guns.modular.distribution.model.vo.SummaryNumsVO;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * 控制台服务
 *
 * @author Fu Fei
 * @date 2020/9/4
 */
public interface DistDashboardService {

    /**
     * web网页端 分销总览顶部的数字
     */
    SummaryNumsVO summaryNums() throws InterruptedException, ExecutionException;

    /**
     * web网页端 查询发展会员最多的会员
     *
     * @param top 查询个数
     */
    List<DistMemberVO> memberTop4Web(Integer top);

    /**
     * app端，会员首页的数据汇总
     */
    MemberIndex memberIndex4App(String memberUsername) throws InterruptedException, ExecutionException;

}
