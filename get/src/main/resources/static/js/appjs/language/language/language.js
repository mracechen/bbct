
var prefix = "/manager/language/language"
$(function() {
	load("/list");
});

function load(url) {
	$('#exampleTable')
			.bootstrapTable(
					{
						method : 'get', // 服务器数据的请求方式 get or post
						url : prefix +"/list", // 服务器数据的加载地址
					//	showRefresh : true,
					//	showToggle : true,
					//	showColumns : true,
						iconSize : 'outline',
						toolbar : '#exampleToolbar',
						striped : true, // 设置为true会有隔行变色效果
						dataType : "json", // 服务器返回的数据类型
						pagination : true, // 设置为true会在底部显示分页条
						// queryParamsType : "limit",
						// //设置为limit则会发送符合RESTFull格式的参数
						singleSelect : false, // 设置为true将禁止多选
						// contentType : "application/x-www-form-urlencoded",
						// //发送到服务器的数据编码类型
						pageSize : 10, // 如果设置了分页，每页数据条数
						pageNumber : 1, // 如果设置了分布，首页页码
						search : true, // 是否显示搜索框
						showColumns : false, // 是否显示内容下拉框（选择显示的列）
						sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                        showJumpto:"true", //设置是否显示跳转页面功能
                        queryParams : function(params) {
							console.log(params)
							return {
								//说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
								limit: params.limit,
								offset:params.offset,
                                zhText:params.search
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
						columns : [
								{
									checkbox : true
								},
																{
									field : 'zhText', 
									title : '翻以前的值'
								},
																{
									field : 'toStatus',
									title : '翻译语言',
									formatter: function (value, row, index) {
                                        switch(value) {
                                            case 'en':
                                                return '英文';
                                            case 'yue':
                                                return '粤语';
                                            case 'vie':
                                                return '越南语';
                                            case 'wyw':
                                                return '文言文';
                                            case 'jp':
                                                return '日语';
                                            case 'kor':
                                                return '韩语';
                                            case 'fra':
                                            	return '法语';
                                            case 'spa':
                                            	return '西班牙语';
                                            case 'th':
                                                return '泰语';
                                            case 'ara':
                                                return '阿拉伯语';
                                            case 'ru':
                                                return '俄语';
                                            case 'pt':
                                                return '葡萄牙语';
                                            case 'de':
                                                return '德语';
                                            case 'it':
                                                return '意大利语';
                                            case 'el':
                                            	return '希腊语';
                                            case 'nl':
                                                return '荷兰语';
                                            case 'bul':
                                            	return '保加利亚语';
                                            case 'est':
                                            	return '爱沙尼亚语';
                                            case 'dan':
                                            	return '丹麦语';
                                            case 'fin':
                                                return '芬兰语';
                                            case 'cs':
                                                return '捷克语';
                                            case 'rom':
                                                return '罗马尼亚语';
                                            case 'slo':
                                                return '斯洛文尼亚语';
                                            case 'swe':
                                                return '瑞典语';
                                            case 'hu':
                                                return '匈牙利语';
                                            case 'cht':
                                                return '繁体中文';

                                        }
									}
								},
																{
									field : 'toText', 
									title : '翻译后的值'
								},
																{
									field : 'createDate', 
									title : '创建时间' 
								},
																{
									field : 'updateDate', 
									title : '更新时间' 
								},
																{
									title : '操作',
									field : 'id',
									align : 'center',
									formatter : function(value, row, index) {
										var e = '<a class="btn btn-primary btn-sm '+s_edit_h+'" href="#" mce_href="#" title="编辑" onclick="edit(\''
												+ row.tid
												+ '\')"><i class="fa fa-edit"></i></a> ';
										var d = '<a class="btn btn-warning btn-sm '+s_remove_h+'" href="#" title="删除"  mce_href="#" onclick="remove(\''
												+ row.tid
												+ '\')"><i class="fa fa-remove"></i></a> ';
										var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
												+ row.tid
												+ '\')"><i class="fa fa-key"></i></a> ';
										return e + d ;
									}
								} ]
					});
}
function reLoad() {
	$('#exampleTable').bootstrapTable('refresh');
}

/**
 * 搜索方法
 */
function search() {
    var searchVal = $('#search').val();
    if(searchVal == null || searchVal == ''){
        parent.layer.msg("请输入搜索的值");
        return ;
	}
	// load()
	//
    // $('#exampleTable').val("");
    $("#tablelist").bootstrapTable('refresh', {
        url: prefix +"/search?zhText="+searchVal, //重设数据来源
        //传到后台的参数
    });

}
function add() {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : true, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add' // iframe的url
	});
}
function edit(id) {
	layer.open({
		type : 2,
		title : '编辑',
		maxmin : true,
		shadeClose : true, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/edit/' + id // iframe的url
	});
}
function remove(id) {
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	}, function() {
		$.ajax({
			url : prefix+"/remove",
			type : "post",
			data : {
				'tid' : id
			},
			success : function(r) {
				if (r.code == 200) {
					layer.msg(r.msg);
					reLoad();
				}else{
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
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['tid'];
		});
		$.ajax({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
			success : function(r) {
				if (r.code == 200) {
					layer.msg(r.msg);
					reLoad();
				} else {
					layer.msg(r.msg);
				}
			}
		});
	}, function() {

	});
}