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
        <ol id="itemContainer">
            <c:forEach items="${knowledgeList}" var="knowledge" varStatus=" status" >
                <li class="list-inline">
                    <div class="details">
                        <h3 class="style1">${knowledge.title}</h3>
                        <div class="det_text">
                            <p class="para1">${knowledge.content}</p>
                            <p class="para1">发布日期:${knowledge.publishTime}</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                </li>
            </c:forEach>
        </ol>
        <div class="holder"></div>
    </div>
</div>
<%--<script type="text/javascript" src="/front/plugins/jPages-master/js/highlight.pack.js"></script>
<script type="text/javascript" src="/front/plugins/jPages-master/js/tabifier.js"></script>--%>
<script src="/front/plugins/jPages-master/js/js.js"></script>
<script src="/front/plugins/jPages-master/js/jPages.js"></script>

<!-- footer -->
<jsp:include page="footer.jsp"/>
<script>
    /* when document is ready */
    $(function () {
        var perPage = 10;
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
        $(".link").on("click", function () {
            var id = $(this).attr("id");
            var url = "/front/knowledge/findById";
            $.getJSON(url, {id: id}, function (data) {
                $("#content" + id).show("fast", function () {
                    $("#content" + id).html(data["content"]);
                    $("#" + id).html("收起明细");
                });
            });
        });

    });
</script>
<!-- footer -->
</body>
</html>