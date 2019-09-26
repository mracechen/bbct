$().ready(function () {
    validateRule();
});

function levelChange() {
    let level = $('#level option:selected').val();
    let type = $('#type option:selected').val();
    let ex1Temp = $("#ex1Temp").val();
    if(level == 2 && type != null && type != ''){
        $("#ex1").empty();
        $("#ex1").append("<option value=''>请选择</option>");
        $.ajax({
            url:"/manager/get/information/queryByProperties",
            type:"GET",
            data:{"level":1,"type":type},
            success:function (res) {
                for(let i=0;i<res.length;i++){
                    let r = res[i];
                    if(ex1Temp == r.tid){
                        $("#ex1").append("<option selected value='"+r.tid+"'>"+r.title+"</option>")
                    }else{
                        $("#ex1").append("<option value='"+r.tid+"'>"+r.title+"</option>")
                    }
                }
            }
        })
    }
}
function typeChange() {
    let level = $('#level option:selected').val();
    let type = $('#type option:selected').val();
    let ex1Temp = $("#ex1Temp").val();
    if(level == 2 && type != null && type != ''){
        $("#ex1").empty();
        $("#ex1").append("<option value=''>请选择</option>");
        $.ajax({
            url:"/manager/get/information/queryByProperties",
            type:"GET",
            data:{"level":1,"type":type},
            success:function (res) {
                for(let i=0;i<res.length;i++){
                    let r = res[i];
                    if(ex1Temp == r.tid){
                        $("#ex1").append("<option selected value='"+r.tid+"'>"+r.title+"</option>")
                    }else{
                        $("#ex1").append("<option value='"+r.tid+"'>"+r.title+"</option>")
                    }
                }
            }
        })
    }
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
        url: "/manager/get/information/save",
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