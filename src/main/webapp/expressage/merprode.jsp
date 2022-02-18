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


    <title> - 商品信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品信息</h5>

                    </div>
                    <div class="ibox-content">
                        <form method="post" action="/shop/admin/updatepro" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品标识码</label>

                                <div class="col-sm-10">
                                    <input type="text" name="pnumber" id="pnumber" value="${merproduct.pnumber}" class="form-control">
                                    <input type="text" name="pid" style="display: none" value="${merproduct.pid}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品名</label>

                                <div class="col-sm-10">
                                    <input type="text" name="pname" value="${merproduct.pname}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">价格</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="price" value="${merproduct.price}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品类型</label>
                                <div class="col-sm-10">
                                    <input type="text" name="types"  value="${merproduct.types}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">尺寸</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="sizes" value="${merproduct.sizes}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品库存</label>
                                <div class="col-sm-10">
                                    <input type="text" name="repertory"  value="${merproduct.repertory}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品介绍：</label>
                                <div class="col-sm-8">
                                    <textarea   name="introduce" class="form-control" required="" aria-required="true">${merproduct.introduce}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">修改</button>
                                    <font style="color: red">${error}</font>
                                </div>
                            </div>
                        </form>
                        <div class="hr-line-dashed"></div>
                            <form method="post" action="javaScript:void(0)" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">成分：</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ingre1" id="ingre1"  value="${ingredients.ingre1}" class="form-control">
                                    <input type="text" name="ingre2" id="ingre2" value="${ingredients.ingre2}" class="form-control">
                                    <input type="text" name="ingre3" id="ingre3"value="${ingredients.ingre3}" class="form-control">
                                    <input type="text" name="ingre4" id="ingre4" value="${ingredients.ingre4}" class="form-control">

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" id="updateingre">修改</button>
                                    <font style="color: red">${error}</font>
                                </div>
                            </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品图片</h5>
                    </div>
                    <div class="ibox-content">
                        <c:forEach items="${imgs}" var="img">

                        <a class="fancybox"  title="图片1">
                            <a href="javaScript:void(0)"><i class="fa fa-times-circle-o"><span style="display: none">${img.img_id}</span> </i></a>
                            <img alt="image" style="width: 280px;height: 390px" src="${img.imgurl}" />
                        </a>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/delimg.js"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <script src="js/updateingre.js"></script>


    <!-- Fancy box -->
    <script src="js/plugins/fancybox/jquery.fancybox.js"></script>


    <script>
        $(document).ready(function () {
            $('.fancybox').fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
    </script>

    
    

</body>

</html>
