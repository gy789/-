$(document).ready(function () {
    $('#updateingre').click(function () {
        var bool = confirm("确定修改");
        if(bool){
            var ingre1 = $('#ingre1').val();
            var ingre2 = $('#ingre2').val();
            var ingre3 = $('#ingre3').val();
            var ingre4 = $('#ingre4').val();
            var pnumber = $('#pnumber').val();

            $.ajax({
                type: "POST",
                url: "/shop/admin/updateingre",
                data: {
                    ingre1: ingre1,
                    ingre2: ingre2,
                    ingre3: ingre3,
                    ingre4: ingre4,
                    pnumber: pnumber
                },
                success: function () {
                    alert("修改成功");
                },
                error: function () {
                    alert("修改失败，系统失去连接");
                }
            })


        }
    })
});