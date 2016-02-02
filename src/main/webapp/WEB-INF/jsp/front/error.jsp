<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<div class="about-section">
    <div class="container">
        <div style="min-height: 160px"></div>
        <div class="main">
            <a href="http://localhost:8080">
            <img src="/front/images/404.png" alt="错误页面" title="点击返回首页"/>
        </a>
        </div>
        <div style="min-height: 160px"></div>
    </div>
</div>
<script>
    $('#mi-slider').catslider();

    /*  $("img").on("click", function () {
     $("#productDetail").append('<div style="min-height: 600px">this is detail</div>');
     })*/
</script>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>