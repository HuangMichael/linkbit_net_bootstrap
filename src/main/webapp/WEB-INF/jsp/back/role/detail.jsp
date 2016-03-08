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
                                    <a type="button" class="btn btn-default btn-mini navbar-btn"
                                       href="/back/role/index">信息列表 </a>
                                    <button type="button" class="btn btn-default btn-mini navbar-btn"
                                            data-toggle="modal"
                                            data-target="#addUsers">添加用户
                                    </button>
                                    <form class="form-horizontal" role="form" action="/back/role/update" method="post">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <input class="form-control" id="objId" type="hidden" name="objId"
                                                       value="${role.id}" readonly/>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="roleName">角色名称</label>

                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="roleName" type="text"
                                                               name="roleName" value="${role.roleName}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="roleDesc">角色名称</label>

                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="roleDesc" type="text"
                                                               name="roleDesc" value="${role.roleDesc}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="status">是否启用</label>

                                                    <div class="col-sm-8">
                                                        <form:select id="status" path="role.status"
                                                                     cssClass="form-control" itemValue="${role.status}">
                                                            <form:option value="1">是</form:option>
                                                            <form:option value="0">否</form:option>
                                                        </form:select>

                                                    </div>
                                                </div>
                                            </div>
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

    <div class="modal fade" id="addUsers" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document" style="width: 800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">请选择用户</h4>
                    <input type="hidden" id="roleId" name="roleId" value="${role.id}">
                </div>
                <div class="modal-body">
                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                           class="datatable table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">序号</th>
                            <td class="center"><input type="checkbox" value=""/></td>
                            <th class="center">用户名</th>
                            <th class="center">姓名</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach items="${usersList}" var="user" varStatus="status">
                            <tr class="gradeX" id="tr${user.id}">
                                <td class="center">${status.index+1}</td>
                                <td class="center"><input type="checkbox" name="ids" value="${user.id}"></td>
                                <td class=" center">${user.userName}</td>
                                <td class=" center">${user.personName}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="choose" name="createBtn"
                            class="btn btn-primary">选择
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
        App.setPage("dynamic_table");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });


    /**
     * 获取所有选中checkbox 的值
     * */

    function getAllCheckedValues() {
        var tempValue = "";
        $(':checkbox[name=ids]:checked').each(function (i) {
            if (0 == i) {
                tempValue = $(this).val();
            } else {
                tempValue += ("," + $(this).val());
            }
        });
        return tempValue;

    }

    $("#choose").on("click", function () {
        var ids = getAllCheckedValues();
        if (!ids) {
            $.bootstrapGrowl("请先选择用户再进行添加！", {
                type: 'danger',
                align: 'right',
                stackup_spacing: 30
            });
            return;
        }

        var roleId = $("#roleId").val();

        $.ajax({
            type: "POST",
            url: "/back/role/choose",
            data: {"ids": ids,"roleId":roleId},
            success: function (msg) {
                $("#addUsers").modal('hide');
                $.bootstrapGrowl("用户角色添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $.bootstrapGrowl("用户角色添加失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    })

    //$("#txt_spCodes").val(tempValue);


</script>


</body>
</html>
