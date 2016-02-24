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
                                    <a type="button" class="btn btn-default btn-mini navbar-btn" href="/back/news/index">信息列表 </a>
                                    <form class="form-horizontal" role="form" action="/back/news/update" method="POST">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                  <input class="form-control" id="objId" type="hidden" name="objId" value="${news.id}" required/>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="newsTitle">新闻标题</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="newsTitle" type="text" name="newsTitle" value="${news.newsTitle}" required/>
                                                    </div>

                                                    <label class="col-sm-2 control-label" for="newsDesc">新闻描述</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="newsDesc" type="text" name="newsDesc" value="${news.newsDesc}" required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="keywords">关键字</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="keywords" type="text" name="keywords" value="${news.keywords}" required/>
                                                    </div>

                                                    <label class="col-sm-2 control-label" for="status">状态</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="status" type="text" name="status" value="${news.status}" required/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="newsContent">新闻内容</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="newsContent" type="text" name="newsContent" value="${news.newsContent}" required/>
                                                    </div>

                                                    <label class="col-sm-2 control-label" for="imgUrl">图片路径</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="imgUrl" type="text" name="imgUrl" value="${news.imgUrl}" required/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="publishTime">发布时间</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="publishTime" type="date" name="publishTime" value="${news.publishTime}" required/>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <a class="btn btn-default" href="/back/news/index">关闭</a>
                                                    <button type="submit" id="save${news.id}" name="saveBtn" class="btn btn-primary">保存
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
