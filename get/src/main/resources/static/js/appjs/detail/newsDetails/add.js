$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});

/**
 * 获得对应id域的内容
 *
 * @param contentId
 * @returns {string}
 */
function getContent(contentId) {
    var arr = [];
    arr.push(UE.getEditor(contentId).getContent());
    return arr.join("\n");
}

function save() {
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
    data.enContent = getContent("enContent");
    data.zhContent = getContent("zhContent");

	$.ajax({
		cache : true,
		type : "POST",
		url : "/manager/detail/newsDetails/save",
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
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}