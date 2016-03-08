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
                                            <th class="center">留言人</th>
                                            <th class="center">留言内容</th>
                                            <th class="center hidden-xs">邮箱</th>
                                            <th class="center">电话</th>
                                            <th class="center hidden-xs">留言时间</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${messageList}" var="message" varStatus="status">
                                            <tr class="gradeX" id="tr${message.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a href="/back/message/detail/${message.id}">${message.userName}</a></td>
                                                <td class="center">${message.content}</td>
                                                <td class=" center hidden-xs">${message.email}</td>
                                                <td class="center hidden-xs">${message.telephone}</td>
                                                <td class="center"><fmt:formatDate value="${message.messageTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                       <%-- <tfoot>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">留言人</th>
                                            <th class="center">留言内容</th>
                                            <th class="center hidden-xs">邮箱</th>
                                            <th class="center">电话</th>
                                            <th class="center hidden-xs">留言时间</th>
                                        </tr>
                                        </tfoot>--%>
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

    $("a[id^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);
        $.ajax({
            type: "POST",
            url: "/back/message/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("留言信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("留言信息删除失败！", {
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
