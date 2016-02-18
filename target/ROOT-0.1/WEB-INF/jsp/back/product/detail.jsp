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


                               <%-- private long id;
                                private String productName;
                                private String productDesc;
                                private String productImgUrl;
                                private Boolean showInMainPage;
                                private Long sortNo;
                                @Temporal(TemporalType.DATE)
                                private Date onLineDate;
                                private boolean online;--%>


                                <div class="box-body">
                                   <%-- <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">产品名称</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="text" class="form-control" placeholder="Username" value="${product.productName}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">产品描述</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="text" class="form-control" placeholder="Username" value="${product.productDesc}">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">图片路径</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="text" class="form-control" value="${product.productImgUrl}" readonly/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">主页显示</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
													  <span class="input-group-addon">
														<input type="checkbox">
													  </span>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">是否上线</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="text" class="form-control" value="${product.online}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">上线日期</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="date" class="form-control date-picker" value="${product.onLineDate}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">排序</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <input type="number" class="form-control" value="${product.sortNo}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>--%>


                                    <form class="form-horizontal" role="form">



                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="${product.productImgUrl}" width="200px" />

                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">产品名称</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text" placeholder="192.168.1.161" value="${product.productName}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">产品描述</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="text" placeholder="msh"  value="${product.productDesc}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="productImgUrl">图片路径</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="productImgUrl" type="text" placeholder="root" value="${product.productImgUrl}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="onLineDate">上线日期</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="onLineDate" type="date" placeholder="123456" value="${product.onLineDate}" readonly/>
                                                    </div>
                                                </div>


                                                <div class="form-group">

                                                    <label for="showInMainPage"  class="col-sm-1 control-label">主页显示</label>
                                                    <div class="col-sm-5">
                                                        <select id="showInMainPage" class="form-control" readonly>
                                                            <option>是</option>
                                                            <option>否</option>
                                                        </select>
                                                    </div>


                                                    <label for="sortNo"  class="col-sm-1 control-label">排列顺序</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="sortNo" type="number"  value="${product.sortNo}" readonly/>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <fieldset>
                                            <legend>推送上线</legend>
                                            <div class="form-group">
                                                <label for="onLine"  class="col-sm-2 control-label">是否上线</label>
                                                <div class="col-sm-10">
                                                    <select id="onLine" class="form-control" readonly>
                                                        <option>是</option>
                                                        <option>否</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="ds_password">上线日期</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" id="ds_password" type="date" placeholder="123456" value="${product.onLineDate}" readonly/>
                                                </div>
                                        </div>
                                        </fieldset>
                                    </form>
                                     <%--  <form method="POST"  class="form-horizontal" role="form" enctype="multipart/form-data" id="uploadForm">
                                           <fieldset>
                                               <legend>上传图片</legend>
                                           <input type="hidden" name="fileName" id="fileName">
                                           <div class="form-group">
                                               <label class="col-sm-1 control-label" for="file">上传图片</label>
                                               <div class="col-sm-10">
                                                   <input class="form-control" id="file" type="file" placeholder="root" value="${product.productImgUrl}"/>
                                               </div>
                                               <div class="col-sm-1">
                                                   <input class="form-control" id="submit" type="submit" placeholder="root" value="上传图片"/>
                                               </div>
                                           </div>
                                           </fieldset>
                                       </form>--%>


                                       <form method="post" enctype="multipart/form-data" id="uploadForm" action="/back/upload/upload">

                                           <input type="hidden" name="productId" id="productId" value="${product.id}"/>
                                           文件上传: <input type="file" name="file" id="file"><br/>
                                           文件名: <input type="text" name="fileName" id="fileName"> <input type="submit" value="上传" id="submit">
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
    $(function() {



        $('#uploadForm').on('submit', function() {


            var options={
                type: 'post', // 提交方式 get/post
                url: '/back/product/upload', // 需要提交的 url
                dateType:"json",
                data: {
                    'file': file,
                    'fileName': fileName
                },

                timeout:5000,
                success: function(data) {

                }
            };
            var file = $("#file").val();
            var fileName = getFileName(file);
            $("#fileName").val(fileName);
            $(this).attr("action","/back/product/upload");
            $('#uploadForm').submit();
            console.log("fileName-----------------" + fileName);
           // $(this).ajaxSubmit(options);
        });

        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
        }

    });
</script>



</body>
</html>
