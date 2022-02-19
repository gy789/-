$(document).ready(function () {
    $('.btn-success').each(function () {
        $(this).click(function () {
            var expressage_id = $(this).children("span").text();
            var bool = confirm("确定货物已经收到手里了吗？");
            if (bool){
                $.ajax({
                   type: "POST",
                   url: "/expressage/updateStatus",
                   data: {
                       expressage_id: expressage_id,
                       type: 2
                   },
                   success: function () {
                       alert("收货成功");
                       //跳转支付页面
                   },
                   error: function () {
                       alert("系统异常，收货失败");
                       window.location.reload()
                   }
                });
            }
        })
    })
});