var prefix = "/manager/common/settlementTest";
$(function () {
    // load();
});

// function dbRecover() {
//     $.get(prefix + "/dbRecover", function (d) {
//         // load();
//         // layer.msg(d.msg);
//     })
// }

function startTest() {
    var startTime = $('#createStartDate').val();
    var endTime = $('#createEndDate').val();
    $.get(prefix + "/test?startTime=" + startTime + "&endTime=" + endTime, function (d) {
        // load();
        // layer.msg(d.msg);
    })
}
