<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- about-section -->
<div class="about-section">
    <div class="container" style="min-height: 604px">
        <div class="col-md-12"><h3 class="style1">${news.newsTitle}</h3></div>
        <div class="container">
            <div class="col-md-3"><img src="${news.imgUrl}"
                                       class="img-responsive img-thumbnail" alt=""></div>
            <div class="col-md-9">
                <div class="main">
                    <div class="details">
                        <div class="det_pic">
                        </div>
                        <div class="det_text">
                            <p class="para1">${news.newsContent}</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-12"><p class="para1">发布日期:${news.publishTime}</p></div>
        </div>
    </div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>