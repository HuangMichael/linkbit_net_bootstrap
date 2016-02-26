<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css"/>
<!--/HEADER -->
<!-- PAGE -->
<section id="page">
    <!-- SIDEBAR -->
    <%@include file="../common/siderBar.jsp" %>
    <!-- /SIDEBAR -->
    <div id="main-content">
        <div class="container">
            <div class="row">
                <div id="content" class="col-lg-12">
                    <%@include file="../common/banner.jsp" %>
                    <!-- TABLE IN MODAL -->
                    <!-- EXPORT TABLES -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <%@include file="../common/menu.jsp" %>
                                <div class="box-body">
                                    <form class="form-horizontal" role="form" method="post" action="/back/product/update">
                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="${product.productImgUrl}" width="200px"/>
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">产品名称</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text"
                                                               placeholder="192.168.1.161"
                                                               value="${product.productName}"/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">产品描述</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="text"
                                                               placeholder="msh" value="${product.productDesc}"
                                                        />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label"
                                                           for="productImgUrl">图片路径</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productImgUrl" type="text"
                                                               placeholder="root" value="${product.productImgUrl}"
                                                        />
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="onLineDate">上线日期</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="onLineDate" type="date"
                                                               placeholder="123456" value="${product.onLineDate}"
                                                        />
                                                    </div>
                                                </div>
                                                <div class="form-group">

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">主页显示</label>

                                                    <div class="col-sm-5">
                                                        <select id="showInMainPage" class="form-control">
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>
                                                    <label for="sortNo" class="col-sm-1 control-label">排列顺序</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="sortNo" type="number"
                                                               value="${product.sortNo}"/>
                                                    </div>
                                                </div>


                                                <div class="form-group">

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">是否上线</label>

                                                    <div class="col-sm-5">
                                                        <select id="online" class="form-control">
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">产品类型</label>

                                                    <div class="col-sm-5">
                                                        <select class="form-control" id="productType" name="product.productType">
                                                            <c:forEach items="${productTypeList}" var="productType">
                                                                <option value="${productType.id}">${productType.typeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn btn-default" href="/back/product/index">关闭</a>
                                            <button type="submit" id="save${product.id}" name="saveBtn"
                                                    class="btn btn-primary">保存
                                            </button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /BOX -->
                    </div>
                </div>
                <!-- /EXPORT TABLES -->
                <div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i>回到顶部
							</span>
                </div>
            </div><!-- /CONTENT-->
        </div>
    </div>
    </div>

</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        /* App.setPage("forms");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });
</script><!-- /JAVASCRIPTS -->

<script type="text/javascript">
    $(function () {


        /**
         * 提交上传文件
         * */
        $("#submit").on("click", function (data) {
            var fullName = $("#file").val();
            $("#uploadForm").attr("action", url);
            $("#uploadForm").submit();

        });

        $("#file").on("change", function () {
            $("#fileName").val((getFileName($(this).val())));
        });


        /**
         * 获取文件名称
         * */
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
        }

    })
</script>


</body>
</html>
