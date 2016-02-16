<%@page pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
    <base href="<%=basePath%>back/">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>网站后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="css/cloud-admin.css">
    <link rel="stylesheet" type="text/css" href="css/themes/default.css" id="skin-switcher">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
    <!-- STYLESHEETS --><!--[if lt IE 9]>
    <script src="js/flot/excanvas.min.js"></script>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- ANIMATE -->
    <link rel="stylesheet" type="text/css" href="css/animatecss/animate.min.css"/>
    <!-- DATE RANGE PICKER -->
    <link rel="stylesheet" type="text/css" href="js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
    <!-- TODO -->
    <link rel="stylesheet" type="text/css" href="js/jquery-todo/css/styles.css"/>
    <!-- FULL CALENDAR -->
    <link rel="stylesheet" type="text/css" href="js/fullcalendar/fullcalendar.min.css"/>
    <!-- GRITTER -->
    <link rel="stylesheet" type="text/css" href="js/gritter/css/jquery.gritter.css"/>
    <!-- FONTS -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>

 <%--   <link href="bootstrap-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
    <script src="js/jquery/jquery-2.0.3.min.js"></script>
    <script src="js/bootstrap-switch/bootstrap-switch.min.js"></script>--%>
</head>