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


    <title>快递信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath%>/expressage/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/font-awesome.css?v=4.7.0" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/expressage/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="row">
            <div class="col-sm-5" <c:if test="${expressagestatus.start_status_time == null}"> style="display: none"</c:if>>
                <div class="ibox float-e-margins">
                    <div class="" id="ibox-content">

                        <div id="vertical-timeline"  class="vertical-container light-timeline">
                            <c:if test="${expressagestatus.compelete_pay_time != null}">
                            <div class="vertical-timeline-block" >
                                <div class="vertical-timeline-icon navy-bg">
                                    <i class="fa fa-check-square"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>完成支付</h2>
                                    <span class="vertical-date">
                                    <small>${expressagestatus.compelete_pay_time}</small>
                                </span>
                                </div>
                            </div>
                            </c:if>

                            <c:if test="${expressagestatus.recipient_status_time != null}">
                            <div class="vertical-timeline-block">
                                <div class="vertical-timeline-icon blue-bg">
                                    <i class="fa fa-handshake-o"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>确认收货</h2>
                                    <span class="vertical-date"> <small>${expressagestatus.recipient_status_time}</small></span>
                                </span>
                                </div>
                            </div>
                            </c:if>

                            <c:if test="${expressagestatus.compelete_delivery != null}">

                            <div class="vertical-timeline-block">
                                <div class="vertical-timeline-icon lazur-bg">
                                    <i class="fa fa-home"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>配送完成</h2>
                                    <p>${expressage.expressage_message}
                                    </p>
                                    <span class="vertical-date"> <small>${expressagestatus.compelete_delivery}</small></span>
                                </div>
                            </div>
                            </c:if>

                            <c:if test="${expressagestatus.delivery_status_time != null}">
                            <div class="vertical-timeline-block">
                                <div class="vertical-timeline-icon yellow-bg">
                                    <i class="fa fa-truck"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>配送中</h2>
                                    <span class="vertical-date"><small>${expressagestatus.delivery_status_time}</small></span>
                                </div>
                            </div>
                            </c:if>

                            <c:if test="${expressagestatus.start_status_time != null}">
                            <div class="vertical-timeline-block">
                                <div class="vertical-timeline-icon lazur-bg">
                                    <i class="fa fa-spinner"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>待配送</h2>
                                    <span class="vertical-date"><small>${expressagestatus.start_status_time}</small></span>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>快递详情</h5>
                       
                    </div>
                    <div class="ibox-content">
                        <form method="post" action="<%=basePath%>/expressage/expressage/addexpressageinfo" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">收件人姓名</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_recipient_name" value="${expressage.expressage_recipient_name}" class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
                                <label class="col-sm-2 control-label">收件人电话</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_recipient_phone" value="${expressage.expressage_recipient_phone}"  class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">取件码</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_code" value="${expressage.expressage_code}"  class="form-control">
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">快递公司</label>
                                <div class="col-sm-10">
                                    <select class="form-control m-b" name="expressage_logistics_company">
                                        <option class="role" disabled selected hidden value="${expressage.expressage_logistics_company}"></option>
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
                                    <input type="text" name="expressage_delivery_time" value="${expressage.expressage_delivery_time}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">宿舍楼号</label>

                                <div class="col-sm-10">
                                    <input type="text" name="expressage_dormitory_number" value="${expressage.expressage_dormitory_number}"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submssit">修改</button>
                                    <font style="color: red">${error}</font>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="<%=basePath%>/expressage/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>/expressage/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="<%=basePath%>/expressage/js/content.js?v=1.0.0"></script>
    <script src="<%=basePath%>/expressage/js/plugins/layer/layer.min.js"></script>
    <!-- Flot -->
    <script src="<%=basePath%>/expressage/js/plugins/flot/jquery.flot.js"></script>
    <script src="<%=basePath%>/expressage/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="<%=basePath%>/expressage/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="<%=basePath%>/expressage/js/plugins/flot/jquery.flot.pie.js"></script>
    <!-- iCheck -->
    <script src="<%=basePath%>/expressage/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
    <!--flotdemo-->
    <script type="text/javascript">
        $(function() {
            var container = $("#flot-line-chart-moving");
            var maximum = container.outerWidth() / 2 || 300;
            var data = [];

            function getRandomData() {
                if (data.length) {
                    data = data.slice(1);
                }
                while (data.length < maximum) {
                    var previous = data.length ? data[data.length - 1] : 50;
                    var y = previous + Math.random() * 10 - 5;
                    data.push(y < 0 ? 0 : y > 100 ? 100 : y);
                }
                var res = [];
                for (var i = 0; i < data.length; ++i) {
                    res.push([i, data[i]])
                }
                return res;
            }
            series = [{
                data: getRandomData(),
                lines: {
                    fill: true
                }
            }];
            var plot = $.plot(container, series, {
                grid: {

                    color: "#999999",
                    tickColor: "#f7f9fb",
                    borderWidth:0,
                    minBorderMargin: 20,
                    labelMargin: 10,
                    backgroundColor: {
                        colors: ["#ffffff", "#ffffff"]
                    },
                    margin: {
                        top: 8,
                        bottom: 20,
                        left: 20
                    },
                    markings: function(axes) {
                        var markings = [];
                        var xaxis = axes.xaxis;
                        for (var x = Math.floor(xaxis.min); x < xaxis.max; x += xaxis.tickSize * 2) {
                            markings.push({
                                xaxis: {
                                    from: x,
                                    to: x + xaxis.tickSize
                                },
                                color: "#fff"
                            });
                        }
                        return markings;
                    }
                },
                colors: ["#4fc5ea"],
                xaxis: {
                    tickFormatter: function() {
                        return "";
                    }
                },
                yaxis: {
                    min: 0,
                    max: 110
                },
                legend: {
                    show: true
                }
            });

            // Update the random dataset at 25FPS for a smoothly-animating chart

            setInterval(function updateRandom() {
                series[0].data = getRandomData();
                plot.setData(series);
                plot.draw();
            }, 40);
        });

    </script>

    
    

</body>

</html>
