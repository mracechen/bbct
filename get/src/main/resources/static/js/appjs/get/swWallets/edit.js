$().ready(function () {
    $.ajax({
        url:"/manager/get/swCoinType/query_all",
        type:"GET",
        success:function (res) {
            let coinTypeIdTemp = $("#coinTypeIdTemp").val();
            $("#coinTypeId").empty();
            for(let i=0;i<res.length;i++){
                let temp = res[i];
                if(temp != null && temp.tid == coinTypeIdTemp){
                    $("#coinTypeId").append("<option selected value='"+temp.tid+"'>"+temp.coinName+"</option>")
                }else{
                    $("#coinTypeId").append("<option value='"+temp.tid+"'>"+temp.coinName+"</option>")
                }
            }
        }
    });
    validateRule();
});

$.validator.setDefaults({
    submitHandler: function () {
        update();
    }
});
function update() {
    $.ajax({
        cache: true,
        type: "POST",
        url: "/manager/get/swWallets/update",
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
                required: icon + "请输入名字"
            }
        }
    })
}