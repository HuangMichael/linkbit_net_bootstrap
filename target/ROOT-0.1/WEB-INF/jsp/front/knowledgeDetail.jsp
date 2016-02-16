<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container" style="min-height: 604px">
        <div class="main">
            <div class="details">
                <h3 class="style1">${knowledge.title}</h3>
               <%-- <div class="det_pic">
                    <img src="images/gallery3.jpg" class="img-responsive" alt="">
                </div>--%>
                <div class="det_text">
                    <p class="para1">${knowledge.content}</p>
                    <p class="para1">发布日期:${knowledge.publishTime}</p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>