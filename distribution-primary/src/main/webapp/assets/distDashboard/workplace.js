layui.use(['layer', 'admin', 'ax','laytpl','func','notice'], function () {
    let $ = layui.jquery;
    let admin = layui.admin;
    let layer = layui.layer;
    let $ax = layui.ax;
    let laytpl = layui.laytpl;
    let func = layui.func;
    let notice = layui.notice;
    let socket = null;
    let events = null;
    // 把头像传到图床上，模拟真实用户
    let headImgArray = [
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

    profitEventSocket();
    numsAll();
    memberTop();

    // 获取顶部总览的相关数字数据
    function numsAll() {
        let $animate = $('.animate');
        $animate.data('num', '');
        new $ax(Feng.ctxPath + "/distDashboard/workplace/summaryNums", function (data) {
            if (data.code !== 200) {
                console.log(data);
                layer.msg("获取数据失败~");
                return;
            }
            let numData = data.data;
            $("#memberTiny").html(numData.member.tiny);
            $("#memberLarge").html(numData.member.large);
            $("#tradeTiny").html(numData.trade.tiny);
            $("#tradeLarge").html(numData.trade.large);
            $("#orderTiny").html(numData.order.tiny);
            $("#orderLarge").html(numData.order.large);
            $("#profitTiny").html(numData.profit.tiny);
            $("#profitLarge").html(numData.profit.large);
            // 如果值为0，会抛出not a number错误，没啥影响。
            admin.util.animateNum($animate, true, 0);
        }, function (data) {
            console.log(data);
            Feng.error("获取数据失败!" + data.message + "!");
        }).start();
    }


    // 获取邀请top10的会员
    function memberTop() {
        $('#topViewDiv').css("display", "none");
        new $ax(Feng.ctxPath + "/distDashboard/workplace/memberTop?top=10", function (data) {
            if (data.code !== 200) {
                console.log(data);
                layer.msg("获取数据失败~");
                return;
            }
            let copyArray = [];
            layui.each(data.data, function (i, item) {
                // 段位勋章
                if (item.memberRank === 'BRONZE') {
                    item['badge'] = 'badge-bronze';
                } else if (item.memberRank === 'SILVER') {
                    item['badge'] = 'badge-silver';
                } else if (item.memberRank === 'GOLD') {
                    item['badge'] = 'badge-gold';
                } else if (item.memberRank === 'PLATINUM') {
                    item['badge'] = 'badge-platinum';
                } else if (item.memberRank === 'DIAMOND') {
                    item['badge'] = 'badge-diamond';
                }
                // 头像
                if (!copyArray.length) {
                    Object.assign(copyArray, headImgArray)
                }
                if (!item.memberAvatar) {
                    let idx = Math.floor(Math.random() * copyArray.length);
                    item.memberAvatar = headImgArray[idx];
                    copyArray.splice(idx, 1);
                }
            })
            render(data.data, 'topTpl', 'topDiv');
            $('#topViewDiv').fadeIn(1000);
        }, function (data) {
            console.log(data);
            Feng.error("获取数据失败!" + data.message + "!");
        }).start();
    }

    // 分润动态socket
    function profitEventSocket() {
        //实现WebSocket对象，指定要连接的服务器地址与端口  建立连接,注意协议为ws
        let socketUrl = 'ws://'+ window.location.host + Feng.ctxPath + "/ws/pe";
        if (socket != null) {
            socket.close();
            socket = null;
        }
        socket = new WebSocket(socketUrl);
        //打开事件
        socket.onopen = function () {
            console.log("websocket已打开");
        };
        //获得消息事件
        socket.onmessage = function (msg) {
            console.log("websocket接受到了消息");
            let newEvent = undefined;
            if (events) {
                // 给后续的元素添加淡入的效果
                newEvent = JSON.parse(msg.data);
                newEvent['display'] = 'display: none';
                // 加入事件列表
                events.unshift(newEvent);
                // 大于8项，移除最后一项
                if (events.length > 8) {
                    events.pop();
                }
                notice.success({
                    title: '消息通知',
                    message: '你有新的分润动态!',
                    position: "bottomLeft",
                    timeout: 2000,
                    transitionIn: "bounceInUp",
                    transitionOut: 'flipOutX'
                });
            } else {
                // 第一次接受后端的消息
                events = JSON.parse(msg.data);
            }
            render(events, 'eventTpl', 'eventDiv');
            // 如果是后期推送来的，分润动态显示淡入特效，并更新总览数字，按需更新会员排名
            if (newEvent) {
                $('#' + newEvent.id).fadeIn(1000);
                numsAll();
                if (newEvent.profitType === 'INVITE') {
                    memberTop();
                }
            }
        };
        //关闭事件
        socket.onclose = function () {
            console.log("websocket已关闭");
            events = undefined;
        };
        //发生了错误事件
        socket.onerror = function () {
            console.log("websocket发生了错误");
        }
    }

    // 模板渲染
    function render(data, tplId, viewId) {
        // 渲染模板
        let tpl = document.getElementById(tplId).innerHTML
        let view = document.getElementById(viewId);
        laytpl(tpl).render(data, function (html) {
            view.innerHTML = html;
        });
    }

    // 设置查看详情的a标签
    $("#eventDiv").on("click", ".dpe-event", function () {
        // 事件id
        let eventId = this.getAttribute('class').split(" ")[1];
        func.open({
            title: '事件详情',
            content: Feng.ctxPath + '/distProfitEvent/eventRecords?id=' + eventId,
        });
    });

});