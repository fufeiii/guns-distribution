layui.use(['table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;

    /**
     * 数据库信息表管理
     */
    var DatabaseInfo = {
        tableId: "databaseInfoTable"
    };

    /**
     * 初始化表格的列
     */
    DatabaseInfo.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'dbId', hide: true, title: '主键id'},
            {field: 'dbName', align: "center", sort: true, title: '数据库名称'},
            {field: 'jdbcDriver', align: "center", sort: true, title: '驱动类型', minWidth: 182},
            {field: 'userName', align: "center", sort: true, title: '账号'},
            {field: 'password', align: "center", sort: true, title: '密码'},
            {field: 'jdbcUrl', align: "center", sort: true, title: 'jdbc的url'},
            {field: 'remarks', align: "center", sort: true, title: '备注'},
            {field: 'createTime', align: "center", sort: true, title: '创建时间', minWidth: 160},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DatabaseInfo.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(DatabaseInfo.tableId, {
            where: queryData, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DatabaseInfo.openAddDlg = function () {
        window.location.href = Feng.ctxPath + '/databaseInfo/add';
    };

    /**
     * 导出excel按钮
     */
    DatabaseInfo.exportExcel = function () {
        var checkRows = table.checkStatus(DatabaseInfo.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 点击删除
     *
     * @param data 点击按钮时候的行数据
     */
    DatabaseInfo.onDeleteItem = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/databaseInfo/delete", function (data) {
                Feng.success("删除成功!");
                table.reload(DatabaseInfo.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("dbId", data.dbId);
            ajax.start();
        };
        Feng.confirm("是否删除?", operation);
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DatabaseInfo.tableId,
        url: Feng.ctxPath + '/databaseInfo/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DatabaseInfo.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DatabaseInfo.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DatabaseInfo.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DatabaseInfo.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DatabaseInfo.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            DatabaseInfo.openEditDlg(data);
        } else if (layEvent === 'delete') {
            DatabaseInfo.onDeleteItem(data);
        }
    });
});
