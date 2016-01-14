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
            <img src="${companyProperty.imgUrl}" width="160px" height=120px" class="img-responsive img-thumbnail" alt=""/>
        </div>
        <div class="col-md-9">
            <h5><a href="#"> ${companyProperty.title}</a></h5>
            <p>
                    ${companyProperty.content}
            </p>

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