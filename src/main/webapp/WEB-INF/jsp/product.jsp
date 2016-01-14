<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<div class="content_bg">
    <div class="container">
        <div class="main">
            <div id="mi-slider" class="mi-slider">
                <c:forEach items="${productMap}" var="plist">
                    <ul>
                        <c:forEach items="${plist}" var="p">
                            <li><a href="#"><img src="${p.productImgUrl}" alt="${p.productName}"
                                                 title="${p.productName}"><h4>${p.productName}</h4></a></li>
                        </c:forEach>
                    </ul>
                </c:forEach>
                <nav>
                    <a href="#">北斗手表</a>
                    <a href="#">北斗导航PDA</a>
                    <a href="#">北斗指挥机</a>
                    <a href="#">北斗导航仪</a>
                </nav>
            </div>
        </div>
    </div>
</div>
<script>
    $('#mi-slider').catslider();
</script>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>