var $parentNode = window.parent.document;

function $childNode(name) {
    return window.frames[name]
}

// tooltips
$('.tooltip-demo').tooltip({
    selector: "[data-toggle=tooltip]",
    container: "body"
});

// 使用animation.css修改Bootstrap Modal
$('.modal').appendTo("body");

$("[data-toggle=popover]").popover();

//折叠ibox
$('.collapse-link').click(function () {
    var ibox = $(this).closest('div.ibox');
    var button = $(this).find('i');
    var content = ibox.find('div.ibox-content');
    content.slideToggle(200);
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
    ibox.toggleClass('').toggleClass('border-bottom');
    setTimeout(function () {
        ibox.resize();
        ibox.find('[id^=map-]').resize();
    }, 50);
});

//关闭ibox
$('.close-link').click(function () {
    var content = $(this).closest('div.ibox');
    content.remove();
});

//判断当前页面是否在iframe中
//if (top == this) {
//    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
//    $('body').append(gohome);
//}

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

//拖动面板
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable({
        handle: handle,
        connectWith: connect,
        tolerance: 'pointer',
        forcePlaceholderSize: true,
        opacity: 0.8,
    })
        .disableSelection();
};


//编辑器新增的ajax上传图片函数
function sendFile(files, editor, $editable) {
    var size = files[0].size;
    if ((size / 1024 / 1024) > 2) {
        alert("图片大小不能超过2M...");
        return false;
    }
    console.log("size=" + size);
    var formData = new FormData();
    formData.append("file", files[0]);
    $.ajax({
        data: formData,
        type: "POST",
        url: "/common/sysFile/upload",    // 图片上传出来的url，返回的是图片上传后的路径，http格式
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (data) {//data是返回的hash,key之类的值，key是定义的文件名
            $('.summernote').summernote('insertImage', data.fileName);
        },
        error: function () {
            alert("上传失败");
        }
    });
}

window.onload = function () {
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        var start = laydate.render({
            elem: '#createStartDate', //指定元素
            type: 'date',
            done: function (value,date) {
                if(value != ''){
                    date.month = date.month - 1;
                    end.config.min = date
                }
            }
        });
        var end = laydate.render({
            elem: '#createEndDate', //指定元素
            type: 'date',
            done: function (value,date) {
                if(value != ''){
                    date.month = date.month - 1;
                    start.config.max = date
                }
            }
        });
        laydate.render({
            elem: '#rankingDate', //指定元素
            type: 'date'
        });
        laydate.render({
            elem: '#startReleaseDate', //指定元素
            type: 'date',
            done: function (value,date) {
                if(value != ''){
                    date.month = date.month - 1;
                    start.config.max = date
                }
            }
        });
    });

    // layui.use('form', function(){
    //     var form = layui.form;
    //     form.on('switch(switch)', function(data){
    //
    //         // layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
    //     });
    //     form.render();
    //
    // });


    $(" .search input ").attr({
        'onkeyup':"this.value=this.value.replace(/^\\s+|\\s+$/g,'')"
    })

    $(".search ").bind("keydown", function (e) {
        var theEvent = e || window.event;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            reLoad();
        }else if(code == 32){
            return false;
        }
    });

    //jq validator增加小数点验证方法 --
    jQuery.validator.addMethod("minNumber",function(value, ele){
        var returnVal = true;
        inputZ=value;
        var Arr= inputZ.split(".");
        if(Arr.length==2){
            if(Arr[1].length>8){
                returnVal = false;
                return false;
            }
        }
        return returnVal;
    },"小数点后最多为8位");

    //页面进入触发排序
    $("th[data-field='createDate']>.th-inner").click()
    $(".logT th[data-field='gmtCreate']>.th-inner").click()
    // 每日释放量 再次触发 待优化
    $(".otherT th[data-field='releaseDate']>.th-inner").click()
    $(".otherT th[data-field='releaseDate']>.th-inner").click()
}

//表头字符串大写处理方法
function Lower(params ) {
    params= params||'';
    var reg = /[A-Z]+/g
    var regArr =  params.match(reg) || ''
    for (var i=0;i<regArr.length;i++){
        var rep = regArr[i]
        params=params.replace(rep,'_'+rep.toLowerCase())
    }
    return params;
}

//页面文字复制功能(手动创建Input元素)
function Copy(value) {
    const input = document.createElement('input');
    document.body.appendChild(input);
    input.setAttribute('value', value);
    input.select();
    if (document.execCommand('copy')) {
        document.execCommand('copy');
        parent.layer.msg("复制成功");
    }
    document.body.removeChild(input);

}

var clickBtn = function(e){
    var theEvent = e || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        $('.btn.btn-outline').click()
    }
}

var clearForm = function () {
    $(".search input").val("");
    if($('.search select').get(0)) {$('.search select').get(0).selectedIndex=0;}
    if($('.search select').get(1)) {$('.search select').get(1).selectedIndex=0;}
    if($('.search select').get(2)) {$('.search select').get(2).selectedIndex=0;}
    reLoad()
}







