$().ready(function () {
    queryAllRule();
    validateRule();
});
/** 查询规则列表 **/
function queryAllRule() {
    $("#ruleId").empty();
    $("#ruleId").append("<option value=''>请选择规则</option>");
    $.ajax({
        url:"/manager/get/swRewardRule/queryAll",
        type:'GET',
        data:{},
        async:true,
        success:function (res) {
            if(res != '' && res != null && res != 'null'){
                res.map(function (item) {
                    $("#ruleId").append("<option value='"+item.tid+"'>"+item.name+"</option>");
                })
            }
        }
    });
}
$.validator.setDefaults({
    submitHandler: function () {
        save();
    }
});
function save() {
    $.ajax({
        cache: true,
        type: "POST",
        url: "/manager/get/swRuleDetail/save",
        data: $('#signupForm').serialize(),// 你的formid
        async: false,
        error: function (request) {
            parent.layer.alert("Connection error");
        },
        success: function (data) {
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
        rules: {
            name: {
                required: true
            }
        },
        messages: {
            name: {
                required: icon + "请输入姓名"
            }
        }
    })
}