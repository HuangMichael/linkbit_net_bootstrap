<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- header -->
<div class="header">
    <div class="container">
        <div class="logo">
            <img src="images/company/logo.png" width="110px" height="55px" class="img-responsive" alt=""/>
        </div>
        <div class="hader-top">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul class="cl-effect-16" id="menu_ul">
                    <c:forEach  var="menu" items="${menusList}">
                        <li><a href="${menu.url}" data-hover="${menu.menuDesc}">${menu.menuDesc}</a></li>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
                <!-- script-for-nav -->
                <script>
                    $( "span.menu" ).click(function() {
                        $( ".head-nav ul" ).slideToggle(300, function() {
                            // Animation complete.
                        });
                    });
                </script>
                <!-- script-for-nav -->
            </div>
            <div class="head-right">
                <P><a href="registration.html">联系我们</a></P>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>