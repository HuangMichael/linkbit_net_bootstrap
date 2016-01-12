<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container">
        <h2>知识讲堂</h2>
        <c:forEach items="${knowledgeList}" var="k" varStatus="status">
            <div class="col-md-12 about-left1">
                <h5><a href="#">${k.title}</a></h5>
                <h5>关键字：<span class=" badge badge-success">${k.keywords}</span></h5>

                <p>
                        ${k.content }
                </p>

                <div style="float:right">
                    <h5>发布时间：${k.publishTime}&nbsp;发布人：${k.publisher}</h5>
                </div>
                    <%-- <a href="details.html">
                         <button class="btn btn-1 btn-1a">了解更多</button>
                     </a>--%>
                <div class="clearfix"></div>
            </div>
            <%--   <div class="clearfix"></div>--%>
        </c:forEach>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>

</html>