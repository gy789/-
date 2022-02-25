<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 收件箱</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath%>expressage/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>expressage/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>expressage/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath%>expressage/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>expressage/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            
            <div class="col-sm-9 animated fadeInRight">
                <div class="mail-box-header">

                 
                    <h2>
                    信息 (<c:out value="${fn:length(messageList)}"></c:out>)
                </h2>
                    <div class="mail-tools tooltip-demo m-t-md">

                        <c:if test="${type == 1}">
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" id="read" title="标为已读"><i class="fa fa-eye"></i>
                        </button>
                        </c:if>
                        
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" id="delete" title="删除"><i class="fa fa-trash-o"></i>
                        </button>

                    </div>
                </div>
                <div class="mail-box">

                    <table class="table table-hover table-mail">
                        <tbody>
                        <c:forEach items="${messageList}" var="messages">
                            <tr class="unread">
                                <td class="check-mail">
                                    <input type="checkbox" value="${messages.message_id}" class="i-checks" >
                                </td>
                                <td class="mail-ontact">${messages.message_info}
                                </td>
                                <td class="text-right mail-date">${messages.create_time}</td>
                            </tr>
                        </c:forEach>
                            
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
    </div>


    <!-- 全局js -->
    <script src="<%=basePath%>expressage/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>expressage/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="<%=basePath%>expressage/js/content.js?v=1.0.0"></script>


    <!-- iCheck -->
    <script src="<%=basePath%>expressage/js/plugins/iCheck/icheck.min.js"></script>
    <script src="<%=basePath%>expressage/js/Message.js"></script>
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
