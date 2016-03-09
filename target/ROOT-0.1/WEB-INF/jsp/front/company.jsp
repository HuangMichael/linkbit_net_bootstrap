<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="/front/plugins/jPages-master/css/jPages.css">
<link rel="stylesheet" href="/front/plugins/jPages-master/css/animate.css">
<%--<link rel="stylesheet" href="/front/plugins/jPages-master/css/style.css">
<link rel="stylesheet" href="/front/plugins/jPages-master/css/page.css">--%>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <div class="holder"></div>
        <ul id="itemContainer">
            <c:forEach items="${companyPropertyList}" var="companyProperty">
                <li class="list-inline" style="min-height: 150px">
                    <div class="col-md-3">
                        <img src="${companyProperty.imgUrl}" width="160px" height=120px"
                             class="img-responsive img-thumbnail" alt=""/>
                    </div>
                    <div class="col-md-9">
                        <h5><a href="#"> ${companyProperty.title}</a></h5>

                        <p>
                                ${companyProperty.content}
                        </p>

                    </div>
                    <div class="clearfix"></div>
                </li>
            </c:forEach>
        </ul>
        <div class="holder"></div>
    </div>
</div>

<script src="/front/plugins/jPages-master/js/js.js"></script>
<script src="/front/plugins/jPages-master/js/jPages.js"></script>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<script>
    /* when document is ready */
    $(function () {
        var perPage = 4;
        var animation = getRandomAnimation();
        $("div.holder").jPages({
            containerID: "itemContainer",
            animation: animation,
            perPage: perPage
        });
        $("div.holder").jPages("destroy").jPages({
            containerID: "itemContainer",
            animation: animation,
            perPage: perPage
        });
    });
</script>
<!-- footer -->
</body>
</html>