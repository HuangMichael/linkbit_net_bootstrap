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
                                                <img src="${news.imgUrl}" width="200px" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="newsTitle">新闻标题</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="newsTitle" type="text"  value="${news.newsTitle}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="productDesc">新闻描述</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productDesc" type="text"  value="${news.newsDesc}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="keywords">关键字</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="keywords" type="text" value="${news.keywords}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="status">状态</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="status" type="text" placeholder="123456" value="${news.status}" readonly/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="productImgUrl">图片路径</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productImgUrl" type="text" placeholder="root" value="${news.imgUrl}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="publishTime">发布时间</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="publishTime" type="date" placeholder="123456" value="${news.publishTime}" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="uploadForm" method="post" class="form-horizontal" role="form"
                                          enctype="multipart/form-data" id="uploadForm" action="/back/news/upload">
                                           <div class="form-group">
                                               <input type="hidden" name="newsId" id="newsId" value="${news.id}"/>
                                               <input type="hidden" name="fileName" id="fileName"/>
                                               <label class="col-sm-1 control-label" for="file">上传图片</label>

                                               <div class="col-sm-6">
                                                  <input type="file" class="form-control" name="file" id="file" required>
                                               </div>
                                               <div class="col-sm-1">
                                                   <input type="submit" value="上传" id="submit" class="form-control btn-primary">
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
        /**
         * 提交上传文件
         * */
        $("#submit").on("click", function (data) {
            var fullName = $("#file").val();
            $("#uploadForm").attr("action", url);
            $("#uploadForm").submit();

        });

        $("#file").on("change", function () {
            $("#fileName").val((getFileName($(this).val())));
        });


        /**
         * 获取文件名称
         * */
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
                }


    })
</script>


</body>
</html>
