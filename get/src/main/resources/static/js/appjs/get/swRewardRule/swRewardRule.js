var prefix = "/manager/get/swRewardRule"
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
                        userId: $('#userId').val(),
                        tid: $('#tid').val(),
                        parentWalletId: $('#parentWalletId').val(),
                        accountId: $('#accountId').val(),
                        currency: $('#currency').val(),
                        isProfit: $('#isProfit').val(),
                        isBigWallet: $('#isBigWallet').val(),
                        isActive: $('#isActive').val(),
                        createStartDate: $('#createStartDate').val(),
                        createEndDate: $('#createEndDate').val(),
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
                        title: '序号',
                        formatter: function (value, row, index) {
                            var pageSize = $('#exampleTable').bootstrapTable('getOptions').pageSize;
                            var pageNumber = $('#exampleTable').bootstrapTable('getOptions').pageNumber;
                            return pageSize * (pageNumber - 1) + index + 1;
                        }
                    },
                    {
                        field: 'code',
                        title: '编码',
                    },
                    {
                        field: 'name',
                        title: '规则名称',
                    },
                    {
                        field: 'status',
                        title: '状态',
                        formatter: function (value, row, index) {
                            console.log(value == 0);
                            console.log(value == '0');
                            if (value == 0) {
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

                        }
                    },
                    {
                        field: 'type',
                        title: '计量方式',
                        formatter: function (value) {
                            var str={1:"比例",2:"数值"};
                            if (str[value]) return str[value]

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
                        field: 'updateDate',
                        title: '更新时间',
                    },
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                + row.tid
                                + '\')"><i class="fa fa-edit"></i></a> ';
                            var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\''
                                + row.tid
                                + '\')"><i class="fa fa-remove"></i></a> ';
                            var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
                                + row.tid
                                + '\')"><i class="fa fa-key"></i></a> ';
                            return e + d;
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
            console.log(data.elem.attributes[2].value, 'ssssssssssssssssssssssssssss')
            var tid = data.elem.attributes[2].value;
            $.ajax({
                type: 'POST',
                data: {
                    "status": this.checked ? 0 : 1,
                    "tid": tid,
                },
                url: prefix + '/update',
                success: function (r) {
                    if (r.code === 200) {
                        // console.log('ssssssssssssssssssssssssssss')
                        layer.msg(r.msg);
                        // reLoad();
                    } else {
                        layer.msg(r.msg);
                        console.log('ggggggggggggggggggggggggggggggggggggggg')
                    }
                }
            });

        });

        form.render('checkbox');

    });
}