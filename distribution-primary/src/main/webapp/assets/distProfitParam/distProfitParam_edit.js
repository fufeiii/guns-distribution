
layui.use(['form', 'formX','admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;


    //获取详情信息，填充表单
    var result = new $ax(Feng.ctxPath + "/distProfitParam/detail?id=" + Feng.getUrlParam("id")).start();
    form.val('distProfitParamForm', result.data);

    //表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/distProfitParam/editItem", function (data) {
            if (data.code !== 200) {
                Feng.error("更新失败！" + data.message);
                return;
            }
            Feng.success("更新成功！");
            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);
            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("更新失败！" + data.responseJSON.message)
        }).set(data.field).start();

        return false;
    });

});