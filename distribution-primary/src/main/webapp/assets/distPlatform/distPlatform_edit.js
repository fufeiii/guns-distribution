/**
 * 详情对话框
 */

layui.use(['form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;

    //获取详情信息，填充表单
    var ajax = new $ax(Feng.ctxPath + "/distPlatform/detail?id=" + Feng.getUrlParam("id"));
    var result = ajax.start();
    form.val('distPlatformForm', result.data);

    //表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/distPlatform/editItem", function (data) {
            if (data.code !== 200) {
                Feng.error("操作失败！" + data.message);
                return;
            }
            Feng.success("操作成功！");
            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);
            //关掉对话框
            admin.closeThisDialog();

        }, function (data) {
            Feng.error("操作失败！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();

        return false;
    });

});