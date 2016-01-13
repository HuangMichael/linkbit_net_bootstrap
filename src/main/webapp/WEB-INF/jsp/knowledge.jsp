<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <%--  <h2>关于北斗</h2>--%>

        <div class="accordion" id="accordion2">
            <c:forEach items="${knowledgeList}" var="k" varStatus="status">
                <div class="accordion-group">
                    <div class="accordion-heading about-left1">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2"
                           href="#collapse${status.index}">
                            <h5 class="knowledge_title">${k.title}</h5>

                        </a>
                </div>
                    <div id="collapse${status.index}" class="accordion-body collapse" style="height: 0px; ">
                        <div class="accordion-inner">
                            <div class="knowledge_keywords">关键字：<a href="#"
                                                                   class="badge badge-primary">${k.keywords}</a></div>
                                ${k.content}<br>

                            <div class="knowledge_publishTime">发布时间：${k.publishTime}</div>

                        </div>
                    </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
<script src="js/bootstrap.js"></script>

<script type="text/javascript">
    $(function () {
        /* $("a[name='readMore']").on("click", function () {
         /!*alert($(this).attr("data-detail-id"));*!/
         });*/
    });
</script>
</body>

</html>