<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div id="sidebar" class="sidebar">
    <div class="sidebar-menu nav-collapse">
        <div class="divide-20"></div>
        <!-- SEARCH BAR -->
        <div id="search-bar">
            <input class="search" type="text" placeholder="搜索"><i class="fa fa-search search-icon"></i>
        </div>
        <ul>
            <c:forEach items="${backMenusList}" var="menu">
                <li>
                    <a href="${menu.url}" name="menuLink">
                        <i class="${menu.iconClass}"></i> <span class="menu-text">${menu.menuDesc}</span>
                        <span class="selected"></span>
                    </a>
                </li>
            </c:forEach>
        </ul>
        <!-- /SIDEBAR MENU -->
    </div>
</div>