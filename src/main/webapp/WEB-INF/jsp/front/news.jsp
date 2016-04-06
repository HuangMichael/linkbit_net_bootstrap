<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <c:forEach items="${newsList}" var="news">
                <li class="list-inline" style="min-height: 150px">
                    <c:if test="${news.imgUrl!=null}">
                        <div class="col-md-12">
                            <h5><a href="#"> ${news.newsTitle}</a></h5>
                            <h6>${news.newsDesc}</h6>
                            <h6><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h6>
                            <img src="${news.imgUrl}"
                                 class="img-responsive img-thumbnail" alt="" width="60%" height="60%"/>
                        </div>
                        <div class="col-md-12">
                            <p>
                                    ${news.newsContent}
                            </p>
                        </div>
                    </c:if>
                    <c:if test="${news.imgUrl==null}">
                        <div class="col-md-12">
                            <h5><a href="#"> ${news.newsTitle}</a></h5>
                            <h6>${news.newsDesc}</h6>
                            <h6><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h6>
                            <p>
                                    ${news.newsContent}
                            </p>
                        </div>
                    </c:if>
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