var prefix = "/manager/system/gamesRecord"
$(function () {
    load();
});

function load() {
    $('#exampleTable')
        .bootstrapTable(
            {
                sortable: true,
                method: 'get', // 服务器数据的请求方式 get or post
                url: prefix + "/list", // 服务器数据的加载地址
                showRefresh: true,
                //	showToggle : true,
                showColumns: true,
                iconSize: 'outline',
                toolbar: '#exampleToolbar',
                striped: true, // 设置为true会有隔行变色效果
                dataType: "json", // 服务器返回的数据类型
                pagination: true, // 设置为true会在底部显示分页条
                paginationDetailHAlign: 'left',
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect: false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize: 20, pageList: [20, 40, 60, 80, 100], // 如果设置了分页，每页数据条数
                pageNumber: 1, // 如果设置了分布，首页页码
                search: false, // 是否显示搜索框
                showColumns: true, // 是否显示内容下拉框（选择显示的列）
                sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                showJumpto: "true", //设置是否显示跳转页面功能
                queryParams: function (params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset: params.offset,
                        createStartDate: $('#createStartDate').val(),
                        createEndDate: $('#createEndDate').val(),
                        tid: $('#tid').val(),
                        userId: $('#userId').val(),
                        mobile: $('#mobile').val(),
                        isSuccess: $('#isSuccess').val(),
                        type: $('#type').val(),
                        order: params.order,
                        sort: Lower(params.sort),
                    };
                },
                onLoadSuccess: function () {  //加载成功时执行
                    switchButton()
                },
                onLoadError: function () {  //加载失败时执行
                    switchButton()
                },
                onPostBody: function () {  //加载失败时执行
                    switchButton()
                },
                // //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
                // queryParamsType = 'limit' ,返回参数必须包含
                // limit, offset, search, sort, order 否则, 需要包含:
                // pageSize, pageNumber, searchText, sortName,
                // sortOrder.
                // 返回false将会终止请求
                columns: [
                    {
                        checkbox: true
                    },
                    {
                        field: 'tid',
                        title: '流水号',
                    },
                    {
                        field: 'userId',
                        title: '用户ID',
                    },
                    {
                        field: 'mobile',
                        title: '电话',
                    },
                    {
                        field: 'targetUserId',
                        title: '转账到的用户ID',
                    },
                    {
                        field: 'currency',
                        title: '转账金额',
                    },
                    {
                        field: 'platformId',
                        title: '游戏平台ID',
                    },
                    {
                        field: 'gameId',
                        title: '游戏ID',
                    },
                    {
                        field: 'type',
                        title: '转账类型',
                        formatter: function (value, row, index) {
                            if (value == 'RY_CHARGE_FOR_GAME') {
                                return '瑞银转账到游戏';
                            } else if(value == 'GAME_CHARGE_FOR_GAME'){
                                return '游戏平台转账';
                            } else {
                                return '游戏平台提现';
                            }
                        }
                    },
                    {
                        field: 'remark',
                        title: '备注',
                    },
                    {
                        field: 'createDate',
                        title: '创建时间',
                        sortable: true,
                        order: 'asc',
                    },
                    {
                        field: 'isSuccess',
                        title: '是否打款到游戏',
                        formatter: function (value, row, index) {
                            if (value == '0') {
                                return '未打款';
                            } else {
                                return '已打款';
                            }
                        }
                    },
                    {
                        field: 'updateDate',
                        title: '更新时间',
                    },
                    {
                        title: '打款',
                        field: 'isSuccess',
                        align: 'center',
                        formatter: function (value, row, index) {
                            if(row.type == 'RY_CHARGE_FOR_GAME'){
                                if (value == 1) {
                                    var a = '<form class="layui-form">' +
                                        '<div class="layui-form-item">' +
                                        '<input type="checkbox" name="switch" tid = \'' + row.tid + '\'  checked = true lay-skin="switch" lay-filter="switchTest" lay-text=" &nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp  ">' +
                                        '</div>' +
                                        '</form>';
                                } else {
                                    var a = '<form class="layui-form">' +
                                        '<div class="layui-form-item">' +
                                        '<input type="checkbox" name="switch" tid = \'' + row.tid + '\' lay-skin="switch" lay-filter="switchTest" lay-text="&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp    ">' +
                                        '</div>' +
                                        '</form>';
                                }
                                return a
                            }else{
                                return '----'
                            }
                        }
                    }]
            });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}

function add() {
    layer.open({
        type: 2,
        title: '增加',
        maxmin: true,
        shadeClose: true, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/add' // iframe的url
    });
}

function edit(id) {
    layer.open({
        type: 2,
        title: '编辑',
        maxmin: true,
        shadeClose: true, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/edit/' + id // iframe的url
    });
}

function remove(id) {
    layer.confirm('确定要删除选中的记录？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: prefix + "/remove",
            type: "post",
            data: {
                'tid': id
            },
            success: function (r) {
                if (r.code == 200) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    })
}

function resetPwd(id) {
}

function batchRemove() {
    var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        layer.msg("请选择要删除的数据");
        return;
    }
    layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        var ids = new Array();
        // 遍历所有选择的行数据，取每条数据对应的ID
        $.each(rows, function (i, row) {
            ids[i] = row['tid'];
        });
        $.ajax({
            type: 'POST',
            data: {
                "ids": ids
            },
            url: prefix + '/batchRemove',
            success: function (r) {
                if (r.code == 200) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function () {

    });
}

function switchButton() {
    layui.use('form', function () {
        var form = layui.form;
        form.on('switch(switchTest)', function (data) {
            var tid = data.elem.attributes[2].value;
            var that= this;
            if (!this.checked) {
                layer.confirm('确定该操作？', {
                    btn: ['确定', '取消']
                }, function () {
                    $.ajax({
                        type: 'POST',
                        data: {
                            "tid": tid,
                        },
                        url: prefix + '/update',
                        success: function (r) {
                            if (r.code === 200) {
                                layer.msg(r.msg);
                                reLoad();
                            } else {
                                layer.msg(r.msg);
                            }
                        }
                    });
                }, function () {
                    that.checked = true;
                    form.render('checkbox')
                    return
                })
            } else {
                $.ajax({
                    type: 'POST',
                    data: {
                        "tid": tid,
                    },
                    url: prefix + '/update',
                    success: function (r) {
                        if (r.code === 200) {
                            layer.msg(r.msg);
                            reLoad();
                        } else {
                            layer.msg(r.msg);
                        }
                    }
                });
            }


        });

        form.render('checkbox');
    });
}

function reLoad3() {
    window.location.href = prefix + '/exportExcel';
}