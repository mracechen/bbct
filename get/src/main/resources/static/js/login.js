var countdown = 60;
var isSendCheckCode = true;
var flag = true;

function settime(obj) {
    if (isSendCheckCode) {
        var username = $("#username").val();
        if (username == null || username == '') {
            layer.msg("请输入用户名!");
            return;
        }

        $.ajax({
            type: "post",
            url: "/manager/sendMobileCheckCode",
            data: {'username': username},
            async: false,
            success: function (res) {
                layer.msg(res.msg);
                if (res.status == 500) {
                    flag = false;
                    return;
                } else {
                    isSendCheckCode = false;
                }
            }
        });

    }
    if (!flag) {
        return;
    }


    if (countdown == 0) {
        obj.removeAttribute("disabled");
        obj.value = "获取手机验证码";
        countdown = 60;
        return;
    } else {
        obj.setAttribute("disabled", true);
        obj.value = "重新发送(" + countdown + ")";
        countdown--;

        isSendCheckCode = false;
    }
    setTimeout(function () {
            settime(obj)
        }
        , 1000)
}

var keyEvent = function (e) {
    var theEvent = e || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        $('.btn.btn-login.btn-block').click()
    }
}
