<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <c:forEach items="${knowledgeList}" var="k">
            <div class="col-md-12 news_title">${k.title}</div>
            <div class="col-md-9 ">关键字:<a class="badge badge-success">${k.keywords}</a></div>
            <div class="col-md-3 ">发布时间:${k.publishTime}</div>

            <div class="col-md-12 ">
                <div id="content${k.id}" class="news_content">${k.knowledgeDesc}<br></div>
                <a class="link" id="${k.id}">阅读明细</a>
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
            var url = "/knowledge/findById";
            $.getJSON(url, {id: id}, function (data) {
                $("#content" + id).show("fast", function () {
                    $("#content" + id).html(data["content"]);
                });
            });

        });
    });
</script>
</body>
</html>