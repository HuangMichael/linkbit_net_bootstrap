<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css" />
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
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="/front/images/user/user.jpg"  class="img-responsive img-rounded img-thumbnail" width="200px" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host"> 留言人</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text" placeholder="192.168.1.161" value="${message.userName}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">邮箱</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="email" placeholder="msh"  value="${message.email}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="telephone">电话</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="telephone" type="text" placeholder="root" value="${message.telephone}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="onLineDate">工作单位</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="onLineDate" type="text" placeholder="123456" value="${message.workplace}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="messageTime"  class="col-sm-1 control-label">留言时间</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="messageTime" type="datetime"  value="${message.messageTime}" readonly/>
                                                    </div>
                                                    <label for="status"  class="col-sm-1 control-label">状态</label>
                                                    <div class="col-sm-5">
                                                        <select id="status" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="messageTime"  class="col-sm-1 control-label">留言内容</label>
                                                    <div class="col-sm-11">
                                                        <input class="form-control" id="content11" type="text"  value="${message.content}" readonly/>
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

</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        /* App.setPage("forms");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });
</script><!-- /JAVASCRIPTS -->
</body>
</html>
