<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="/front/plugins/jPages-master/css/jPages.css">
<link rel="stylesheet" href="/front/plugins/jPages-master/css/animate.css">
<%--<link rel="stylesheet" href="/front/plugins/jPages-master/css/style.css">

<link rel="stylesheet" href="/front/plugins/jPages-master/css/github.css">
<link rel="stylesheet" href="/front/plugins/jPages-master/css/page.css">--%>

<!-- about-section -->
<div class="about-section">
    <div class="container">
        <div class="holder"></div>
        <ul id="itemContainer">
            <c:forEach items="${newsList}" var="n">
                <li class="list-inline">
                <div class="col-md-12 news_title"><a href="/news/detail/${n.id}">${n.newsTitle}</a></div>
                <div class="col-md-9 ">关键字:<a class="badge badge-success">${n.keywords}</a></div>
                <div class="col-md-3 ">发布时间:${n.publishTime}</div>
                <div class="col-md-2">
                    <img src="${n.imgUrl}" height="90px" width="120px" class="img-responsive img-thumbnail img-rounded news_content">
                </div>
                <div class="col-md-10 ">
                    <div id="content${n.id}" data-loaded="false" class="news_content">${n.newsTitle}<br></div>
                    <a class="link" id="${n.id}">阅读明细</a>
                </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script type="text/javascript" src="/front/plugins/jPages-master/js/highlight.pack.js"></script>
<script type="text/javascript" src="/front/plugins/jPages-master/js/tabifier.js"></script>
<script src="/front/plugins/jPages-master/js/js.js"></script>
<script src="/front/plugins/jPages-master/js/jPages.js"></script>

<!-- footer -->
<jsp:include page="footer.jsp"/>
<script>
    /* when document is ready */
    $(function () {

        var perPage = 4;
        var animation = getRandomAnimation();
        /* initiciate jPages */
        $("div.holder").jPages({
            containerID: "itemContainer",
            animation: animation,
            perPage: perPage
        });


        /* destroy jPages and initiate plugin again */
        $("div.holder").jPages("destroy").jPages({
            containerID: "itemContainer",
            animation: animation,
            perPage: perPage
        });


        $(".link").on("click", function () {
            var id = $(this).attr("id");
            var url = "/knowledge/findById";
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