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


    <title> 快递信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath%>/expressage/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="<%=basePath%>/expressage/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>快递列表</h5>
                        </div>
                        <div class="ibox-content">

                            <table class="table table-striped table-bordered table-hover dataTables-example">
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
                                                <a class="btn btn-info btn-rounded" href="/expressage/skipExpressageInfo?expressage_id=${myexpressage.expressage_id}">查看详情</a>
                                                <c:if test="${type == 1}">
                                                    <a class="btn btn-danger btn-rounded" href="javaScript:void(0)">我要配送
                                                    <span style="display:none;">${myexpressage.expressage_id}</span></a>
                                                </c:if>
                                                <font style="color: red">${error}</font>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                <tfoot>
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
    <script src="<%=basePath%>/expressage/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="<%=basePath%>/expressage/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=basePath%>/expressage/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- 自定义js -->
    <script src="<%=basePath%>/expressage/js/content.js?v=1.0.0"></script>
    <script src="<%=basePath%>/expressage/js/MyExpressage.js"></script>
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();

            /* Init DataTables */
            var oTable = $('#editable').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable('../example_ajax.php', {
                "callback": function (sValue, y) {
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            });


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);

        }
    </script>

    
    

</body>

</html>
