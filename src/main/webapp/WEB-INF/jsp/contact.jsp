<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <c:forEach items="${company.companyPropertyList}" var="companyProperty">
        <div class="col-md-3">
            <img src="images/station.png" width="200px" height=150px" class="img-responsive img-thumbnail" alt=""/>
        </div>
        <div class="col-md-9">
            <h5><a href="details.html"> ${companyProperty.title}</a></h5>
            <p>
                    ${companyProperty.content}
            </p>
           <%-- <a href="details.html">
                <a class="link">了解更多</a>
            </a>--%>
        </div>
        <div class="clearfix"></div>
        </c:forEach>

    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>

</html>