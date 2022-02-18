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


    <title> - 添加商品</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

    <link href="css/IMGUP.css" rel="stylesheet" />

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
                        <form method="post" action="/shop/admin/addmerproduct" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品标识码</label>

                                <div class="col-sm-10">
                                    <input type="text" id="pnumber" name="pnumber"  class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品名</label>

                                <div class="col-sm-10">
                                    <input type="text" name="pname"  class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">价格</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="price" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品类型</label>
                                <div class="col-sm-10">
                                    <input type="text" name="types" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品规格</label>
                                <div class="col-sm-10">
                                    <input type="text" name="sizes" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品库存</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="repertory" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品介绍：</label>
                                <div class="col-sm-8">
                                    <textarea   name="introduce" class="form-control" required="" aria-required="true"></textarea>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">添加</button>
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
                <div class="ibox-title">
                    <h5>商品图片</h5>
                </div>
                <!--图片选择对话框-->
                <div id="div_imgfile">选择图片</div>

                <!--图片预览容器-->
                <div id="div_imglook">
                    <div style="clear: both;"></div>
                </div>

                <!--确定上传按钮-->
                <input type="button" value="确定上传" id="btn_ImgUpStart" />
            </div>

        </div>
    </div>


    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>


    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <script src="js/IMGUP.js"></script>

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
