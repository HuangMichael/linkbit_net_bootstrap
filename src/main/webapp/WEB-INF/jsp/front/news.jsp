<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="plugins/jPages-master/css/jPages.css">
<link rel="stylesheet" href="plugins/jPages-master/css/animate.css">
<link rel="stylesheet" href="plugins/jPages-master/css/style.css">
<link rel="stylesheet" href="plugins/jPages-master/css/page.css">

<!-- about-section -->
<div class="about-section">
    <div class="container">
        <div class="holder"></div>
        <ul id="itemContainer">
            <c:forEach items="${newsList}" var="n" varStatus="status">
                <hr style="display: inline">
                <li class="list-inline">
                    <div class="col-md-8 news_title"><a data-id="${n.id}">${status.index+1}.${n.newsTitle}</a></div>
                    <div id="content${n.id}" class="col-md-12"></div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script src="plugins/jPages-master/js/js.js"></script>
<script src="plugins/jPages-master/js/jPages.js"></script>

<!-- footer -->
<jsp:include page="footer.jsp"/>
<script>
    /* when document is ready */
    $(function () {
        var perPage = 20;
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
/*        $(".link").on("click", function () {
            var id = $(this).attr("id");
            var url = "news/findById";
            $.getJSON(url, {id: id}, function (data) {
                $("#content" + id).show("fast", function () {
                    $("#content" + id).html(data["newsContent"]);
                    $("#" + id).html("收起明细");
                });
            });
        });*/


        $("a").on("click", function () {

            var id = $(this).data("id");
            var url = "news/findById";
            $.getJSON(url, {id: id}, function (data) {
                $("#content"+id).fadeIn("fast",function(){
                    $("#content"+id).html(data["newsContent"]);
                })
            });
        });
    });
</script>
<!-- footer -->
</body>
</html>