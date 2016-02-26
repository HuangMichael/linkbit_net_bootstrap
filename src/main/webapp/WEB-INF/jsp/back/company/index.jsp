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
                                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                                           class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">公司名称</th>
                                            <th class="center">logo地址</th>
                                            <th class="center">公司地址</th>
                                            <th class="center">电话</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${companyList}" var="company" varStatus="status">
                                            <tr class="gradeX" id="tr${company.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a href="/back/company/detail/${company.id}">${company.companyName}</a></td>
                                                <td class="center">${company.logoPath}</td>
                                                <td class="center">${company.address}</td>
                                                <td class="center">${company.telephone}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">公司名称</th>
                                            <th class="center hidden-xs">logo地址</th>
                                            <th class="center">公司地址</th>
                                            <th class="center hidden-xs">电话</th>
                                        </tr>
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
                $.bootstrapGrowl("客户信息保存成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });

            },
            error: function () {
                $.bootstrapGrowl("客户信息保存失败！", {
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
                $.bootstrapGrowl("客户信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("客户信息删除成功！", {
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
