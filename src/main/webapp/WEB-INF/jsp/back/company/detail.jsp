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
                                                <img src="${company.logoPath}" width="200px" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">公司名称</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text" placeholder="192.168.1.161" value="${company.companyName}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">公司地址</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="text" placeholder="msh"  value="${company.address}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="longtitude">维度</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="longtitude" type="text" placeholder="root" value="${company.longtitude}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="latitude">经度</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="latitude" type="text" placeholder="123456" value="${company.latitude}" readonly/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="telephone">电话</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="telephone" type="text" placeholder="root" value="${company.telephone}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="fax">传真</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="fax" type="text" placeholder="123456" value="${company.fax}" readonly/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="buildDate">成立日期</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="buildDate" type="date" placeholder="root" value="${company.buildDate}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="status">状态</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="status" type="text" placeholder="123456" value="${company.status}" readonly/>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                    <form id="uploadForm" method="post" class="form-horizontal" role="form"
                                          enctype="multipart/form-data" id="uploadForm" action="/back/company/upload">
                                           <div class="form-group">
                                               <input type="hidden" name="companyId" id="companyId" value="${company.id}"/>
                                               <input type="hidden" name="fileName" id="fileName"/>
                                               <label class="col-sm-1 control-label" for="file">上传图片</label>

                                               <div class="col-sm-6">
                                                  <input type="file" class="form-control" name="file" id="file">
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

        })

        $("#file").on("change", function () {
            $("#fileName").val((getFileName($(this).val())));
        })


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
