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
                                    <a type="button" class="btn btn-default btn-mini navbar-btn" href="/back/sysconfig/index">信息列表 </a>
                                    <form class="form-horizontal" role="form" action="/back/sysconfig/update" method="post">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                  <input class="form-control" id="objId" type="hidden" name="objId" value="${sysConfig.id}" required/>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="paraName">参数名称</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="paraName" type="text" name="paraName" value="${sysConfig.paraName}" required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="paraDesc">描述</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="paraDesc" type="text" name="paraDesc" value="${sysConfig.paraDesc}" required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="paraValue">参数值</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="paraValue" type="text" name="paraValue" value="${sysConfig.paraValue}" required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="status">使用状态</label>
                                                    <div class="col-sm-8">
                                                        <%--
                                                                                                                <input class="form-control" id="status" type="text" name="status" value="${sysConfig.status}" required/>
                                                        --%>
                                                        <form:select id="status"  path="sysConfig.status" cssClass="form-control"
                                                                     itemValue="${sysConfig.status}">
                                                            <form:option value="1"  >是</form:option>
                                                            <form:option value="0" >否</form:option>
                                                        </form:select>

                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <a class="btn btn-default" href="/back/sysconfig/index">关闭</a>
                                                    <button type="submit" id="save${product.id}" name="saveBtn" class="btn btn-primary">保存
                                                    </button>
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

<script type="text/javascript">
    $(function () {




    })
</script>


</body>
</html>
