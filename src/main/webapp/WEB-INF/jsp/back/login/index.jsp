<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<html lang="en">
<%--<%@include file="../common/head.jsp" %>--%>
<link rel="stylesheet" type="text/css" href="css/cloud-admin.css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- DATE RANGE PICKER -->
<link rel="stylesheet" type="text/css" href="js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<!-- UNIFORM -->
<link rel="stylesheet" type="text/css" href="js/uniform/css/uniform.default.min.css"/>
<!-- ANIMATE -->
<link rel="stylesheet" type="text/css" href="css/animatecss/animate.min.css"/>
<!-- FONTS -->
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
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
                        <a href="#"><img src="/back/img/logo/logo.png" height="40" alt="logo name"/></a>
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
<%--<%@include file="../common/footer.jsp" %>--%>
<script src="js/jquery/jquery-2.0.3.min.js"></script>
<!-- JQUERY UI-->
<script src="js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
<!-- BOOTSTRAP -->
<script src="bootstrap-dist/js/bootstrap.min.js"></script>
<!-- UNIFORM -->
<script type="text/javascript" src="js/uniform/jquery.uniform.min.js"></script>
<!-- BACKSTRETCH -->
<script type="text/javascript" src="js/backstretch/jquery.backstretch.min.js"></script>
<!-- CUSTOM SCRIPT -->
<script src="js/script.js"></script>
<script>
    jQuery(document).ready(function () {
        App.setPage("login_bg");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
<script type="text/javascript">
    function swapScreen(id) {
        jQuery('.visible').removeClass('visible animated fadeInUp');
        jQuery('#' + id).addClass('visible animated fadeInUp');
    }
</script>
</body>
</html>