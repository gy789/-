$(document).ready(function () {
    $('.btn-warning').each(function () {
        $(this).click(function () {
            var uid = $(this).children("span").text();
            var bool = confirm("确定删除");
            if(bool){
                $.ajax({
                    type: "POST",
                    url: "/shop/admin/deleteuser",
                    data: {
                        uid: uid
                    },
                    success: function () {
                        alert("删除成功");
                        window.location.reload()
                    },
                    error: function () {
                        alert("删除失败，系统失去连接");
                    }

                });
            }
        })
    })
});