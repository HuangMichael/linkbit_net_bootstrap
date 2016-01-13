<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <c:forEach items="${newsList}" var="n">
            <div class="col-md-12 news_title">${n.newsTitle}</div>
            <div class="col-md-9 ">关键字:<a class="badge badge-success">${n.keywords}</a></div>
            <div class="col-md-3 ">发布时间:${n.publishTime}</div>
            <div class="col-md-2">
                <img src="${n.imgUrl}" height="90px" width="120px" class="img-responsive img-thumbnail img-rounded news_content">
            </div>
            <div class="col-md-10 ">
                <div id="content${n.id}" data-loaded="false" class="news_content">${n.newsTitle}<br></div>
                <a class="link" id="${n.id}">阅读明细</a>
            </div>

        </c:forEach>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->

<script type="text/javascript">
    $(function () {
        $(".link").on("click", function () {
            var id = $(this).attr("id");
            var url = "/news/findById";
            $.getJSON(url, {id: id}, function (data) {
                $("#content" + id).show("fast", function () {
                    $("#content" + id).html(data["newsContent"]);
                });
            });

        });
    });
</script>
</body>

</html>