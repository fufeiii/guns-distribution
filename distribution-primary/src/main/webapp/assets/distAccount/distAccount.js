layui.use(['table', 'ax', 'func', 'dropdown'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var func = layui.func;
    var dropdown = layui.dropdown;

    /**
     * 会员账户管理
     */
    var DistAccount = {
        tableId: "distAccountTable"
    };

    /**
     * 初始化表格的列
     */
    DistAccount.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'memberId', hide: true, title: '会员表主键'},
            {field: 'memberUsername', title: '用户账号'},
            {field: 'memberNickname', title: '用户昵称'},
            {field: 'moneyTotal', title: '总金额'},
            {field: 'moneyAvailable', title: '可用金额'},
            {field: 'moneyFrozen', title: '冻结金额'},
            {field: 'integralTotalHistory', title: '历史总积分'},
            {field: 'integralTotal', title: '总积分'},
            {field: 'integralAvailable', title: '可用积分'},
            {field: 'integralFrozen', title: '冻结积分'},
            {title: '状态', templet: function (d) {
                var cls = d.state === 'ENABLE' ? 'text-success' : 'text-danger';
                return "<span class=" + cls + ">" + d.stateMessage + "</span>";
            }},
            {field: 'createTime', title: '创建时间', width: '12%'},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistAccount.search = function () {
        var queryData = {};
        queryData['memberUsername'] = $("#memberUsername").val();
        table.reload(DistAccount.tableId, {
            where: queryData, page: {curr: 1}
        });
    };


    /**
    * 点击编辑
    *
    * @param data 点击按钮时候的行数据
    */
    DistAccount.openEditDlg = function (data) {
        var text = data.state === 'ENABLE' ? '禁用' : '启用';
        var value = data.state === 'ENABLE' ? 'DISABLES' : 'ENABLE';
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/distAccount/editItem", function (data) {
                if (data.code !== 200) {
                    Feng.error(text + "失败!" + data.message + "!");
                    return;
                }
                Feng.success(text + "成功!");
                table.reload(DistAccount.tableId);
            }, function (data) {
                Feng.error(text + "失败!" + data.responseJSON.message + "!");
            });
            ajax.set("memberId", data.memberId).set("state", value);
            ajax.start();
        };
        Feng.confirm("是否"+text+" "+data.memberUsername+" 的账户?", operation);
    };

    /**
     * 点击查看变动清单
     * @param data
     */
    DistAccount.openChangeListDlg = function (data) {
        func.open({
            title: data.memberUsername + '的账户变动明细',
            content: Feng.ctxPath + "/distAccountRecord/?memberUsername=" + data.memberUsername,
        });
    };

    /**
     * 导出excel按钮
     */
    DistAccount.exportExcel = function () {
        var checkRows = table.checkStatus(DistAccount.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };


    // 渲染表格
    var tableResult = table.render({
        elem: '#' + DistAccount.tableId,
        url: Feng.ctxPath + '/distAccount/list',
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistAccount.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DistAccount.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistAccount.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistAccount.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistAccount.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === 'edit') {
            DistAccount.openEditDlg(data);
        } else if (layEvent === 'change') {
            DistAccount.openChangeListDlg(data);
        }
        dropdown.hideAll();
    });
});
