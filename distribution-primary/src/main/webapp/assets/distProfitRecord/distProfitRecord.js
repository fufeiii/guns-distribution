layui.use(['table', 'admin', 'ax', 'form'], function () {
    var $ = layui.$;
    var table = layui.table;
    var form = layui.form;

    /**
     * 分润记录管理
     */
    var DistProfitRecord = {
        tableId: "distProfitRecordTable"
    };

    /**
     * 初始化表格的列
     */
    DistProfitRecord.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键'},
            {field: 'eventId', hide: true, title: '事件主键'},
            {field: 'eventNumber', width: '13%', title: '事件编号'},
            {title: '事件金额', templet: function (d) {
                return d.profitType === 'TRADE' ? d.eventPrice : '0.00';
            }},
            {field: 'profitTypeMessage', title: '分润类型'},
            {field: 'accountTypeMessage', title: '获利类型'},
            {field: 'triggerMemberUsername', title: '触发人'},
            {field: 'impactMemberUsername', title: '获利人'},
            {field: 'incomeAmount', title: '获利数'},
            {field: 'createTime', title: '创建时间'},
            {field: 'memo', title: '备注'},
        ]];
    };

    // 搜索
    form.on('submit(tbSearch)', function (data) {
        DistProfitRecord.search(data);
        return false;
    });

    /**
     * 点击查询按钮
     */
    DistProfitRecord.search = function (data) {
        table.reload(DistProfitRecord.tableId, {
            where: data.field, page: {curr: 1}
        });
    };


    /**
     * 导出excel按钮
     */
    DistProfitRecord.exportExcel = function () {
        var checkRows = table.checkStatus(DistProfitRecord.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistProfitRecord.tableId,
        url: Feng.ctxPath + '/distProfitRecord/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistProfitRecord.initColumn()
    });


    // 导出excel
    $('#btnExp').click(function () {
        DistProfitRecord.exportExcel();
    });

});
