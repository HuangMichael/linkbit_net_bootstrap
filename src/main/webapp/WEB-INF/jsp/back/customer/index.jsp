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
                                            <th class="center">客户名称</th>
                                            <th class="center ">联系电话</th>
                                            <th class="center hidden-xs">主页显示</th>
                                            <th class="center hidden-xs">使用状态</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${customerList}" var="customer" varStatus="status">
                                            <tr class="gradeX" id="tr${customer.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a
                                                        href="/back/customer/detail/${customer.id}">${customer.customerName}</a>
                                                </td>
                                                <td class=" center ">${customer.telephone}</td>

                                                <td class="center hidden-xs"><c:if
                                                        test="${customer.showInMainPage}">是</c:if>
                                                    <c:if test="${!customer.showInMainPage}">否</c:if></td>
                                                <td class="center hidden-xs"><c:if test="${customer.status}">是</c:if>
                                                    <c:if test="${!customer.status}">否</c:if></td>
                                                <td class="center "><a href="/back/customer/edit/${customer.id}">编辑</a>
                                                </td>
                                                <td class="center "><a id="delBtn${customer.id}">删除</a>
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
                    <h4 class="modal-title" id="myModalLabel2">新建客户信息</h4>
                </div>
                <div class="modal-body">
                    <form id="productCreateForm">
                        <div class="form-group">
                            <label for="customerName">客户名称</label>
                            <input type="text" class="form-control"
                                   id="customerName"
                                   name="customerName" required>
                        </div>

                        <div class="form-group">
                            <label for="address">客户地址</label>
                            <input type="text" class="form-control"
                                   id="address"
                                   name="address" required>
                        </div>

                        <div class="form-group">
                            <label for="telephone">联系电话</label>
                            <input type="text" class="form-control"
                                   id="telephone"
                                   name="telephone" required>
                        </div>


                        <div class="form-group">
                            <label for="fax">传真</label>
                            <input type="text" class="form-control"
                                   id="fax"
                                   name="fax" required>
                        </div>

                        <div class="form-group">
                            <label for="mainPage">公司主页</label>
                            <input type="text" class="form-control"
                                   id="mainPage"
                                   name="mainPage" required>
                        </div>

                        <div class="form-group">
                            <label for="fax">是否启用</label>
                            <select class="form-control" name="status" id="status" required>
                                <option value="">请选择</option>
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="fax">主页显示</label>
                            <select class="form-control" name="showInMainPage" id="showInMainPage" required>
                                <option value="">请选择</option>
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
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
        var customerName = $("#customerName").val();
        var address = $("#address").val();
        var telephone = $("#telephone").val();
        var mainPage = $("#mainPage").val();
        var fax = $("#fax").val();
        var showInMainPage = $("#showInMainPage").val();
        var status = $("#status").val();
        var customer = {

            customerName: customerName,
            address: address,
            telephone: telephone,
            fax: fax,
            status: status,
            mainPage: mainPage,
            showInMainPage: showInMainPage

        };
        $.ajax({
            type: "POST",
            url: "/back/customer/save",
            data: customer,
            success: function (msg) {
                $("#createModal").modal('hide');
                addRow(customer);
                $.bootstrapGrowl("客户信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("客户信息添加失败！", {
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
    //删除操作

    $("a[id^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);
        $.ajax({
            type: "POST",
            url: "/back/customer/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("客户信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("客户信息删除失败！", {
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
