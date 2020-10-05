layui.use(['ax'], function () {
    let $ = layui.$;
    let $ax = layui.ax;
    // 数据
    let seriesData;

    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('main'));

    myChart.on('click', function (params) {
        console.log(params)
        // 控制台打印数据的名称
        render()
    });

    function treeGet(parent) {
        let param = '';
        if (parent) {
            param = '?parent=' + parent;
        }
        // 初始化，加载第一个层级
        new $ax(Feng.ctxPath + '/distMember/tree/get' + param, function (data) {

        }, function (data) {

        }).start();
    }

    function convert(data) {
        let dataArr = [];
        layui.each(data, function (i, item) {
            let temp = {"name": undefined, "value": undefined, "children": undefined};
            temp.name = item.memberUsername;
            temp.value = item.memberNickname;
            dataArr.push(temp)
        });
        return dataArr;
    }


    function render() {
        myChart.setOption({
            tooltip: {
                trigger: 'item',
                triggerOn: 'mousemove'
            },
            series:[
                {
                    type: 'tree',

                    data: [seriesData],

                    left: '2%',
                    right: '2%',
                    top: '8%',
                    bottom: '20%',

                    symbol: 'emptyCircle',

                    orient: 'vertical',

                    expandAndCollapse: false,

                    label: {
                        normal: {
                            position: 'top',
                            rotate: -90,
                            verticalAlign: 'middle',
                            align: 'right',
                            fontSize: 9
                        }
                    },

                    leaves: {
                        label: {
                            normal: {
                                position: 'bottom',
                                rotate: -90,
                                verticalAlign: 'middle',
                                align: 'left'
                            }
                        }
                    },
                    animationDurationUpdate: 750
                }
            ]
        });
    }



});
