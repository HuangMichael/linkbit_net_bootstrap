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
                    <%--<c:forEach var="menu" items="${menusList}" varStatus="status">
                        <li><a href="${menu.url}" data-hover="${menu.menuDesc}">${menu.menuDesc}</a></li>
                    </c:forEach>--%>

                    <li><a href="/front/index/" data-hover="首页">首页</a></li>

                    <li><a href="/front/product/" data-hover="公司产品">公司产品</a></li>

                   <li><a href="/front/knowledge/" data-hover="关于北斗">关于北斗</a></li>

                    <li><a href="/front/news/" data-hover="行业资讯">行业资讯</a></li>

                    <li><a href="/front/company/" data-hover="公司介绍">公司介绍</a></li>
                </ul>
                <!-- script-for-nav -->
                <script>
                    $("span.menu").click(function () {
                        $(".head-nav ul").slideToggle(300, function () {
                            // Animation complete.
                        });
                    });
                </script>
                <!-- script-for-nav -->
            </div>
            <div class="head-right">
                <P><a href="/front/message">联系我们</a></P>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<script type="text/javascript">

    $(function () {

    });

</script>