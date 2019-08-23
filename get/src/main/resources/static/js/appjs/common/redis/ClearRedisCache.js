$("#sub").click(function () {
    var cacheKey = $("#cacheKey").val();
    $.ajax({
        url:"/manager/get/redis/cache/clearByPrefix",
        type:"GET",
        data:{"cacheKey":cacheKey},
        success:function (res) {
            console.log(res);
            alert("操作成功！");
        },
        error:function (res) {
            console.log(res);
        }
    })
});