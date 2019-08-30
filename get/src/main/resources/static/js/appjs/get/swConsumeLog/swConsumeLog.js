var prefix = "/manager/get/swConsumeLog"
var coinData = [];
$(function () {
    $.ajax({
        url:"/manager/get/swCoinType/getAll",
        type:'GET',
        data:{},
        async:false,
        success:function (res) {
            coinData = res;
        }
    });
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
                paginationDetailHAlign:'left',
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect: false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize: 20,pageList: [ 20, 40, 60, 80, 100], // 如果设置了分页，每页数据条数
                pageNumber: 1, // 如果设置了分布，首页页码
                search: false, // 是否显示搜索框
                showColumns: true, // 是否显示内容下拉框（选择显示的列）
                sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                showJumpto:"true", //设置是否显示跳转页面功能
                queryParams: function (params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset: params.offset,
                        userId: $('#userId').val(),
                        tid: $('#tid').val(),
                        payUser: $('#payUser').val(),
                        receiveUser: $('#receiveUser').val(),
                        ex4: $('#ex4').val(),
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
                                            /*{
                            field: 'tid',
                            title: '主键',
                                                    },*/
                        {
                            title: '序号',
                            formatter: function (value, row, index) {
                                var pageSize = $('#exampleTable').bootstrapTable('getOptions').pageSize;
                                var pageNumber = $('#exampleTable').bootstrapTable('getOptions').pageNumber;
                                return pageSize * (pageNumber - 1) + index + 1;
                            }
                        },
                        {
                            field: 'coinTypeId',
                            title: '消费币种',
                            formatter: function (value) {
                                var arr = coinData.filter(function (item) {
                                    return item.tid == value
                                });
                                return arr[0].coinName;
                            }
                        },
                        {
                            field: 'consumeAmount',
                            title: '消费金额(GC)',
                        },
                        {
                            field: 'ex2',
                            title: '消费币种',
                            formatter: function (value) {
                                var arr = coinData.filter(function (item) {
                                    return item.tid == value
                                });
                                return arr[0].coinName;
                            }
                        },
                        {
                            field: 'ex3',
                            title: '消费金额(GCP)',
                        },
                                            {
                            field: 'destoryed',
                            title: '销毁金额',
                                                    },
                                            {
                            field: 'payUser',
                            title: '支付人id',
                                                    },
                                            {
                            field: 'receiveUser',
                            title: '收款人id',
                                                    },
                                            {
                            field: 'lastConsume',
                            title: '记录上次兑换/挂卖商家收到GC/GCP消费',
                                                    },
                                            {
                            field: 'score',
                            title: '评分',
                                                    },
                                            /*{
                            field: 'ex1',
                            title: 'ex1',
                                                    },*/
                                            {
                            field: 'remark',
                            title: '消费点评',
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
                                            /*{
                            field: 'delFlag',
                            title: '删除标识',
                                                    },*/
                                            {
                            field: 'ex4',
                            title: '状态',
                            formatter: function (value) {
                                var str={0:"未处理",1:"交易成功",2:"交易失败"}
                                if (str[value]) return str[value]
                            }
                                                    }
                                            /*{
                            field: 'ex5',
                            title: 'ex5',
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
                    }*/
                    ]
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