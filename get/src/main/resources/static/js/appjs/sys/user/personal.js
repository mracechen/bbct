var prefix = "/manager/sys/user"
$(function () {
    console.log(laydate,'sssssssssssssssss')
    laydate({
        elem : '#birth'
    });
});


// $(function () {
//     laydate.render({
//         elem : '#birth2'
//     });
// });
/**
 * 基本信息提交
 */
$("#base_save").click(function () {
    var hobbyStr = getHobbyStr();
    $("#hobby").val(hobbyStr);
    if($("#basicInfoForm").valid()){
            $.ajax({
                cache : true,
                type : "POST",
                url :"/manager/sys/user/updatePeronal",
                data : $('#basicInfoForm').serialize(),
                async : false,
                error : function(request) {
                    laryer.alert("Connection error");
                },
                success : function(data) {
                    if (data.code == 200) {
                        parent.layer.msg("更新成功");
                    } else {
                        parent.layer.alert(data.msg)
                    }
                }
            });
        }

});
$("#pwd_save").click(function () {
    if($("#modifyPwd").valid()){
        $.ajax({
            cache : true,
            type : "POST",
            url :"/manager/sys/user/resetPwd",
            data : $('#modifyPwd').serialize(),
            async : false,
            error : function(request) {
                parent.laryer.alert("Connection error");
            },
            success : function(data) {
                if (data.code == 200) {
                    parent.layer.alert("更新密码成功");
                    $("#photo_info").click();
                    location.reload();
                } else {
                    parent.layer.alert(data.msg)
                }
            }
        });
    }
});
function getHobbyStr(){
    var hobbyStr ="";
    $(".hobby").each(function () {
        if($(this).is(":checked")){
            hobbyStr+=$(this).val()+";";
        }
    });
   return hobbyStr;
}