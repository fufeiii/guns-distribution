layui.use(['func', 'form', 'admin', 'layer'], function () {
    let $ = layui.$;
    let func = layui.func;
    let form = layui.form;
    let admin = layui.admin;
    let layer = layui.layer;
    let memberIndexUsername = '';

    if (isProd) {
        admin.open({content: "当前为正式环境，请关闭此页并联系管理员！！！"});
    }

    function isProdMessage() {
        if (isProd) {
            admin.open({content: "当前为正式环境，请关闭此页并联系管理员！！！"});
            return ;
        }
    }

    $('#tenantClear').click(function () {
        isProdMessage();
        admin.confirm('删除操作不可逆，是否确认删除？', function (index) {
            $.ajax({
                url: Feng.ctxPath + "/mock/tenantClear",
                type: 'POST',
                dataType: 'json',
                success:function(data){
                    if (data.code !== 200) {
                        Feng.error("操作失败！" + data.message);
                        return;
                    }
                    Feng.success("操作成功！");
                    layer.close(index);
                }, error: function (data) {
                    Feng.error("操作失败！" + data.message)
                    layer.close(index);
                }
            });
        });

    })

    $("#memberAdd").click(function () {
        isProdMessage();
        func.open({
            title: '添加会员',
            content: Feng.ctxPath + '/mock/memberAdd',
        });
    });
    form.on('submit(btnDistMemberForm)', function (data) {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/member/add",
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data.field),
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("添加失败！" + data.message);
                    return;
                }
                Feng.success("添加成功！");
                //关掉对话框
                admin.closeThisDialog();
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });

        return false;
    });


    $("#profitTrade").click(function () {
        isProdMessage();
        func.open({
            title: '交易分润',
            content: Feng.ctxPath + '/mock/profitTrade',
        });
    });
    form.on('submit(btnProfitTradeForm)', function (data) {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/profit/trade",
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data.field),
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("添加失败！" + data.message);
                    return;
                }
                Feng.success("添加成功！");
                //关掉对话框
                admin.closeThisDialog();
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });

        return false;
    });


    $("#withdrawalRequest").click(function () {
        isProdMessage();
        func.open({
            title: '提现申请',
            content: Feng.ctxPath + '/mock/withdrawalRequest',
        });
    });
    form.on('submit(btnWithdrawalRequestForm)', function (data) {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/withdraw/initiate",
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data.field),
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("添加失败！" + data.message);
                    return;
                }
                Feng.success("添加成功！");
                //关掉对话框
                admin.closeThisDialog();
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });

        return false;
    });


    $('#memberIndex').click(function () {
        isProdMessage();
        func.open({
            title: '用户首页数据',
            height: '800px',
            content: Feng.ctxPath + '/mock/memberIndex',
        });
    });
    $('#memberIndexGet').click(function () {
        parent.layui.admin.prompt({
            title: '请输入用户的memberUsername',
            formType: 0
        }, function (value, index, elem) {
            memberIndexUsername = value;
            $.ajax({
                url: Feng.ctxPath + "/mock/forward/member/index?memberUsername=" + value,
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json',
                success:function(data){
                    if (data.code !== 200) {
                        Feng.error("操作失败!" + data.message + "!");
                        return;
                    }
                    form.val("distMemberIndexForm", data.data.member);
                    form.val("distMemberIndexForm", data.data.today);
                    form.val("distMemberIndexForm", data.data.withdraw);
                    form.val("distMemberIndexForm", data.data.summary);
                    Feng.success("操作成功!");
                }, error: function (data) {
                    Feng.error("添加失败！" + data.message)
                }
            });
            parent.layer.close(index);
        });
    });


    $('#allProfitMoneyBtn').click(function () {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/profit/record/list?memberUsername=" + memberIndexUsername + '&page=' + 1 + '&limit=' + 10,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("操作失败!" + data.message + "!");
                    return;
                }
                console.log('分销佣金接口返回结果如下： ↓ ↓ ↓');
                console.log(data);
                Feng.success("接口返回的数据已打印到控制台了！");
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });
    });
    $('#allTradeMoneyBtn').click(function () {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/profit/trade/list?memberUsername=" + memberIndexUsername + '&page=' + 1 + '&limit=' + 10,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("操作失败!" + data.message + "!");
                    return;
                }
                console.log('分销订单接口返回结果如下： ↓ ↓ ↓');
                console.log(data);
                Feng.success("接口返回的数据已打印到控制台了！");
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });
    });
    $('#allAvailableWithdrawBtn').click(function () {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/withdraw/list?memberUsername=" + memberIndexUsername + '&page=' + 1 + '&limit=' + 10,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("操作失败!" + data.message + "!");
                    return;
                }
                console.log('提现明细接口返回结果如下： ↓ ↓ ↓');
                console.log(data);
                Feng.success("接口返回的数据已打印到控制台了！");
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });
    });
    $('#allTeamCountBtn').click(function () {
        $.ajax({
            url: Feng.ctxPath + "/mock/forward/member/team?memberUsername=" + memberIndexUsername + '&page=' + 1 + '&limit=' + 10,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success:function(data){
                if (data.code !== 200) {
                    Feng.error("操作失败!" + data.message + "!");
                    return;
                }
                console.log('我的团队接口返回结果如下： ↓ ↓ ↓');
                console.log(data);
                Feng.success("接口返回的数据已打印到控制台了！");
            }, error: function (data) {
                Feng.error("添加失败！" + data.message)
            }
        });
    });


});