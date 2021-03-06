<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <button type="button" class="btn btn-default btn-mini navbar-btn"
                                            data-toggle="modal"
                                            data-target="#createModal">新建记录
                                    </button>
                                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                                           class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">产品名称</th>
                                            <th class="center hidden-xs">产品类型</th>
                                            <th class="center">上市时间</th>
                                            <th class="center hidden-xs">商品描述</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${productList}" var="product" varStatus="status">
                                            <tr class="gradeX" id="tr${product.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a href="/back/product/detail/${product.id}">${product.productName}</a></td>
                                                <td class=" center hidden-xs">${product.productType.typeName}</td>
                                                <td class="center hidden-xs"><fmt:formatDate
                                                        value="${product.onLineDate}" pattern="yyyy-MM-dd"/></td>
                                                <td class="center">${product.productDesc}</td>
                                                <td class="center "><a href="#" data-toggle="modal"
                                                                       data-target="#myModal${product.id}">编辑</a></td>
                                                <td class="center "><a id="delBtn${product.id}">删除</a>
                                                </td>
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
                                            <th class="center">序号</th>
                                            <th class="center">产品名称</th>
                                            <th class="center hidden-xs">产品类型</th>
                                            <th class="center">上市时间</th>
                                            <th class="center hidden-xs">商品描述</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
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
								<i class="fa fa-chevron-up"></i>回到顶部
							</span>
                    </div>
                </div><!-- /CONTENT-->
            </div>
        </div>
    </div>


    <div class="modal fade" id="createModal" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">新建产品信息</h4>
                </div>
                <div class="modal-body">
                    <form id="productCreateForm">
                        <div class="form-group">
                            <label for="productName">产品名称</label>
                            <input type="text" class="form-control"
                                   id="productName"
                                   name="product.productName">
                        </div>
                        <div class="form-group">
                            <label for="productType">产品类型</label>
                            <select class="form-control"
                                    id="productType"
                                    name="product.productType">
                                <option value="1">PDA</option>
                                <option value="2">手机</option>
                                <option value="3">导航仪</option>
                                <option value="4">指挥机</option>
                                <option value="5">手表</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="productDesc">产品描述</label>
                            <input type="text" class="form-control"
                                   id="productDesc"
                                   name="product.productDesc"
                            >
                        </div>
                        <div class="form-group">
                            <label for="onLineDate">上线日期</label>

                            <div class="input-append date" id="onLineDate" data-date="12-02-2012"
                                 data-date-format="dd-mm-yyyy">
                                <input class="span2" size="16" type="text" value="12-02-2012">
                                <span class="add-on"><i class="icon-th"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">产品图片</label>
                            <input type="file" id="exampleInputFile2">

                            <p class="help-block">上传一张产品图片吧</p>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="online"
                                       name="product.online"
                                > 是否显示
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="create" name="createBtn"
                            class="btn btn-primary">保存
                    </button>
                </div>
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


    //新建记录
    $("#create").click(function () {
        var productName = $("#productName").val();
        var productDesc = $("#productDesc").val();
        var productType = "1";
        var onLineDate = new Date();
        var online = $("#online").val();
        var product = {};
        product.productName = productName;
        product.productDesc = productDesc;
        product.productType = productType;
        product.onLineDate = onLineDate;
        product.online = online;
        $.ajax({
            type: "POST",
            url: "/back/product/save",
            data: product,
            success: function (msg) {
                $("#createModal").modal('hide');
                addRow(product);
                $.bootstrapGrowl("产品信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("产品信息添加失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });


    var addRow = function (product) {
        var dateString = product.onLineDate.Format('yyyy-MM-dd');
        var html = '<tr class="gradeX">';
        html += '<td class="center">1</td>';
        html += '<td class ="center"><a href ="#" data-toggle="modal" data-target="#myModal" >' + product.productName + '</a></td>';
        html += '<td class= "center hidden-xs" >' + product.productType + '</td>';
        html += '<td class= "center hidden-xs" >' + dateString + ' </td>';
        html += '<td class = "center">' + product.productDesc + '</td>';
        html += '<td class = "center"><a href = "#" > 编辑 </a> </td>';
        html += '<td class  = "center"><a id = "delBtn">删除</a></td>';
        html += '</tr>';
        $("#tbody").prepend(html);
    };


    //更新操作
    $(":submit").click(function () {
        var id = $(this).attr("id").substring(4);
        var productName = $("#productName" + id).val();
        var productDesc = $("#productDesc" + id).val();
        var productType = "1";
        var onlineDate = new Date();
        var online = $("#online" + id).val();


        var product = {};
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
                $("#createModal" + id).modal('hide');
                $.bootstrapGrowl("产品信息保存成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });

            },
            error: function () {
                $.bootstrapGrowl("产品信息保存失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });


    //删除操作

    $("a[id^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);

        console.log("id------------------"+id);
        $.ajax({
            type: "POST",
            url: "/back/product/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("产品信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("产品信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });


    });




</script><!-- /JAVASCRIPTS -->
</body>
</html>
