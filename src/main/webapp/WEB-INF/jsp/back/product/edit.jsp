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
                                    <form class="form-horizontal" role="form" method="post" id="form"
                                          action="/back/product/update">
                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="${product.productImgUrl}" width="200px"/>
                                            </div>

                                            <input type="hidden" id="objId" name="objId" value="${product.id}"/>

                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="productName">产品名称</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productName" type="text"
                                                               name="productName"
                                                               value="${product.productName}"/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="productDesc">产品描述</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productDesc" type="text"
                                                               value="${product.productDesc}"
                                                               name="productDesc"
                                                                />
                                                    </div>
                                                </div>

                                                <%-- <label class="col-sm-1 control-label"
                                                        for="productImgUrl">图片路径</label>

                                                 <div class="col-sm-5">
                                                     <input class="form-control" id="productImgUrl" type="text"
                                                            value="${product.productImgUrl}"
                                                            name="productImgUrl"/>
                                                 </div>--%>
                                                <%-- <label class="col-sm-1 control-label" for="onLineDate">上线日期</label>

                                                 <div class="col-sm-5">
                                                     <input class="form-control" id="onLineDate" type="date"
                                                            name="onLineDate"
                                                            value="${product.onLineDate}"
                                                             />
                                                 </div>--%>

                                                <div class="form-group">

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">主页显示</label>

                                                    <div class="col-sm-5">
                                                        <form:select id="showInMainPage" path="product.showInMainPage"
                                                                     cssClass="form-control"
                                                                     itemValue="${product.showInMainPage}">
                                                            <form:option value="1">是</form:option>
                                                            <form:option value="0">否</form:option>
                                                        </form:select>
                                                    </div>
                                                    <label for="sortNo" class="col-sm-1 control-label">排列顺序</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="sortNo" type="number"
                                                               name="sortNo"
                                                               value="${product.sortNo}"/>

                                                        <input class="form-control" id="productImgUrl" type="hidden"
                                                               name="productImgUrl"
                                                               value="${product.productImgUrl}"/>
                                                    </div>
                                                </div>


                                                <div class="form-group">

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">是否上线</label>

                                                    <div class="col-sm-5">

                                                        <form:select id="online" path="product.online"
                                                                     cssClass="form-control"
                                                                     itemValue="${product.online}">
                                                            <form:option value="1">是</form:option>
                                                            <form:option value="0">否</form:option>
                                                        </form:select>
                                                    </div>

                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">产品类型</label>

                                                    <div class="col-sm-5">
                                                        <select class="form-control" id="productType"
                                                                name="productType.id">
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
            </div>
            <!-- /CONTENT-->
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
        // App.setPage("forms");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- /JAVASCRIPTS -->

<script type="text/javascript">
    $(function () {
        /*    */
        /**
         * 提交上传文件
         * */
        /*
         $("#submit").on("click", function (data) {
         var fullName = $("#file").val();
         $("#uploadForm").attr("action", url);
         $("#uploadForm").submit();

         });

         $("#file").on("change", function () {
         $("#fileName").val((getFileName($(this).val())));
         });


         */
        /**
         * 获取文件名称
         * */
        /*
         function getFileName(o) {
         var pos = o.lastIndexOf("\\");
         return o.substring(pos + 1);
         }*/

        /*$(":button").on("click", function () {
         var productName = $("#productName").val();
         var productDesc = $("#productDesc").val();
         var productImgUrl = $("#productImgUrl").val();
         var onLineDate = $("#onLineDate").val();
         var online = $("#online").val();
         var productType = $("#productType").val();
         var showInMainPage = $("#showInMainPage").val();
         var sortNo = $("#sortNo").val();
         var objId = $("#objId").val();


         var product = {
         productName: productName,
         productDesc: productDesc,
         productImgUrl: productImgUrl,
         productType: productType,
         showInMainPage: showInMainPage,
         onLineDate: onLineDate,
         online: online,
         sortNo: sortNo

         }
         console.log("product---" + JSON.stringify(product));
         var url = "/back/product/update";
         $.post(url, {"product": product, "objId": objId}, function (data) {


         })
         });*/

    })
</script>


</body>
</html>
