<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>/front/">
    <title>江苏凌比特微电子技术有限公司</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="linkbit"/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/linkbit.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/product.css" type="text/css" media="screen"/>
    <script src="js/modernizr.custom.63321.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.catslider.js"></script>
    <script src="js/Utils.js"></script>

</head>