layui.use(['table', 'ax', 'admin', 'layer', 'func'], function () {
    var $ = layui.$;
    var table = layui.table;
    var admin = layui.admin;
    var layer = layui.layer;
    var $ax = layui.ax;
    var func = layui.func;

    /**
     * 提现申请记录管理
     */
    var DistWithdrawRecord = {
        tableId: "distWithdrawRecordTable"
    };

    /**
     * 初始化表格的列
     */
    DistWithdrawRecord.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键'},
            {field: 'memberUsername', title: '用户标识'},
            {field: 'withdrawNumber', title: '提现单号'},
            {field: 'withdrawAmount', title: '提现金额'},
            {field: 'feeAmount', title: '手续费'},
            {field: 'memo', title: '备注'},
            {title: '处理状态', width: '8%', templet: function (d) {
                    var cls;
                    if (d.disposeState === 'WAIT_AUDIT') {
                        cls = 'text-info';
                    } else if (d.disposeState === 'WAIT_REMIT') {
                        cls = 'text-warning';
                    } else if (d.disposeState === 'DONE_REMIT') {
                        cls = 'text-success';
                    } else {
                        cls = 'text-danger';
                    }
                    return "<span class=" + cls + ">" + d.disposeStateMessage + "</span>";
                }
            },
            {field: 'createTime', title: '创建时间'},
            {field: 'handleTime', title: '处理时间'},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistWithdrawRecord.search = function () {
        var queryData = {};
        queryData['memberUsername'] = $("#condition").val();
        queryData['disposeState'] = $("#disposeState").val();
        table.reload(DistWithdrawRecord.tableId, {
            where: queryData, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DistWithdrawRecord.openAddDlg = function () {
        func.open({
            title: '添加提现申请记录',
            content: Feng.ctxPath + '/distWithdrawRecord/add',
            tableId: DistWithdrawRecord.tableId
        });
    };

    /**
     * 点击编辑
     *
     * @param data 点击按钮时候的行数据
     * @param layEvent 触发事件
     */
    DistWithdrawRecord.openEditDlg = function (data, layEvent) {
        let text = layEvent === 'WAIT_REMIT' ? "通过" : "拒绝" ;

        let id = data.id;
        let memo = '通过';
        let operation = function () {
            if (text === '拒绝') {
                parent.layui.admin.prompt({
                    title: '请输入拒绝理由：',
                    formType: 2
                }, function (value, index, elem) {
                    if (!value.trim()) {
                        layer.msg("请输入内容！")
                    } else {
                        memo = value;
                        let ajax = new $ax(Feng.ctxPath + "/distWithdrawRecord/editItem", function (data) {
                            if (data.code !== 200) {
                                Feng.error("操作失败!" + data.message + "!");
                                return;
                            }
                            Feng.success("操作成功!");
                            table.reload(DistWithdrawRecord.tableId);
                        }, function (data) {
                            Feng.error("操作失败!" + data.responeJSON.message + "!");
                        });
                        ajax.set("id", data.id).set("disposeState", layEvent).set("memo", memo).start();
                        parent.layer.close(index);
                    }
                });
            } else {
                let ajax = new $ax(Feng.ctxPath + "/distWithdrawRecord/editItem", function (data) {
                    if (data.code !== 200) {
                        Feng.error("操作失败!" + data.message + "!");
                        return;
                    }
                    Feng.success("操作成功! 正在模拟调用资金模块或其他流程进行打款，20秒后查看打款结果~");
                    // Feng.success("操作成功!");
                    table.reload(DistWithdrawRecord.tableId);
                }, function (data) {
                    Feng.error("操作失败!" + data.responeJSON.message + "!");
                });
                ajax.set("id", data.id).set("disposeState", layEvent).set("memo", memo).start();
            }

            // 模拟在其他模块执行转账操作
            if (layEvent === 'WAIT_REMIT') {
                setTimeout(function () {
                    new $ax(Feng.ctxPath + "/distWithdrawRecord/doWithdrawDeposit?id="+id).start();
                }, 20000);
            }
        };

        Feng.confirm("是否"+text+"?", operation);
    };

    /**
     * 导出excel按钮
     */
    DistWithdrawRecord.exportExcel = function () {
        var checkRows = table.checkStatus(DistWithdrawRecord.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };


    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistWithdrawRecord.tableId,
        url: Feng.ctxPath + '/distWithdrawRecord/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistWithdrawRecord.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistWithdrawRecord.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistWithdrawRecord.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistWithdrawRecord.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistWithdrawRecord.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        DistWithdrawRecord.openEditDlg(data, layEvent);
    });

});
