
layui.use(['form', 'formX', 'admin', 'ax'], function () {
    let $ = layui.jquery;
    let $ax = layui.ax;
    let form = layui.form;
    let admin = layui.admin;

    // 监听分润类型（邀请分润只能选择固定分润）
    form.on('select(profitType)', function(data){
        let isInv = data.value === 'INVITE';
        if (isInv) {
            form.val("distProfitParamForm", {

            });
        }
    });

    //表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        let calculateMode = data.field.calculateMode;
        let profitType = data.field.profitType;
        if (calculateMode === 'PERCENTAGE' && profitType !== 'TRADE') {
            Feng.error("计算模式 [百分比] 仅支持 分润类型为 [商品交易] 的场景");
            return false;
        }
        let ajax = new $ax(Feng.ctxPath + "/distProfitParam/addItem", function (data) {
            if (data.code !== 200) {
                Feng.error("添加失败！" + data.message);
                return false;
            }
            Feng.success("添加成功！");
            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);
            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("添加失败！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();

        return false;
    });

});