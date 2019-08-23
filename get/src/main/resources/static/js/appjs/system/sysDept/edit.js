$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});
function update() {
    var data = {};
    $(".input").each(function(index,item) {
        console.log(item.attributes)
        var name = item.name;
        if (item.type == 'text') {
            data[name] = item.value;
        }else if(item.type == 'radio'){
            if(item.checked){
                if(item.id == "1"){
                    data[name] = 1;
                }else{
                    data[name] = 0;
                }
            }
        } else if(item.type == 'select-one'){
            data[name] = item.value;
        }else {
            data[name] = item.attributes[3].value;
        }
    });
	$.ajax({
		cache : true,
		type : "POST",
		url : "/manager/system/sysDept/update",
		data : data,// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 200) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			},
            orderNum : {
                required : true
            }
		},
		messages : {
			name : {
				required : icon + "请输入部门名称"
			},
            orderNum : {
				required : icon + "请输入排序号"
			}
		}
	})
}