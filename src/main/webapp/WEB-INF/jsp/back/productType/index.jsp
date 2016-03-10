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
                    <%@include file="../common/banner.jsp" %>
                    <!-- TABLE IN MODAL -->
                    <!-- EXPORT TABLES -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <%@include file="../common/menu.jsp" %>
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
                                            <th class="center">产品类型名称</th>
                                            <th class="center">是否启用</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${productTypeList}" var="productType" varStatus="status">
                                            <tr class="gradeX" id="tr${productType.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a
                                                        href="/back/productType/detail/${productType.id}">${productType.typeName}</a>
                                                </td>
                                                <td class="center">
                                                    <c:if test="${productType.status==1}">是</c:if>
                                                    <c:if test="${productType.status!=1}">否</c:if>
                                                </td>
                                                <td class="center "><a href="/back/productType/edit/${productType.id}">编辑</a>
                                                </td>
                                                <td class="center "><a id="delBtn${productType.id}">删除</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
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
                </div>
                <!-- /CONTENT-->
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
                    <h4 class="modal-title" id="myModalLabel2">新建产品类型信息</h4>
                </div>
                <div class="modal-body">
                    <form id="productCreateForm" id="createForm">
                        <div class="form-group">
                            <label for="typeName">产品类型名称</label>
                            <input type="text" class="form-control"
                                   id="typeName"
                                   name="productType.typeName" required>
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
        var typeName = $("#typeName").val();
        var status = $("#status").val();
        var productType = {
            typeName: typeName,
            status: status
        };
        $.ajax({
            type: "POST",
            url: "/back/productType/save",
            data: productType,
            success: function (msg) {
                $("#createModal").modal('hide');
                addRow(msg);
                $.bootstrapGrowl("产品类型信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("产品类型信息添加失败！", {
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
        if (confirm("确定删除该记录么？")) {
            $.ajax({
                type: "POST",
                url: "/back/productType/delete/" + id,
                success: function () {
                    $("#tr" + id).fadeOut("slow");
                    $.bootstrapGrowl("产品类型信息删除成功！", {
                        type: 'info',
                        align: 'right',
                        stackup_spacing: 30
                    });
                },
                error: function () {
                    $("#tr" + id).fadeOut("slow");
                    $.bootstrapGrowl("产品类型信息删除失败！", {
                        type: 'info',
                        align: 'right',
                        stackup_spacing: 30
                    });
                }
            });
        }

    });
    var addRow = function (msg) {
        var html = '<tr class="gradeX even" id="tr' + msg.id + '">';
        html += '<td class="center  sorting_1">' + 1 + '</td> ';
        html += '<td class="center "><a href="/back/productType/detail/2">' + msg.typeName + '</a> </td>';
        html += '<td class="center ">是</td><td class="center  "><a href="/back/productType/edit/' + msg.id + '">编辑</a></td>';
        html += '<td class="center  "><a id="delBtn' + msg.id + '">删除</a></td>'
        html += ' </tr>';
        $("#tbody").prepend(html);
        $("#tbody tr").each(function (index, element) {
            $(element).children().eq(0).html((index+1));
        });
    };


</script>
<!-- /JAVASCRIPTS -->
</body>
</html>
