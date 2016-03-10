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
                                   <%-- <%@include file="../common/menuBar.jsp" %>--%>
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="${product.productImgUrl}" width="200px"/>
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">产品名称</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text"
                                                               value="${product.productName}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="productDesc">产品描述</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productDesc" type="text"
                                                               value="${product.productDesc}"
                                                               readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="onLineDate">上线日期</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="onLineDate" type="date"
                                                               value="${product.onLineDate}"
                                                               readonly/>
                                                    </div>
                                                    <label for="showInMainPage"
                                                           class="col-sm-1 control-label">主页显示</label>

                                                    <div class="col-sm-5">
                                                        <select id="showInMainPage" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label for="sortNo" class="col-sm-1 control-label">排列顺序</label>

                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="sortNo" type="number"
                                                               value="${product.sortNo}" readonly/>
                                                    </div>

                                                    <label for="onLine" class="col-sm-1 control-label">是否上线</label>

                                                    <div class="col-sm-5">
                                                        <select id="onLine" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <form id="uploadForm" method="post" class="form-horizontal" role="form"
                                          enctype="multipart/form-data" id="uploadForm" action="/back/product/upload">
                                        <div class="form-group">
                                            <input type="hidden" name="productId" id="productId" value="${product.id}"/>
                                            <input type="hidden" name="fileName" id="fileName"/>
                                            <label class="col-sm-1 control-label" for="file">上传图片</label>

                                            <div class="col-sm-6">
                                                <input type="file" class="form-control" name="file" id="file" required>
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="submit" value="上传" id="submit"
                                                       class="form-control btn-primary">
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <div class="box-title">
                                    <h4><i class="fa fa-table"></i>产品属性</h4>
                                </div>

                                <div class="box-body">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>属性名称</th>
                                            <th>属性描述</th>
                                            <th>是否显示</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${product.productCharactorSet}" var="p"
                                                   varStatus="status">
                                            <tr id="tr${p.id}">
                                                <td>${status.index+1}</td>
                                                <td>${p.charactorName}</td>
                                                <td>${p.charactorDesc}</td>
                                                <td>
                                                    <c:if test="${p.status}">是</c:if>
                                                    <c:if test="${!p.status}">否</c:if>
                                                </td>
                                                <td><a name="delBtn" id="delBtn${p.id}" data-pid="${p.id}">删除</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /BOX -->
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
                <form id="productCreateForm" id="createForm">
                    <div class="form-group">
                        <input type="hidden" class="form-control"
                               id="pid"
                               name="pid" value="${product.id}">
                        <label for="charactorName">产品属性名称</label>
                        <input type="text" class="form-control"
                               id="charactorName"
                               name="charactorDesc" required>
                    </div>
                    <div class="form-group">
                        <label for="charactorDesc">产品属性描述</label>
                        <input type="text" class="form-control"
                               id="charactorDesc"
                               name="charactorDesc" required>
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


<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        /* App.setPage("forms");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- /JAVASCRIPTS -->

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

    });


    //更新操作
    $("#create").click(function () {
        var id = $(this).attr("id").substring(4);
        var charactorName = $("#charactorName").val();
        var charactorDesc = $("#charactorDesc").val();
        var pid = $("#pid").val();

        /*var productCharactor = {
         charactorName: charactorName,
         charactorDesc: charactorDesc
         };*/
        // console.log("productCharactor--------------------"+JSON.stringify(productCharactor));
        $.ajax({
            type: "POST",
            url: "/back/productCharactor/save",
            data: {charactorName: charactorName, charactorDesc: charactorDesc, pid: pid},
            success: function (msg) {
                $("#createModal").modal('hide');
                /*    App.init();*/
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

    $("a[name^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);
        console.log("id--------------------" + id);
        $.ajax({
            type: "POST",
            url: "/back/productCharactor/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("产品属性信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("产品属性信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });

</script>


</body>
</html>
