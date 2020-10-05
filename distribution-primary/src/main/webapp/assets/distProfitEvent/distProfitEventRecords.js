layui.use(['table'], function () {
    var table = layui.table;

    /**
     * 分润参数管理
     */
    var distProfitEventRecords = {
        tableId: "distProfitEventRecordsTable"
    };

    /**
     * 初始化表格的列
     */
    distProfitEventRecords.initColumn = function () {
        return [[
            {field: 'id', hide: true, title: '主键'},
            {field: 'impactMemberUsername', title: '获利用户', },
            {field: 'createTime', title: '发生时间', width: '25%'},
            {field: 'accountTypeMessage', title: '账户类型'},
            {field: 'incomeAmount', title: '获利数'},
        ]];
    };
    // 渲染表格
    table.render({
        elem: '#' + distProfitEventRecords.tableId,
        url: Feng.ctxPath + '/distProfitEvent/records',
        where: {id: Feng.getUrlParam("id")},
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: distProfitEventRecords.initColumn()
    });

});
