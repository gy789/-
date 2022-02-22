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
    <meta name="renderer" content="webkit">

    <title> 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="expressage/favicon.ico"> <link href="expressage/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="expressage/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="expressage/css/animate.css" rel="stylesheet">
    <link href="expressage/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            ${sessionScope.menu}
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <h2>&nbsp;&nbsp;欢迎进入校园快递代取系统</h2>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>

                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="/expressage/myexpressage" frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="expressage/js/jquery.min.js?v=2.1.4"></script>
<script src="expressage/js/bootstrap.min.js?v=3.3.6"></script>
<script src="expressage/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="expressage/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="expressage/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="expressage/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="expressage/js/index.js"></script>

<!-- 第三方插件 -->
<script src="expressage/js/plugins/pace/pace.min.js"></script>

</body>

</html>
