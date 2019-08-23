
var prefix = "/manager/sysconfig/config"
$(function() {
    load();
});

function load() {
    $.get(prefix+"/list",{"clazz":"IndexConfig"},function (data) {
        console.log(JSON.stringify(data))
        console.log($(".input"));
        var data = data.data
        $(".input").each(function(index,item){
            data.forEach(function (value) {
                if(item.name == value.fieldName) {
                    if (item.type == "text"|| item.type == "textarea") {
                        item.value = value.fieldValue
                    }else if(item.type == "radio"){
                        if(value.fieldValue == "1"){
                            if(item.id == "1"){
                                item.checked = true
                            }
                        }else{
                            if(item.id == "0"){
                                item.checked = true
                            }
                        }
                    }else{
                        item.src = value.fieldValue
                    }
                }
            })
        })
    })
}