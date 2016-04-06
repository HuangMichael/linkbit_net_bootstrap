<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body class="login">
<!-- PAGE -->
<section id="page">
    <!-- HEADER -->
    <header>
        <!-- NAV-BAR -->
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div id="logo">
                        <a href="index.html"><img src="img/logo/logo.png" height="40" alt="logo name"/></a>
                        <%--  <h1>江苏凌比特微电子技术有限公司</h1>--%>
                    </div>

                </div>
            </div>
        </div>
        <!--/NAV-BAR -->
    </header>
    <!--/HEADER -->
    <!-- LOGIN -->
    <section id="login_bg" class="visible">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-box">
                        <h2 class="bigintro"> 用户登录</h2>

                        <div class="divide-40"></div>
                        <form role="form" id="login_form" action="/back/login" method="post">
                            <div class="form-group">
                                <label for="userName">用户名</label>
                                <i class="fa fa-envelope"></i>
                                <input type="text" class="form-control" id="userName" name="userName">
                            </div>
                            <div class="form-group">
                                <label for="password">密码</label>
                                <i class="fa fa-lock"></i>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-danger" id="login_btn">登录</button>
                            </div>
                        </form>
                        <!-- /SOCIAL LOGIN -->
                    </div>
                </div>
            </div>
        </div>
    </section>

</section>
<%@include file="../common/footer.jsp" %>
<script>
    $(document).ready(function () {
        App.setPage("login_bg");  //Set current page
        App.init(); //Initialise plugins and elements
    });

</script>
<script type="text/javascript">
    function swapScreen(id) {
        $('.visible').removeClass('visible animated fadeInUp');
        $('#' + id).addClass('visible animated fadeInUp');
    }
</script>
<!-- /JAVASCRIPTS -->
</body>
</html>