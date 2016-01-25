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
        <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
        <div class="container">
            <div class="row">
                <div id="content" class="col-lg-12">
                    <!-- PAGE HEADER-->
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
                    <!-- /PAGE HEADER -->
                    <!-- USER PROFILE -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border">
                                <div class="box-title">
                                    <h4><i class="fa fa-user"></i><span
                                            class="hidden-inline-mobile">${product.productName}</span></h4>
                                </div>
                                <div class="box-body">
                                    <div class="tabbable header-tabs user-profile">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#pro_overview" data-toggle="tab"><i
                                                    class="fa fa-dot-circle-o"></i> <span class="hidden-inline-mobile">信息预览</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <!-- OVERVIEW -->
                                            <div class="tab-pane fade in active" id="pro_overview">
                                                <div class="row">
                                                    <!-- PROFILE PIC -->
                                                    <div class="col-md-3">
                                                        <div class="list-group">
                                                            <li class="list-group-item zero-padding">
                                                                <img alt="" class="img-responsive" width="80%"
                                                                     height="80%"
                                                                     src="${product.productImgUrl}">
                                                            </li>
                                                            <div class="list-group-item profile-details">
                                                                <p>
                                                                    ${product.productDesc}
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /PROFILE PIC -->
                                                    <!-- PROFILE DETAILS -->
                                                    <div class="col-md-9">
                                                        <!-- ROW 1 -->
                                                        <div class="row">
                                                            <div class="col-md-12 profile-details">
                                                                <div class="row">
                                                                    <div class="box-body">
                                                                        <button type="button"
                                                                                class="btn btn-default btn-mini navbar-btn"
                                                                                data-toggle="modal"
                                                                                data-target="#createModal">新建记录
                                                                        </button>
                                                                        <table id="datatable2" cellpadding="0"
                                                                               cellspacing="0" border="0"
                                                                               class="datatable table table-striped table-bordered table-hover">
                                                                            <thead>
                                                                            <tr>
                                                                                <th class="center">序号</th>
                                                                                <th class="center hidden-xs">属性标题</th>
                                                                                <th class="center">属性状态</th>
                                                                                <th class="center ">编辑</th>
                                                                                <th class="center ">删除</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody id="tbody">
                                                                            <c:forEach
                                                                                    items="${product.productCharactorSet}"
                                                                                    var="property" varStatus="status">
                                                                                <tr class="gradeX"
                                                                                    id="tr${property.id}">
                                                                                    <td class="center">${status.index+1}</td>
                                                                                    <td class="center  hidden-xs">${property.charactorDesc}</td>
                                                                                    <td class="center">${property.status}</td>
                                                                                    <td class="center "><a href="#"
                                                                                                           data-toggle="modal"
                                                                                                           data-target="#myModal${property.id}">编辑</a>
                                                                                    </td>
                                                                                    <td class="center "><a
                                                                                            id="delBtn${property.id}"
                                                                                    >删除</a>
                                                                                    </td>
                                                                                </tr>
                                                                                <div class="modal fade"
                                                                                     id="myModal${property.id}"
                                                                                     tabindex="-1"
                                                                                     role="dialog"
                                                                                     aria-labelledby="myModalLabel">
                                                                                    <div class="modal-dialog"
                                                                                         role="document">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <button type="button"
                                                                                                        class="close"
                                                                                                        data-dismiss="modal"
                                                                                                        aria-label="Close"><span
                                                                                                        aria-hidden="true">&times;</span>
                                                                                                </button>
                                                                                                <h4 class="modal-title"
                                                                                                    id="myModalLabel">
                                                                                                    产品属性信息</h4>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <form id="productForm${property.id}">
                                                                                                    <div class="form-group">
                                                                                                        <label for="productName${property.id}">属性描述</label>
                                                                                                        <input type="text"
                                                                                                               class="form-control"
                                                                                                               id="productName${property.id}"
                                                                                                               name="product.productName"
                                                                                                               value="${property.charactorDesc}">
                                                                                                    </div>

                                                                                                        <%-- <div class="form-group">
                                                                                                             <label for="exampleInputFile">产品图片</label>
                                                                                                             <input type="file"
                                                                                                                    id="exampleInputFile">

                                                                                                             <p class="help-block">
                                                                                                                 上传一张产品图片吧</p>
                                                                                                         </div>--%>
                                                                                                    <div class="checkbox">
                                                                                                        <label>
                                                                                                            <input type="checkbox"
                                                                                                                   id="online${product.id}"
                                                                                                                   name="product.online"
                                                                                                                   value="${product.online}">
                                                                                                            是否显示
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <button type="button"
                                                                                                        class="btn btn-default"
                                                                                                        data-dismiss="modal">
                                                                                                    关闭
                                                                                                </button>
                                                                                                <button type="submit"
                                                                                                        id="save${product.id}"
                                                                                                        name="saveBtn"
                                                                                                        class="btn btn-primary">
                                                                                                    保存
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
                                                                                <th class="center hidden-xs">属性标题</th>
                                                                                <th class="center ">属性状态</th>
                                                                                <th class="center ">编辑</th>
                                                                                <th class="center ">删除</th>
                                                                            </tr>
                                                                            </tfoot>
                                                                        </table>
                                                                    </div>


                                                                </div>
                                                                <div class="divide-20"></div>
                                                                <!-- BUTTONS -->
                                                                <div class="row">
                                                                    <c:forEach items="${company.companyPropertyList}"
                                                                               var="companyProperty">
                                                                        <div class="col-md-3">
                                                                            <a class="btn btn-danger btn-icon input-block-level"
                                                                               href="javascript:void(0);">
                                                                                <i class="fa fa-google-plus-square fa-2x"></i>

                                                                                <div>${companyProperty.title}</div>
                                                                                <span class="label label-right label-warning">4</span>
                                                                            </a>
                                                                        </div>
                                                                    </c:forEach>

                                                                </div>
                                                                <!-- /BUTTONS -->
                                                            </div>
                                                        </div>
                                                        <!-- /ROW 1 -->
                                                        <div class="divide-40"></div>
                                                    </div>
                                                    <!-- /PROFILE DETAILS -->
                                                </div>
                                            </div>
                                            <!-- /OVERVIEW -->
                                        </div>
                                    </div>
                                    <!-- /USER PROFILE -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> 回到顶部
							</span>
                    </div>
                </div><!-- /CONTENT-->
            </div>
        </div>
    </div>
</section>


<div class="modal fade" id="createModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">新建产品属性信息</h4>
            </div>
            <div class="modal-body">
                <form id="productCreateForm">
                    <div class="form-group">
                        <label for="charactorDesc">产品属性名称</label>
                        <input type="text" class="form-control"
                               id="charactorDesc"
                               name="productCharactor.charactorDesc">
                    </div>
                    <div class="form-group">
                        <label for="charactorDesc">产品名称</label>
                        <input type="text" class="form-control"
                               id="product.id"
                               name="productCharactor.product.id">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="submit" id="create" name="create${product.id}"
                        class="btn btn-primary">保存
                </button>
            </div>
        </div>
    </div>
</div>

<!--/PAGE -->
<%@include file="../common/footer.jsp" %>
<script>
    jQuery(document).ready(function () {
        /*  App.setPage("user_profile");  //Set current page
         App.init(); //Initialise plugins and elements*!/*/
    });

    var productId = ${product.id};
    //新建记录
    $("#create").click("submit", function () {
        var charactorDesc = $("#charactorDesc").val();

        var productCharactor = {"charactorDesc": charactorDesc};
        $.ajax({
            type: "POST",
            url: "/back/productCharactor/save",
            data: productCharactor,
            success: function (msg) {
                $("#createModal").modal('hide');
                loadAll("#tbody", productId);
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


    function loadAll(container, id) {
        $(container).html("");
        var url = "/back/product/findCharactorListById/" + id;
        $.getJSON(url, function (data) {
            for (var x in data) {
                var html = "<tr id='tr" + data[x].id + "'>";
                html += "<td class='center'>" + Number(x + 1) + "</td>";
                html += "<td class='center'>" + data[x].status + "</td>";
                html += "<td class='center hidden-xs'>" + data[x].charactorDesc + "</td>";
                html += "<td class='center'><a>编辑</a></td>";
                html += "<td class='center'><a>删除</a></td>";
                html += "</tr>";
                console.log(html);
                $(container).append(html);
            }
        });

    }

    /*
    //更新操作
    $(":submit").click(function () {
        var id = $(this).attr("id").substring(4);
        var productName = $("#productName" + id).val();
        var productDesc = $("#productDesc" + id).val();
        var productType = "1";
        var onlineDate = new Date();
        var online = $("#online" + id).val();


        var product = new Object();
        product.productName = productName;
        product.productDesc = productDesc;
        product.productType = productType;
        product.onlineDate = onlineDate;
        product.online = online;
        $.ajax({
            type: "POST",
            url: "/back/productCharactor/save",
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
     });*/


    //删除操作

    $("a[id^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);
        $.ajax({
            type: "POST",
            url: "/back/productCharactor/delete/" + id,
            success: function () {
               // $("#tr" + id).fadeOut("slow");
                loadAll("#tbody", productId);
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
</script>

<!-- /JAVASCRIPTS -->
</body>
</html>