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


    <title> - FooTable</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>购物车列表</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter"
                                   placeholder="搜索表格...">

                            <table class="footable table table-stripped" data-page-size="5" data-filter=#filter>
                                <thead>
                                        <tr>
                                            <th>商品图片</th>
                                            <th>商品名</th>
                                            <th>规格</th>
                                            <th>价格</th>
                                            <th>数量</th>
                                            <th>用户昵称</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${shopCars}" var="shopcar">
                                        <tr class="gradeX">
                                            <td><img style="height: 180px;width: 178px" src="${shopcar.img}" alt="" /></td>
                                            <td>${shopcar.pname}
                                            </td>
                                            <td>${shopcar.sizes}</td>
                                            <td class="center">${shopcar.price}</td>
                                            <td class="center">${shopcar.numbers}</td>
                                            <td class="center">${shopcar.username}</td>
                                            <td>
                                                <a class="btn btn-warning btn-rounded" href="javaScript:void(0)">删除
                                                    <span style="display:none;">${shopcar.cartid}</span></a>
                                                <font style="color: red">${error}</font>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="5">
                                                <ul class="pagination pull-right"></ul>
                                            </td>
                                        </tr>
                                    </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <script src="js/delcar.js"></script>
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

    </script>

    
    

</body>

</html>
