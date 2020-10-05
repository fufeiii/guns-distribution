layui.use(['table', 'func'], function () {
    var $ = layui.$;
    var table = layui.table;
    var func = layui.func;

    /**
     * 分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。管理
     */
    var DistProfitEvent = {
        tableId: "distProfitEventTable"
    };

    /**
     * 初始化表格的列
     */
    DistProfitEvent.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键'},
            {field: 'createTime', title: '创建时间'},
            {field: 'profitTypeMessage', title: '分润类型'},
            {field: 'triggerMemberUsername', title: '事件触发人'},
            {field: 'eventNumber', title: '事件编号'},
            {title: '事件金额', templet: function (d) {
                if (d.profitType === 'TRADE') {
                    return d.eventPrice;
                } else {
                    return '0.00';
                }
            }},
            {field: 'memo', title: '描述'},
            {title: '操作', align: 'center', templet: function (d) {
                return '<a class="layui-btn layui-bg-green layui-btn-xs" lay-event="detail">详情</a>';
            }},
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistProfitEvent.search = function () {
        var queryData = {};
        queryData['eventNumber'] = $("#condition1").val();
        queryData['triggerMemberUsername'] = $("#condition2").val();
        queryData['profitType'] = $("#profitType").val();
        table.reload(DistProfitEvent.tableId, {
            where: queryData, page: {curr: 1}
        });
    };


    /**
     * 导出excel按钮
     */
    DistProfitEvent.exportExcel = function () {
        var checkRows = table.checkStatus(DistProfitEvent.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistProfitEvent.tableId,
        url: Feng.ctxPath + '/distProfitEvent/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistProfitEvent.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistProfitEvent.search();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistProfitEvent.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistProfitEvent.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === 'detail') {
            func.open({
                title: '事件详情',
                content: Feng.ctxPath + '/distProfitEvent/eventRecords?id=' + data.id,
                height: '700px',
                width:'50%'
            });
        }
    });

});
