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

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath%>/expressage/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="<%=basePath%>/expressage/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>我的快递</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter"
                                   placeholder="搜索表格...">

                            <table class="footable table table-stripped" data-page-size="5" data-filter=#filter>
                                <thead>
                                        <tr>
                                            <th>收件人</th>
                                            <th>手机号</th>
                                            <th>取货码</th>
                                            <th>物流公司</th>
                                            <th>配送状态</th>
                                            <th>支付状态</th>
                                            <th>留言信息</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${myexpressages}" var="myexpressage">
                                        <tr class="gradeX">
                                            <td>${myexpressage.expressage_recipient_name}</td>
                                            <td>${myexpressage.expressage_recipient_phone}
                                            </td>
                                            <td>${myexpressage.expressage_code}</td>
                                            <td class="center">${myexpressage.expressage_logistics_company}</td>
                                            <td class="center">${myexpressage.expressage_delivery_status}</td>
                                            <td class="center">${myexpressage.expressage_pay_status}</td>
                                            <td class="center">${myexpressage.expressage_message}</td>
                                            <td>
                                                <c:if test="${myexpressage.expressage_delivery_status != '已配送'}">
                                                <a class="btn btn-info btn-rounded" href="/expressage/skipExpressageInfo?expressage_id=${myexpressage.expressage_id}">编辑</a>
                                                <a class="btn btn-warning btn-rounded" href="javaScript:void(0)">取消订单</a>
                                                </c:if>
                                                <c:if test="${myexpressage.expressage_delivery_status == '已配送'}">
                                                <a class="btn btn-primary  btn-rounded" href="javaScript:void(0)">支付</a>
                                                </c:if>
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
    <script src="<%=basePath%>/expressage/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>/expressage/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>/expressage/js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="<%=basePath%>/expressage/js/content.js?v=1.0.0"></script>
    <script src="<%=basePath%>/expressage/js/deluser.js"></script>
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

    </script>

    
    

</body>

</html>
