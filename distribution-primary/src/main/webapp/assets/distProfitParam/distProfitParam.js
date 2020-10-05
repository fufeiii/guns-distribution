layui.use(['table', 'admin', 'ax', 'func'], function () {
    let $ = layui.$;
    let table = layui.table;
    let $ax = layui.ax;
    let func = layui.func;
    let form = layui.form;

    /**
     * 分润参数管理
     */
    let DistProfitParam = {
        tableId: "distProfitParamTable"
    };

    /**
     * 初始化表格的列
     */
    DistProfitParam.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键'},
            {field: 'accountTypeMessage', title: '账户类型'},
            {field: 'profitTypeMessage', title: '分润类型'},
            {field: 'calculateModeMessage', title: '计算方式'},
            {field: 'profitLevelMessage', title: '分润等级'},
            {field: 'profitRatio', title: '分润比例'},
            {field: 'memberTypeMessage', title: '用户类型'},
            {field: 'memberRankMessage', title: '用户段位'},
            {title: '状态', width:'8%', templet: function (d) {
                let cls = d.state === 'ENABLE' ? 'text-success' : 'text-danger';
                return "<span class=" + cls + ">" + d.stateMessage + "</span>";
            }},
            {field: 'createTime', title: '创建时间', width:'12%'},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistProfitParam.search = function (data) {
        table.reload(DistProfitParam.tableId, {
            where: data.field, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DistProfitParam.openAddDlg = function () {
        func.open({
            title: '添加分润参数',
            height: 600,
            content: Feng.ctxPath + '/distProfitParam/add',
            tableId: DistProfitParam.tableId
        });
    };

    /**
     * 点击编辑
     *
     * @param data 点击按钮时候的行数据
     */
    DistProfitParam.openEditDlg = function (data) {
        func.open({
            title: '修改分润参数',
            height: 600,
            content: Feng.ctxPath + '/distProfitParam/edit?id=' + data.id,
            tableId: DistProfitParam.tableId
        });
    };

    /**
     * 导出excel按钮
     */
    DistProfitParam.exportExcel = function () {
        let checkRows = table.checkStatus(DistProfitParam.tableId);
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
    DistProfitParam.onDeleteItem = function (data) {
        let operation = function () {
            let ajax = new $ax(Feng.ctxPath + "/distProfitParam/delete", function (data) {
                if (data.code !== 200) {
                    Feng.error("删除失败!" + data.message + "!");
                    return;
                }
                Feng.success("删除成功!");
                table.reload(DistProfitParam.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除?", operation);
    };

    // 渲染表格
    let tableResult = table.render({
        elem: '#' + DistProfitParam.tableId,
        url: Feng.ctxPath + '/distProfitParam/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistProfitParam.initColumn()
    });

    // 搜索
    form.on('submit(tbSearch)', function (data) {
        DistProfitParam.search(data);
        return false;
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistProfitParam.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistProfitParam.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistProfitParam.tableId + ')', function (obj) {
        let data = obj.data;
        let layEvent = obj.event;

        if (layEvent === 'edit') {
            DistProfitParam.openEditDlg(data);
        } else if (layEvent === 'delete') {
            DistProfitParam.onDeleteItem(data);
        }
    });
});
