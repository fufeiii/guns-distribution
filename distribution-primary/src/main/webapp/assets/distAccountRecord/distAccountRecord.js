layui.use(['table', 'admin', 'ax', 'func'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var func = layui.func;

    /**
     * 账户明细记录管理
     */
    var DistAccountRecord = {
        tableId: "distAccountRecordTable"
    };

    let memberUsername = Feng.getUrlParam("memberUsername");
    /**
     * 初始化表格的列
     */
    DistAccountRecord.initColumn = function () {
        return [[
            {type: 'checkbox', hide: !!memberUsername},
            {field: 'id', hide: true, title: '主键'},
            {field: 'createTime', width: '18%', title: '创建时间'},
            {field: 'memberUsername', title: '用户标识'},
            {field: 'accountTypeMessage', title: '账户类型'},
            {field: 'changeTypeMessage', title: '变动类型'},
            {field: 'beforeChangeTotal', title: '变动前总数'},
            {field: 'afterChangeTotal', title: '变动后总数'},
            {field: 'changeAmount', title: '变动数'},
            {field: 'memo', title: '备注'},
        ]];
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistAccountRecord.tableId,
        url: Feng.ctxPath + '/distAccountRecord/list',
        // 第一次会使用memberUsername参数,后续会直接从页面获取
        where: {memberUsername: memberUsername ? memberUsername : ''},
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistAccountRecord.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistAccountRecord.search();
    });

    /**
     * 点击查询按钮
     */
    DistAccountRecord.search = function () {
        var queryData = {};
        queryData['accountType'] = $("#accountType").val();
        queryData['changeType'] = $("#changeType").val();
        queryData['memberUsername'] = $("#memberUsername").val();
        table.reload(DistAccountRecord.tableId, {
            where: queryData, page: {curr: 1}
        });
    };

    // 导出excel
    $('#btnExp').click(function () {
        DistAccountRecord.exportExcel();
    });

    /**
     * 导出excel按钮
     */
    DistAccountRecord.exportExcel = function () {
        var checkRows = table.checkStatus(DistAccountRecord.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };
});
