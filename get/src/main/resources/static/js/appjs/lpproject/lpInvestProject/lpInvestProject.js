var prefix = "/manager/lpproject/lpInvestProject"
$(function () {
    load();
});

function load() {
    $('#exampleTable')
        .bootstrapTable(
            {
                method: 'get', // 服务器数据的请求方式 get or post
                url: prefix + "/list", // 服务器数据的加载地址
                showRefresh: true,
                //	showToggle : true,
                //	showColumns : true,
                iconSize: 'outline',
                toolbar: '#exampleToolbar',
                striped: true, // 设置为true会有隔行变色效果
                dataType: "json", // 服务器返回的数据类型
                pagination: true, // 设置为true会在底部显示分页条
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
                pagination: true, // 设置为true会在底部显示分页条
                showJumpto: "true", //设置是否显示跳转页面功能

                queryParams: function (params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset: params.offset,
                        delFlag: '0', // 默认展示删除标记为0的数据
                        currencyNickname: params.currencyNickname,
                        projectName: $('#projectName').val(),
                        currencyType: $('#currencyType').val(),
                        releaseDay: $('#releaseDay').val(),
                        smallCurrency: $('#smallCurrency').val(),
                        releaseStatus: $('#releaseStatus').val(),
                        sellCount: $('#sellCount').val(),
                        currencyTotal: $('#currencyTotal').val(),
                        startDate: $('#startDate').val(),
                        updateDate: $('#updateDate').val(),
                        endDate: $('#endDate').val(),
                        createDate: $('#createDate').val(),
                        isEnable: $('#isEnable').val(),
                        order: params.order,
                        sort: Lower(params.sort),
                        // username:$('#searchName').val()
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
                    {
                        title: '序号',
                        formatter: function (value, row, index) {
                            var pageSize = $('#exampleTable').bootstrapTable('getOptions').pageSize;
                            var pageNumber = $('#exampleTable').bootstrapTable('getOptions').pageNumber;
                            return pageSize * (pageNumber - 1) + index + 1;
                        }
                    },
                    {
                        field: 'projectName',
                        title: '项目名称'
                    },
                    {
                        field: 'currencyType',
                        title: '币种类型',
                        sortable: true,
                        order: 'asc'
                    },
                    {
                        field: 'releaseDay',
                        title: '释放周期(天)'

                    },{
                        field: 'incomeRate',
                        title: '收益率',
                        formatter: function (value, row, index) {
                            console.log(value)
                            return (value * 100)+"%";
                        }

                    },
                    {
                        field: 'smallCurrency',
                        title: '认筹的最小币额度'
                    },
                    {
                        field: 'releaseStatus',
                        title: '释放方式',
                        formatter: function (value, row, index) {
                            if (value == '0' || value == 0) {
                                return "按天释放";
                            } else {
                                return "统一释放";
                            }
                        }
                    },
                    {
                        field: 'sellCount',
                        title: '总出售量(份)'
                    },
                    {
                        field: 'currencyTotal',
                        title: '总冻结量(币)'
                    },
                    {
                        field: 'startDate',
                        title: '开始众筹时间',
                        formatter: function (value, row, index) {
                            if (value.toString().length > 11) {
                                return value.toString().slice(0, 11);
                            } else {
                                return value;
                            }
                        }
                    },
                    {
                        field: 'endDate',
                        title: '结束众筹时间',
                        formatter: function (value, row, index) {
                            if (value.toString().length > 11) {
                                return value.toString().slice(0, 11);
                            } else {
                                return value;
                            }
                        }
                    },
                    {
                        field: 'startReleaseDate',
                        title: '开始释放时间',
                        formatter: function (value, row, index) {
                            if (value.toString().length > 11) {
                                return value.toString().slice(0, 11);
                            } else {
                                return value;
                            }
                        }
                    },
                    {
                        field: 'createDate',
                        title: '创建时间',
                        sortable: true,
                        order: 'asc'

                    },
                    {
                        field: 'projectStatus',
                        title: '状态',
                        formatter: function (value, row, index) {
                            return dataType(row)
                        }
                    },
                    {
                        field: 'isEnable',
                        title: '是否启用',
                        formatter: function (value, row, index) {
                            if (value == '0' || value == 0) {
                                return "<div class='isEnable-u'>启用</div>";
                            } else if (value == '1' || value == 1) {
                                return "<div class='isEnable-f'>禁用</div>";
                            }else{
                                return "<div class='isEnable-f'>启用但客户页不展示</div>";
                            }
                        }
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
                            return "<div style='width: 120px'>" + e + d + "</div>";
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

function dataType(row) {
    var myDate = new Date().getTime()
    var start = new Date(row.startDate).getTime()
    var end = new Date(row.endDate).getTime() + 86400000;
    // console.log(new Date(row.endDate) ,end,'5555555555555555555555555555555')
    if (myDate < start) {
        return "<div style='width: 120px;color: #FAA88F'><span ><i class='round-wait'></i>等待众筹</span></div>";
    } else if ((start < myDate) && (myDate < end)) {
        return "<div style='width: 120px;color: #ECA617'><span ><i class='round-start'></i>众筹中</span></div>";
    } else if (myDate > end) {
        return "<div style='width: 120px;color: #CBC9C9'><span ><i class='round-end'></i>众筹结束</span></div>";
    }
}
