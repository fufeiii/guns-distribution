layui.use(['table', 'admin', 'ax', 'func'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var func = layui.func;

    /**
     * 段位配置管理
     */
    var DistRankParam = {
        tableId: "distRankParamTable"
    };

    /**
     * 初始化表格的列
     */
    DistRankParam.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键'},
            {field: 'memberRankMessage', title: '用户段位'},
            {field: 'beginIntegral', title: '开始积分'},
            {field: 'endIntegral', title: '结束积分'},
            {title: '状态', width:'8%', templet: function (d) {
                    var cls = d.state === 'ENABLE' ? 'text-success' : 'text-danger';
                    return "<span class=" + cls + ">" + d.stateMessage + "</span>";
            }},
            {field: 'createTime', title: '创建时间'},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistRankParam.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(DistRankParam.tableId, {
            where: queryData, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DistRankParam.openAddDlg = function () {
        func.open({
            title: '添加段位配置',
            content: Feng.ctxPath + '/distRankParam/add',
            tableId: DistRankParam.tableId
        });
    };

    /**
    * 点击编辑
    *
    * @param data 点击按钮时候的行数据
    */
    DistRankParam.openEditDlg = function (data) {
        func.open({
            title: '修改段位配置',
            content: Feng.ctxPath + '/distRankParam/edit?id=' + data.id,
            tableId: DistRankParam.tableId
        });
    };

    /**
     * 导出excel按钮
     */
    DistRankParam.exportExcel = function () {
        var checkRows = table.checkStatus(DistRankParam.tableId);
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
    DistRankParam.onDeleteItem = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/distRankParam/delete", function (data) {
                if (data.code !== 200) {
                    Feng.error("删除失败!" + data.message + "!");
                    return;
                }
                Feng.success("删除成功!");
                table.reload(DistRankParam.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responeJSON.message + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除?", operation);
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistRankParam.tableId,
        url: Feng.ctxPath + '/distRankParam/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistRankParam.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistRankParam.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistRankParam.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistRankParam.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistRankParam.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            DistRankParam.openEditDlg(data);
        } else if (layEvent === 'delete') {
            DistRankParam.onDeleteItem(data);
        }
    });
});
