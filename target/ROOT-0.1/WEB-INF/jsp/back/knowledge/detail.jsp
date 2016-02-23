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
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">文章名称</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text" placeholder="192.168.1.161" value="${knowledge.title}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">关键字</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="text" placeholder="msh"  value="${knowledge.keywords}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="productImgUrl">发布者</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productImgUrl" type="text" placeholder="root" value="${knowledge.publisher}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="publishTime">发布时间</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="publishTime" type="date" placeholder="123456" value="${product.publishTime}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">

                                                    <label for="display"  class="col-sm-1 control-label">是否显示</label>
                                                    <div class="col-sm-5">
                                                        <select id="display" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>

                                                    <label for="showInMainPage"  class="col-sm-1 control-label">主页显示</label>
                                                    <div class="col-sm-5">
                                                        <select id="showInMainPage" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
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
