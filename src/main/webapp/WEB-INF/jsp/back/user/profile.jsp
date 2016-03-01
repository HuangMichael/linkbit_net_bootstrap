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
                                    <form class="form-horizontal" role="form" method="post" action="/back/user/update">
                                        <div class="form-group">
                                            <div class="col-sm-2 center">
                                                <img src="${user.imgUrl}" width="200px" class="img-responsive img-rounded img-thumbnail"/>
                                            </div>

                                           <%-- private String userName;//用户名
                                            private String password;//密码
                                            private String imgUrl; //头像存放路径
                                            private String gender; //性别
                                            private String personName;//姓名
                                            private String email ;//电子邮箱
                                            @Temporal(TemporalType.DATE)
                                            private Date birthday;//出生日期
                                            private String status;//用户状态--%>


                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="ds_host">姓名</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="ds_host" type="text" value="${user.personName}" maxlength="20"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="gender">性别</label>
                                                    <div class="col-sm-8">
                                                        <form:select id="gender"  path="user.gender" cssClass="form-control"  name="gender"
                                                                     itemValue="${user.gender}">
                                                            <form:option value="1">男</form:option>
                                                            <form:option value="0">女</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="email">邮箱</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="email" type="text" name="email" value="${user.email}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="birthday">出生年月</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="birthday" type="date"  name="birthday" value="${user.birthday}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                   <input type="hidden" name="userId" id="userId" value="${user.id}"/>
                                                    <input type="hidden" name="fileName" id="fileName"/>
                                                    <label class="col-sm-2 control-label" for="file">上传图片</label>

                                                    <div class="col-sm-8">
                                                        <input type="file" class="form-control" name="file" id="file">
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <input type="submit" value="上传" id="submit" class="form-control btn-primary">
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
