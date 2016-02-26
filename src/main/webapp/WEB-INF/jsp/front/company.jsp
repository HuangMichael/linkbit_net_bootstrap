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
            <c:forEach items="${company.companyPropertyList}" var="companyProperty">
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
            <li class="list-inline" style="min-height: 150px">
                <div class="col-md-3">
                    <img src="/front/images/qr.png" width="160px" height=160px"
                         class="img-responsive img-thumbnail" alt=""/>
                </div>
                <div class="col-md-9">
                    <h5><a href="#">移动终端访问</a></h5>

                    <p>
                        扫二维码使用手机客户端访问
                    </p>

                </div>
                <div class="clearfix"></div>
            </li>
        </ul>
        <div class="holder"></div>
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