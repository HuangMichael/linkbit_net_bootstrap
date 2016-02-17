<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="/back">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>网站后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- STYLESHEETS --><!--[if lt IE 9]>
    <script src="js/flot/excanvas.min.js"></script>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="/back/css/cloud-admin.css">

    <link href="/back/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- DATE RANGE PICKER -->
    <link rel="stylesheet" type="text/css" href="/back/js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
    <!-- UNIFORM -->
    <link rel="stylesheet" type="text/css" href="/back/js/uniform/css/uniform.default.min.css"/>
    <!-- ANIMATE -->
    <link rel="stylesheet" type="text/css" href="/back/css/animatecss/animate.min.css"/>
    <!-- FONTS -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
</head>
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
                        <a href="index.html"><img src="/back/img/logo/logo.png" height="40" alt="logo name"/></a>
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
                                <label for="exampleInputEmail1">用户名</label>
                                <i class="fa fa-envelope"></i>
                                <input type="text" class="form-control" id="userName" name="userName">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">密码</label>
                                <i class="fa fa-lock"></i>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div>
                                <label class="checkbox"> <input type="checkbox" class="uniform" value="">记住密码</label>
                                <button type="submit" class="btn btn-danger" id="login_btn">登录</button>
                            </div>
                        </form>
                        <!-- /SOCIAL LOGIN -->
                        <div class="login-helpers">
                            <a href="#" onclick="swapScreen('forgot_bg');return false;">忘记密码?</a> <br>
                            没有账号? <a href="#" onclick="swapScreen('register_bg');return false;">现在注册
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/LOGIN -->
    <!-- REGISTER -->
    <section id="register_bg" class="font-400">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-box">
                        <h2 class="bigintro">用户注册</h2>

                        <div class="divide-40"></div>
                        <form role="form">
                            <div class="form-group">
                                <label for="exampleInputName">用户昵称</label>
                                <i class="fa fa-font"></i>
                                <input type="text" class="form-control" id="exampleInputName">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputUsername">用户名</label>
                                <i class="fa fa-user"></i>
                                <input type="text" class="form-control" id="exampleInputUsername">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">用户邮箱</label>
                                <i class="fa fa-envelope"></i>
                                <input type="email" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">用户密码</label>
                                <i class="fa fa-lock"></i>
                                <input type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword2">重复密码</label>
                                <i class="fa fa-check-square-o"></i>
                                <input type="password" class="form-control" id="exampleInputPassword2">
                            </div>
                            <div>
                                <label class="checkbox"> <input type="checkbox" class="uniform" value="">我同意 <a
                                        href="#">服务条款</a> 和 <a href="#">法律法规政策</a></label>
                                <button type="submit" class="btn btn-success">注册</button>
                            </div>
                        </form>
                        <!-- /SOCIAL REGISTER -->
                        <div class="login-helpers">
                            <a href="#" onclick="swapScreen('login_bg');return false;">退到登录页面</a> <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/REGISTER -->
    <!-- FORGOT PASSWORD -->
    <section id="forgot_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-box">
                        <h2 class="bigintro">忘记密码</h2>

                        <div class="divide-40"></div>
                        <form role="form">
                            <div class="form-group">
                                <label for="exampleInputEmail1">请输入您的邮箱</label>
                                <i class="fa fa-envelope"></i>
                                <input type="email" class="form-control" id="exampleInputEmail3">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-info">发送安全链接至邮箱</button>
                            </div>
                        </form>
                        <div class="login-helpers">
                            <a href="#" onclick="swapScreen('login_bg');return false;">退回登录</a> <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FORGOT PASSWORD -->
</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- JQUERY -->
<script src="/back/js/jquery/jquery-2.0.3.min.js"></script>
<!-- JQUERY UI-->
<script src="/back/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
<!-- BOOTSTRAP -->
<script src="/back/bootstrap-dist/js/bootstrap.min.js"></script>


<!-- UNIFORM -->
<script type="text/javascript" src="/back/js/uniform/jquery.uniform.min.js"></script>
<!-- BACKSTRETCH -->
<script type="text/javascript" src="/back/js/backstretch/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="/back/js/jQuery-Cookie/jquery.cookie.min.js"></script>
<!-- CUSTOM SCRIPT -->
<script src="/back/js/script.js"></script>
<script>
    jQuery(document).ready(function () {
        App.setPage("login_bg");  //Set current page
        App.init(); //Initialise plugins and elements
    });

/*
    $("#login_btn").on("click",function () {
        var userName = $("#userName").val();
        var password = $("#password").val();
        var user = {
            userName: userName,
            password: password
        };
        var url = "/back/login";
        $.post(url, {user: user});

    })*/
</script>
<script type="text/javascript">
    function swapScreen(id) {
        jQuery('.visible').removeClass('visible animated fadeInUp');
        jQuery('#' + id).addClass('visible animated fadeInUp');
    }
</script>
<!-- /JAVASCRIPTS -->
</body>
</html>