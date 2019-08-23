var prefix = "/manager/record/userRecord"
$(function () {
    // var type = $('#type')
    // var option = '<option value=""  selected>转账类型</option>\n' +
    //     '                            <option value="in">交易转收益</option>\n' +
    //     '                            <option value="on">收益转交易</option>\n' +
    //     '                            <option value="BACK_OPERATION">后台操作</option>\n' +
    //     '                            <option value="BUY_PROJECT">后台购买项目</option>\n' +
    //     '                            <option value="RYH_TO_RYB">RYH兑换RYB(收益内部)</option>\n' +
    //     '                            <option value="RYB_TO_RYH">RYB兑换RYH(收益内部)</option>\n' +
    //     '                            <option value="TTR_RYH_TO_RYB">交易区RYH兑换收益区RYB</option>\n' +
    //     '                            <option value="TTR_RYB_TO_RYH">交易区RYB兑换收益区RYH</option>\n' +
    //     '                            <option value="TO_FRIEND">子钱包转账给朋友</option>\n' +
    //     '                            <option value="ME_TO_ME">子钱包转给自己某个钱包</option>';
    // type.html(option)
    $.ajax({
        url: "/api/app/billCoinTypeAndCapitalType",
        type: "post",
        success: function (r) {
            if (r.status == 200) {
                var type = $('#type')
                var option = '';
                var option2 = '';
                //遍历json对象的每个key/value对,p为key
                for(var key in r.data.capitalType){
                    if(key == 'ALL'){
                        option=option+"<option value=''>"+r.data.capitalType[key]+"</option>";
                    }else{
                        option=option+"<option value='"+key+"'>"+r.data.capitalType[key]+"</option>";
                    }
                }
                for(var key in r.data.coinType){
                    if(key == 'ALL'){
                        option2=option2+"<option value=''>"+r.data.coinType[key]+"</option>";
                    }else{
                        option2=option2+"<option value='"+key+"'>"+r.data.coinType[key]+"</option>";
                    }
                }
                console.log(option,"optionoptionoptionoption")
                console.log(option2 , "option2option2option2option2")
                type.html(option)
                $('#currencyNickname').html(option2)
            } else {
                layer.msg(r.msg);
            }
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
                showJumpto:"true", //设置是否显示跳转页面功能
                queryParams: function (params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset: params.offset,
                        srcUserId: params.search,
                        accountId:$('#accountId').val(),
                        type:$('#type').val(),
                        createStartDate: $('#createStartDate').val(),
                        createEndDate: $('#createEndDate').val(),
                        currencyNickname:$('#currencyNickname').val(),
                        targetUserId:$('#targetUserId').val(),
                        srcUserId:$('#srcUserId').val(),
                        order: params.order,
                        sort: Lower(params.sort),
                        // name:$('#searchName').val(),
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
                            var pageSize=$('#exampleTable').bootstrapTable('getOptions').pageSize;
                            var pageNumber=$('#exampleTable').bootstrapTable('getOptions').pageNumber;
                            return pageSize * (pageNumber - 1) + index + 1;
                        }
                    },
                    {
                        field: 'srcUserId',
                        title: '转账用户',
                        formatter: function(value, row, index) {
                            if(row.type == 'BACK_OPERATION' || row.type == 'BUY_PROJECT'){
                                return value;
                            }
                            return '<a  class="blue-color" onclick="getUserInfo(\'' + value + '\')">'+value+'</a>'
                        },
                        sortable: true,
                        order: 'asc'
                    },
                    {
                        field: 'targetUserId',
                        title: '收款用户',
                        formatter: function(value, row, index) {
                            return '<a class="blue-color" onclick="getUserInfo(\'' + value + '\')">'+value+'</a>'
                        },
                        sortable: true,
                        order: 'asc'
                    },
                    {
                        field: 'accountId',
                        title: '转账账号'
                    },
                    {
                        field: 'type',
                        title: '转账类型',
                        formatter: function (value, row, index) {
                            if(value == 'transfer'){
                                return "转账";
                            }else if (value == 'in') {
                                return "交易转收益";
                            } else if((value == 'out')){
                                return "收益转交易";
                            } else if((value == 'CNY_TO_RYB')){
                                return "CNY兑换RYB";
                            }else if((value == 'RYH_TO_RYB')){
                                return "RYH兑换RYB";
                            } else if((value == 'RYB_TO_RYH')){
                                return "RYB兑换RYH";
                            } else if ((value == 'TTR_RYH_TO_RYB')){
                                return "交易区RYH兑换收益区RYB";
                            } else if((value == 'TTR_RYB_TO_RYH')){
                                return "交易区RYB兑换收益区RYH";
                            } else if((value == 'TO_FRIEND')){
                                return "子钱包转账给朋友";
                            }else if((value == 'ME_TO_ME')){
                                return "子钱包转给自己某个钱包";
                            }else if(value == 'BACK_OPERATION'){
                                return "后台操作";
                            } else if(value == 'BUY_PROJECT'){
                                return "后台购买项目";
                            }else if(value == 'GO_BACK_COIN'){
                                return "回退冻结资金";
                            }else if(value == 'USER_RECEIVE'){
                                return "用户一键领取";
                            } else {
                                return "未知操作类型";
                            }
                        },
                        sortable: true,
                        order: 'asc'
                    },
                    {
                        field: 'currencyNickname',
                        title: '币种',
                        sortable: true,
                        order: 'asc'
                    },
                    {
                        field: 'currency',
                        title: '转账金额',
                        sortable: true,
                        order: 'asc'
                    },{
                        field: 'remark',
                        title: '备注',
                    },
                    {
                        field: 'createDate',
                        title: '创建时间',
                        sortable: true,
                        order: 'asc'
                    },
                    /*{
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
                    }*/]
            });
}

function getUserInfo(id) {
    layer.open({
        type : 2,
        title : '编辑',
        maxmin : true,
        shadeClose : true, // 点击遮罩关闭层
        area : [ '800px', '520px' ],
        content : '/manager/account/webuser/edit/' + id // iframe的url
    });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
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
