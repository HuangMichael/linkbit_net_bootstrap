<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- header -->
<header class="navbar clearfix" id="header">
    <div class="container">
        <div class="navbar-brand">
            <!-- COMPANY LOGO -->
            <a href="/back/portal/index">
                <img src="img/logo/logo.png" alt="${user.userName}" class="img-responsive"/>
            </a>
            <!-- SIDEBAR COLLAPSE -->
            <div id="sidebar-collapse" class="sidebar-collapse btn">
                <i class="fa fa-bars"
                   data-icon1="fa fa-bars"
                   data-icon2="fa fa-bars"></i>
            </div>
            <!-- /SIDEBAR COLLAPSE -->
        </div>
        <!-- NAVBAR LEFT -->
        <!-- /NAVBAR LEFT -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <ul class="nav navbar-nav pull-right">
            <!-- END TODO DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user" id="header-user">
                <a class="dropdown-toggle" data-toggle="dropdown">
                    <img alt="" src="${user.imgUrl}"/>
                    <span class="username">${user.userName}(${user.personName})</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/back/user/profile/${sessionScope.user.id}"><i class="fa fa-user"></i>个人信息</a></li>
                    <li><a href="/front/index" target="_blank"><i class="fa fa-eye"></i>进入网站</a></li>
                    <li><a href="/back/logout"><i class="fa fa-power-off"></i>退出登录</a></li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- TEAM STATUS -->
    <!-- /TEAM STATUS -->
</header>