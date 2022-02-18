<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>个人快递信息填写</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人快递信息填写</h5>
                       
                    </div>
                    <div class="ibox-content">
                        <form method="post" action="/expressage/addexpressageinfo" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">收件人姓名</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_recipient_name"  class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
                                <label class="col-sm-2 control-label">收件人电话</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_recipient_phone"  class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">取件码</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_code"  class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">快递公司</label>
                                <div class="col-sm-10">
                                    <select class="form-control m-b" name="expressage_logistics_company">
                                        <option class="role" value="0"></option>
                                        <option class="role" value="2"></option>
                                        <option class="role" value="1"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">配送时间</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_delivery_time"  class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">宿舍楼号</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_dormitory_number"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submssit">添加</button>
                                    <font style="color: red">${error}</font>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

    
    

</body>

</html>
