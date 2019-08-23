var prefix = "/manager/sysconfig/config"
$(function () {
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
    load();

    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

});

function load() {
    // var flag=$("input[name='IsEnableAdminLoginMobileCheck']").prop("checked");
    // $("input[name='IsEnableAdminLoginMobileCheck']").prop("checked",!flag);
    // // form.render("checkbox");
    // layui.use('form', function () {
    //     var form = layui.form;
    //     form.render('checkbox');
    // });
    // return
    var clazzName = $("#clazzName").val();
    $.get(prefix + "/list", {"clazzName": clazzName}, function (data) {
        if (data.status != 200) {
            parent.layer.msg(data.msg);
            return;
        }
        var data = data.data
        $(".input").each(function (index, item) {
            data.forEach(function (value) {
                if(value == null || value =='') {
                    return;
                }

                if (item.name == value.fieldName) {
                    if (item.type == "text" || item.type == "textarea") {
                        item.value = value.fieldValue
                    } else if (item.type == "checkbox") {

                        console.log(value.fieldValue,'value.fieldValuevalue.fieldValuevalue.fieldValuevalue.fieldValue')
                        if (value.fieldValue == "0") {
                            $("input[name= "+item.name +"  ]").prop("checked",true);
                            layui.use('form', function () {
                                var form = layui.form;
                                form.render();
                            });

                        } else {
                            $("input[name= "+item.name +"  ]").prop("checked",false);
                            layui.use('form', function () {
                                var form = layui.form;
                                form.render();
                            });
                        }
                    } else {
                        if (value.fieldValue) {
                            item.src = value.fieldValue
                        }

                    }
                }
            })
        })
    })
}

layui.use('upload', function () {
    var upload = layui.upload;
    //执行实例
    var uploadInst = upload.render({
        elem: '.test1', //绑定元素
        url: '/manager/common/sysFile/upload', //上传接口
        size: 1000,
        accept: 'file',
        done: function (r) {
            console.log(this.item[0].dataset.key);
            $("." + this.item[0].dataset.key).attr("src", r.fileName)
            // layer.msg(r.msg);
        },
        error: function (r) {
            layer.msg(r.msg);
        }
    });
});


function upload(obj) {
    var imgUlr = $(obj).attr("src")
    console.log(imgUlr);
    $("#loading").css("display", "block")
    $("#upload").attr("src", imgUlr)
}

$(".btn").on("click", function () {
    var data = {};
    console.log($(".input"));

    // $(".input")[0].checked = true;
    // layui.form.render();
    // return
    $(".input").each(function (index, item) {

        var name = item.name;
        // var t = item.attributes.type.nodeValue;
        var src = '';
        if(name.indexOf("Logo") != -1){
            debugger;
            src = item.attributes.src.nodeValue;
        }
        if (item.type == "text" || item.type == "textarea") {
            data[name] = item.value;
        } else if (item.type == "checkbox") {
            if (item.checked == true) {
                data[name] = 0;
            } else {
                data[name] = 1;
            }
        }else if (item.nodeName == "IMG") {
            data[name] = item.attributes.src.nodeValue;
        }
    });

    var clazzName = $("#clazzName").val();
    /**
     * 保存方法
     */
    $.post(prefix + "/update", {data: JSON.stringify(data), "clazzName": clazzName}, function (d) {
        load();
        layer.msg(d.msg);
    })

    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

})
