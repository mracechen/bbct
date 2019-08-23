$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {

    var data = {};
    $(".input").each(function(index,item) {
        console.log(item.attributes)
        var name = item.name;
        if (item.type == 'text') {
            data[name] = item.value;
        }else if(item.type == 'radio'){
            if(item.checked){
                if(item.id == "normal"){
                    data[name] = 'normal';
                }else{
                    data[name] = 'back';
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
		url : "/manager/lpproject/lpInvestProfitRecord/save",
		data : data,// 你的formid $('#signupForm').serialize()
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
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}