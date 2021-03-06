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

                                    <button type="button" class="btn btn-default btn-mini navbar-btn"
                                            data-toggle="modal"
                                            data-target="#chpwdModal">修改密码
                                    </button>


                                    <form class="form-horizontal" role="form" method="post" action="/back/user/update">
                                        <div class="form-group">
                                            <div class="col-sm-2 center">
                                                <img src="${user.imgUrl}" width="200px"
                                                     class="img-responsive img-rounded img-thumbnail"/>
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="ds_host">姓名</label>

                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="ds_host" type="text"
                                                               value="${user.personName}" maxlength="20"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="gender">性别</label>

                                                    <div class="col-sm-8">
                                                        <form:select id="gender" path="user.gender"
                                                                     cssClass="form-control" name="gender"
                                                                     itemValue="${user.gender}">
                                                            <form:option value="1">男</form:option>
                                                            <form:option value="0">女</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="email">邮箱</label>

                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="email" type="text" name="email"
                                                               value="${user.email}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="birthday">出生年月</label>

                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="birthday" type="date"
                                                               name="birthday" value="${user.birthday}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <form id="upload" class="form-horizontal" enctype="multipart/form-data" role="form"
                                          method="post">
                                        <div class="form-group">
                                            <div class="col-sm-2 center">

                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <input type="hidden" name="userId" id="userId" value="${user.id}"/>
                                                    <input type="hidden" name="fileName" id="fileName"/>
                                                    <label class="col-sm-2 control-label" for="file">上传图片</label>

                                                    <div class="col-sm-8">
                                                        <input type="file" class="form-control" name="file" id="file">
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <input type="submit" value="上传" id="submit"
                                                               class="form-control btn-primary">
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
            </div>
            <!-- /CONTENT-->
        </div>
    </div>
    </div>

</section>


<div class="modal fade" id="chpwdModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="changePwdForm" method="post">
                    <div class="form-group">
                        <label for="oldPwd">原密码</label>
                        <input type="password" class="form-control"
                               id="oldPwd"
                               name="oldpwd" required maxlength="50">
                    </div>

                    <div class="form-group">
                        <label for="newPwd">新密码</label>
                        <input type="password" class="form-control"
                               id="newPwd"
                               name="newPwd" required maxlength="50">
                    </div>

                    <div class="form-group">
                        <label for="confirmPwd">重复密码</label>
                        <input type="password" class="form-control"
                               id="confirmPwd"
                               name="confirmPwd" required maxlength="50">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="submit" id="changePwd" name="createBtn"
                        class="btn btn-primary">保存
                </button>
            </div>
        </div>
    </div>
</div>


<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        /* App.setPage("forms");  //Set current page*/
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- /JAVASCRIPTS -->

<script type="text/javascript">
    $(function () {
        /**
         * 提交上传文件
         * */
        $("#submit").on("click", function (data) {
            var fullName = $("#file").val();
            $("#upload").attr("action", "/back/user/upload");
            $("#upload").submit();

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

        var oldPwd, newPwd, confirmPwd;
        $("#oldPwd").on("change", function (data) {
            var oldPwd = $("#oldPwd").val();
            var url = "/back/user/validatePwd";
            if (!oldPwd) {
                $("#oldPwd").css("border-color", "red").attr("title", "原始密码不能为空");
                return;
            }
            $.ajax({
                type: "POST",
                url: url,
                data: "oldPwd=" + oldPwd,
                success: function (msg) {
                    if (msg) {
                        $("#oldPwd").css("border-color", "green").attr("title", "原始密码正确");
                    } else {
                        $("#oldPwd").css("border-color", "red").attr("title", "原始密码错误");
                    }
                }
            });
        });


       /* $("#newPwd").on("change", function (data) {
            var newPwd = $("#newPwd").val();
            if (!newPwd) {
                $("#newPwd").css("border-color", "red").attr("title", "新密码不能为空");
                return;
            }
        });*/
        /*$("#confirmPwd").on("change", function (data) {
            var confirmPwd = $("#confirmPwd").val();
            if (!confirmPwd) {
                $("#confirmPwd").css("border-color", "red").attr("title", "确认密码不能为空");
                return;
            }
            if (confirmPwd != newPwd) {
                $("#newPwd")[0].focus();
                $("#newPwd").attr("value", "");
                $("#confirmPwd").attr("value", "");
                return;
            }
        });*/


        $("#changePwd").on("click", function () {

            var oldPwd = $("#oldPwd").val();
            if (!oldPwd) {
                $("#oldPwd").css("border-color", "red").attr("title", "新密码不能为空");
                return;
            }

            var newPwd = $("#newPwd").val();
            if (!newPwd) {
                $("#newPwd").css("border-color", "red").attr("title", "新密码不能为空");
                return;
            }

            if (!confirmPwd) {
                $("#confirmPwd").css("border-color", "red").attr("title", "确认密码不能为空");
                return;
            }

            if (confirmPwd != newPwd) {
                alert("两次密码不一致");
                return;
            }


            var url = "/back/user/changePassword";
            $.ajax({
                type: "POST",
                url: url,
                data: "oldPwd=" + oldPwd,
                success: function (msg) {
                    alert("密码修改成功");
                },
                error: function (msg) {
                    alert("密码修改失败");
                }
            });

        });
    })
</script>


</body>
</html>
