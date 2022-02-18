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


    <title> - 文章列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight blog">
        <div class="row">
            <c:forEach items="${merchants}" var="merchant">
            <div class="col-lg-4">
                <div class="ibox">
                    <div class="ibox-content">
                        <a href="javaScript:void(0)" class="btn-link">
                            <h2>
                                    ${merchant.mname}
                                </h2>
                        </a>
                        <div class="small m-b-xs">
                            <strong>介绍</strong>
                        </div>
                        <p>
                            ${merchant.mdetails}
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <h5>操作：</h5>
                                <a class="btn btn-info btn-rounded" href="/shop/admin/getmerchant?mid=${merchant.mid}">编辑</a>
                                <a class="btn btn-warning btn-rounded" href="javaScript:void(0)">删除
                                    <span style="display: none;">${merchant.mid}</span></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            
            
        </div>
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <script src="js/delmer.js"></script>



    
    

</body>

</html>
