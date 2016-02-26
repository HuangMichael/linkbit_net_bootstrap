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


                                    <a class="btn btn-default btn-mini navbar-btn">信息列表
                                    </a>
                                    <button type="button" class="btn btn-default btn-mini navbar-btn"
                                            data-toggle="modal"
                                            data-target="#createModal">新建记录
                                    </button>
                                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                                           class="datatable table table-striped table-bordered table-hover">
                                        <thead>

                                        <%-- private String userName;//用户名
                                         private String password;//密码
                                         private String imgUrl; //头像存放路径
                                         private String gender; //性别
                                         private String personName;//姓名
                                         private String email ;//电子邮箱
                                         private Date birthday;//出生日期--%>


                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">用户头像</th>
                                            <th class="center">用户名</th>
                                            <th class="center">姓名</th>
                                            <th class="center">性别</th>
                                            <th class="center">出生日期</th>
                                            <th class="center">用户状态</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${userList}" var="user" varStatus="status">
                                            <tr class="gradeX" id="tr${user.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class=" center"><img src="${user.imgUrl}" width="20px" height="20px"
                                                                         class="img-circle"/></td>
                                                <td class=" center">${user.userName}</td>
                                                <td class=" center">${user.personName}</td>
                                                <td class=" center">${user.gender}</td>
                                                <td class=" center">${user.birthday}</td>
                                                <td class=" center"><input type="checkbox" checked="${user.status}">
                                                </td>
                                                <td class="center "><a href="#" data-toggle="modal"
                                                                       data-target="#myModal${user.id}">编辑</a></td>
                                                <td class="center "><a id="delBtn${user.id}">删除</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">用户头像</th>
                                            <th class="center">用户名</th>
                                            <th class="center">姓名</th>
                                            <th class="center">性别</th>
                                            <th class="center">出生日期</th>
                                            <th class="center">用户状态</th>
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
                    <h4 class="modal-title" id="myModalLabel2">新建用户信息</h4>
                </div>


                <%--private String userName;//用户名
                private String password;//密码
                private String imgUrl; //头像存放路径
                private String gender; //性别
                private String personName;//姓名
                private String email ;//电子邮箱
                private Date birthday;//出生日期
                private String status;//用户状态--%>


                <div class="modal-body">
                    <form id="productCreateForm">
                        <div class="form-group">
                            <label for="userName">用户名</label>
                            <input type="text" class="form-control"
                                   id="userName"
                                   name="user.userName">
                        </div>
                        <div class="form-group">
                            <label for="status">用户状态</label>
                            <select class="form-control"
                                    id="status"
                                    name="user.status">
                                <option value="1" selected>启用</option>
                                <option value="0">禁用</option>
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
        var userName = $("#userName").val();
        var status = $("#status").val();

        var user = {

            userName: userName,
            status: status
        };
        $.ajax({
            type: "POST",
            url: "/back/user/save",
            data: user,
            success: function (msg) {
                $("#createModal").modal('hide');
               // addRow(user);
                $.bootstrapGrowl("用户信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("用户信息添加失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });


    /*var addRow = function (product) {
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
    }*/


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
            url: "/back/user/save",
            data: product,
            success: function (msg) {
                $("#createModal" + id).modal('hide');
                $.bootstrapGrowl("用户信息保存成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });

            },
            error: function () {
                $.bootstrapGrowl("用户信息保存失败！", {
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
        $.ajax({
            type: "POST",
            url: "/back/user/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("用户信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("用户信息删除成功！", {
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
