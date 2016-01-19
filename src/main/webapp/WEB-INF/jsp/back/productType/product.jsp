<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
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
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-header">
                                <!-- BREADCRUMBS -->
                                <ul class="breadcrumb">
                                    <li>
                                        <i class="fa fa-home"></i>
                                        <a href="/back/index">后台管理系统</a>
                                    </li>
                                    <li>产品信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- TABLE IN MODAL -->
                    <!-- EXPORT TABLES -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <div class="box-title">
                                    <h4><i class="fa fa-table"></i>产品信息</h4>

                                    <div class="tools hidden-xs">
                                        <a href="#box-config" data-toggle="modal" class="config">
                                            <i class="fa fa-cog"></i>
                                        </a>
                                        <a href="javascript:;" class="reload">
                                            <i class="fa fa-refresh"></i>
                                        </a>
                                        <a href="javascript:;" class="collapse">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a href="javascript:;" class="remove">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                                           class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>产品名称</th>
                                            <th class="hidden-xs">产品类型</th>
                                            <th>上市时间</th>
                                            <th class="hidden-xs">商品描述</th>
                                            <th class="hidden-xs">编辑</th>
                                            <th class="hidden-xs">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${productList}" var="product" varStatus="status">
                                            <tr class="gradeX">
                                                <td>${status.index+1}</td>
                                                <td><a href="#" data-toggle="modal"
                                                       data-target="#myModal${product.id}">${product.productName}</a>
                                                </td>
                                                <td class="hidden-xs">${product.productType}</td>
                                                <td class="center hidden-xs">${product.onLineDate}</td>
                                                <td class="center">${product.productDesc}</td>
                                                <td class="center">编辑</td>
                                                <td class="center">删除</td>
                                            </tr>
                                            <div class="modal fade" id="myModal${product.id}" tabindex="-1"
                                                 role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close"><span
                                                                    aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">产品信息明细</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form id="productForm${product.id}">
                                                                <div class="form-group">
                                                                    <label for="productName${product.id}">产品名称</label>
                                                                    <input type="text" class="form-control"
                                                                           id="productName${product.id}"
                                                                           name="product.productName"
                                                                           value="${product.productName}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="productType${product.id}">产品类型</label>
                                                                    <select class="form-control"
                                                                            id="productType${product.id}"
                                                                            name="product.productType">
                                                                        <option value="1">PDA</option>
                                                                        <option value="2">手机</option>
                                                                        <option value="3">导航仪</option>
                                                                        <option value="4">指挥机</option>
                                                                        <option value="5">手表</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="productDesc${product.id}">产品描述</label>
                                                                    <input type="text" class="form-control"
                                                                           id="productDesc${product.id}"
                                                                           name="product.productDesc"
                                                                           value="${product.productDesc}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="onLineDate${product.id}">上线日期</label>
                                                                    <input type="date" class="form-control"
                                                                           id="onLineDate${product.id}"
                                                                           name="product.onLineDate"
                                                                           value="${product.onLineDate}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="exampleInputFile">产品图片</label>
                                                                    <input type="file" id="exampleInputFile">

                                                                    <p class="help-block">上传一张产品图片吧</p>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" id="online${product.id}"
                                                                               name="product.online"
                                                                               value="${product.online}"> 是否显示
                                                                    </label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default"
                                                                    data-dismiss="modal">关闭
                                                            </button>
                                                            <button type="submit" id="save${product.id}" name="saveBtn"
                                                                    class="btn btn-primary">保存
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>序号</th>
                                            <th>产品名称</th>
                                            <th class="hidden-xs">产品类型</th>
                                            <th>上市时间</th>
                                            <th class="hidden-xs">商品描述</th>
                                            <th class="hidden-xs">编辑</th>
                                            <th class="hidden-xs">删除</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <!-- /BOX -->
                        </div>
                    </div>
                    <!-- /EXPORT TABLES -->
                    <div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
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
        App.setPage("dynamic_table");  //Set current page
        App.init(); //Initialise plugins and elements
    });
    $(":submit").click(function () {
        var id = $(this).attr("id").substring(4);
        var productName = $("#productName" + id).val();
        var productDesc = $("#productDesc" + id).val();
        var productType = "1";
        var onlineDate = $("#onlineDate" + id).val();
        var online = $("#online" + id).val();


        var product = new Object();
        product.productName = productName;
        product.productDesc = productDesc;
        product.productType = productType;
        product.onlineDate = onlineDate;
        product.online = online;


        $.ajax({
            type: "POST",
            url: "/back/product/save",
            data: product,
            success: function (msg) {
                $("#myModal" + id).modal('hide');
            },
            error: function () {
                alert("failure");
            }
        });
    });

</script><!-- /JAVASCRIPTS -->
</body>
</html>
