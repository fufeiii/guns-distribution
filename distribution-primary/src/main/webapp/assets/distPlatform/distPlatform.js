layui.use(['table', 'admin', 'ax', 'func'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var func = layui.func;

    /**
     * 平台管理
     */
    var DistPlatform = {
        tableId: "distPlatformTable"
    };

    /**
     * 初始化表格的列
     */
    DistPlatform.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键id'},
            {field: 'sysId', hide: true, title: '系统账号id'},
            {field: 'platformUsername', title: '平台账号'},
            {field: 'platformNickname', title: '平台名称'},
            {field: 'webhook', title: 'webhook'},
            {field: 'createTime', title: '创建时间'},
            {field: 'updateTime', title: '更新时间'},
            {title: '状态', templet: function (d) {
                    var cls = d.state === 'ENABLE' ? 'text-success' : 'text-danger';
                    return "<span class=" + cls + ">" + d.stateMessage + "</span>";
            }},
            {field: 'memo', title: '备注'},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistPlatform.search = function () {
        var queryData = {};
        queryData['platformNickname'] = $("#condition").val();
        table.reload(DistPlatform.tableId, {
            where: queryData, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DistPlatform.openAddDlg = function () {
        func.open({
            title: '添加平台',
            content: Feng.ctxPath + '/distPlatform/add',
            tableId: DistPlatform.tableId
        });
    };

    /**
     * 点击编辑
     *
     * @param data 点击按钮时候的行数据
     */
    DistPlatform.openEditDlg = function (data) {
        func.open({
            title: '修改平台',
            content: Feng.ctxPath + '/distPlatform/edit?id=' + data.id,
            tableId: DistPlatform.tableId
        });
    };

    /**
     * 点击删除
     *
     * @param data 点击按钮时候的行数据
     */
    DistPlatform.onDeleteItem = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/distPlatform/delete", function (data) {
                if (data.code !== 200) {
                    Feng.error("操作失败！" + data.message);
                    return;
                }
                Feng.success("操作成功!");
                table.reload(DistPlatform.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id", data.id);
            ajax.set("sysId", data.sysId);
            ajax.start();
        };
        Feng.confirm("是否删除?", operation);
    };

    /**
     * 导出excel按钮
     */
    DistPlatform.exportExcel = function () {
        var checkRows = table.checkStatus(DistPlatform.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistPlatform.tableId,
        url: Feng.ctxPath + '/distPlatform/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistPlatform.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistPlatform.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistPlatform.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistPlatform.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistPlatform.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            DistPlatform.openEditDlg(data);
        } else if (layEvent === 'delete') {
            DistPlatform.onDeleteItem(data);
        }
    });
});
