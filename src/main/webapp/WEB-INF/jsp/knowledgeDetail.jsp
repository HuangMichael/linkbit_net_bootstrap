<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <div class="col-md-12 about-left1">
            <h5><a href="#">${knowledge.title}</a></h5>
            <p>
                ${knowledge.content }
            </p>
            <div style="float:right">
                <h5>发布时间：${knowledge.publishTime}&nbsp;发布人：${knowledge.publisher}</h5>
            </div>
            <a href="details.html" class="link">了解更多</a>

            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>