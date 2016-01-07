<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="/">
    <title>江苏凌比特微电子技术有限公司</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Source Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
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
    <script src="js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="content_bg">
    <div class="container">
        <div class="register">
            <form>
                <div class="register-top-grid">
                    <h3>PERSONAL INFORMATION</h3>

                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>First Name<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Last Name<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Email Address<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="clearfix"></div>
                    <a class="news-letter" href="#">
                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for
                            Newsletter</label>
                    </a>
                </div>
                <div class="register-bottom-grid">
                    <h3>LOGIN INFORMATION</h3>

                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Password<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Confirm Password<label>*</label></span>
                        <input type="text">
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
            <div class="register-but">
                <form>
                    <input type="submit" value="submit">

                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>