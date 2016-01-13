<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="header">
    <div class="container">

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
                <!-- script-for-nav -->
            </div>
            <%--<div class="head-right">
                <P><a href="/admin">管理员入口</a></P>
            </div>--%>
            <div class="clearfix"></div>
        </div>
           <div class="clearfix"></div>
        </div>

</div>