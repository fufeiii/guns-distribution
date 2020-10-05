layui.use(['table', 'admin', 'ax', 'func', 'layer','laytpl', 'element'], function () {
    let $ = layui.$;
    let table = layui.table;
    let $ax = layui.ax;
    let admin = layui.admin;
    let func = layui.func;
    let form = layui.form;
    let layer = layui.layer;
    let laytpl = layui.laytpl;
    // 图床上的头像，模拟真实用户
    const headImgArray = [
        'http://i.loli.net/2020/09/06/8LEKZHr76YoNa35.jpg',
        'http://i.loli.net/2020/09/06/BILg54hcM3twpy8.jpg',
        'http://i.loli.net/2020/09/19/bZ48rMSepctujOk.jpg',
        'http://i.loli.net/2020/09/06/dKLb1MXqZ95F8in.jpg',
        'http://i.loli.net/2020/09/06/sStzTg7VQIXAHmM.jpg',
        'http://i.loli.net/2020/09/06/fok8UVrzILC1WAT.jpg',
        'http://i.loli.net/2020/09/06/uTfjGZdsIeEA63D.jpg',
        'http://i.loli.net/2020/09/06/HKqDwCMrcjVxf6i.jpg',
        'http://i.loli.net/2020/09/06/fc1ijrhSTU9XEVZ.jpg',
        'http://i.loli.net/2020/09/06/B13MpNnSrkicsVG.jpg',
        'http://i.loli.net/2020/09/06/VnTNALlzgkwZ5Oo.jpg',
        'http://i.loli.net/2020/09/06/CEJhog7KFUx5buP.jpg',
        'http://i.loli.net/2020/09/06/GFaYoiLRDPHtyQ9.jpg',
        'http://i.loli.net/2020/09/06/DLRtx7FYjAMgdZ2.jpg',
        'http://i.loli.net/2020/09/06/fzRbgZGiUn7StcW.jpg',
        'http://i.loli.net/2020/09/06/PFq6kNpmSXfoMEy.jpg',
        'http://i.loli.net/2020/09/06/aTxBHgWVqcouX8h.jpg',
        'http://i.loli.net/2020/09/06/8O5reGbujBl1dTC.jpg'
    ];

    /**
     * 会员管理
     */
    let DistMember = {
        tableId: "distMemberTable"
    };

    /**
     * 初始化表格的列
     */
    DistMember.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '主键id'},
            {title: '会员头像', templet: function (d) {
                    return '<img data-index="' + (d.LAY_INDEX - 1) + '" src="' + d.memberAvatar + '" class="tb-img-circle" tb-img alt=""/>';
                }, align: 'center', width: 90, unresize: true
            },
            {field: 'memberNickname', title: '用户昵称'},
            {field: 'memberUsername', title: '用户账号'},
            {field: 'firParent', title: '直属父级'},
            {field: 'secParent', title: '二级父级'},
            {field: 'thrParent', title: '三级父级'},
            {field: 'memberTypeMessage', title: '用户身份'},
            {field: 'memberRankMessage', title: '用户段位'},
            {title: '状态', templet: function (d) {
                let cls = d.state === 'ENABLE' ? 'text-success' : 'text-danger';
                return "<span class=" + cls + ">" + d.stateMessage + "</span>";
            }},
            {field: 'memo', title: '备注'},
            {field: 'createTime', title: '创建时间', width: '12%'},
            {align: 'center', toolbar: '#tableBar', title: '操作', width: '15%'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DistMember.search = function (data) {
        table.reload(DistMember.tableId, {
            where: data.field, page: {curr: 1}
        });
    };

    /**
     * 弹出添加对话框
     */
    DistMember.openAddDlg = function () {
        func.open({
            title: '添加会员',
            content: Feng.ctxPath + '/distMember/add',
            tableId: DistMember.tableId
        });
    };

    /**
    * 点击编辑
    *
    * @param data 点击按钮时候的行数据
    */
    DistMember.openEditDlg = function (data) {
        func.open({
            title: '修改会员',
            content: Feng.ctxPath + '/distMember/edit?id=' + data.id,
            tableId: DistMember.tableId
        });
    };

    /**
     * 点击图片放大
     */
    $(document).off('click.tbImg').on('click.tbImg', '[tb-img]', function () {
        let imgList = table.cache['distMemberTable'].map(function (d) {
            return {
                alt: d.memberNickname,
                src: d.memberAvatar
            }
        });
        layer.photos({photos: {data: imgList, start: $(this).data('index')}, shade: .1, closeBtn: true});
    });

    /**
     * 会员账户
     */
    DistMember.openAccountDlg = function (row) {
        new $ax(Feng.ctxPath + "/distMember/account", function (data) {
            if (data.code !== 200) {
                Feng.error("操作失败!" + data.message + "!");
                return;
            }
            admin.open({
                type: 1,
                title: row.memberUsername +" 的账户信息",
                area: '700px',
                content: $('#account').html(),
                success: function () {
                    form.val("account", data.data);
                }
            });
        }, function (data) {
            console.log(data)
            Feng.error("操作失败!" + data.message + "!");
        }).set("memberId", row.id).start();
    };

    /**
     * 会员下级
     */
    DistMember.openTreeDlg = function (row) {
        new $ax(Feng.ctxPath + "/distMember/tree/getAll?parent="+row.memberUsername, function (data) {
            if (data.code !== 200) {
                Feng.error("操作失败!" + data.message + "!");
                return;
            }
            // 渲染模板
            let tpl = $('#treeTab').html()
            let $view = $('#treeTabView');
            laytpl(tpl).render(data.data, function (html) {
                $view.html(html);
            });
            admin.open({
                type: 1,
                title: row.memberUsername +" 的下级",
                area: '700px',
                content: $view.html()
            });
        }, function (data) {
            console.log(data)
            Feng.error("操作失败!" + data.message + "!");
        }).start();

    };


    /**
     * 导出excel按钮
     */
    DistMember.exportExcel = function () {
        let checkRows = table.checkStatus(DistMember.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };


    // 渲染表格
    let tableResult = table.render({
        elem: '#' + DistMember.tableId,
        url: Feng.ctxPath + '/distMember/list',
        // 模拟头像，真实环境请可以去除这里的parseData配置
        parseData: function(res){ //res 即为原始返回的数据
            let copyArray = [];
            layui.each(res.data, function (i, item) {
                if (!copyArray.length) {
                    Object.assign(copyArray, headImgArray)
                }
                let idx = Math.floor(Math.random() * copyArray.length);
                if (!item.memberAvatar) {
                    item.memberAvatar = copyArray[idx];
                    copyArray.splice(idx, 1);
                }
            });
            return {
                "code": res.code, //解析接口状态
                "msg": res.msg, //解析提示文本
                "count": res.count, //解析数据长度
                "data": res.data //解析数据列表
            };
        },
        page: true,
        height: "full-158",
        cellMinWidth: 100,
        cols: DistMember.initColumn()
    });


    // 表格搜索
    form.on('submit(tbSearch)', function (data) {
        DistMember.search(data);
        return false;
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DistMember.openAddDlg();
    });

    // 导出excel
    $('#btnExp').click(function () {
        DistMember.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + DistMember.tableId + ')', function (obj) {
        let data = obj.data;
        let layEvent = obj.event;

        if (layEvent === 'edit') {
            DistMember.openEditDlg(data);
        } else if (layEvent === 'account') {
            DistMember.openAccountDlg(data);
        } else if (layEvent === 'tree') {
            DistMember.openTreeDlg(data);
        }
    });

});
