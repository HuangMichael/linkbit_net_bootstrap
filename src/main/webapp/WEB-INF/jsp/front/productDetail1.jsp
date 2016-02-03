<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<div class="about-section">
    <div class="container" style="min-height: 604px">
        <div class="col-md-5 thought-left">
            <img src="${product.productImgUrl}" height="500px" width="500px" class="img-responsive" alt=""/>
        </div>
        <div class="col-md-7 thought-right">
            <div class="communt">
                <div class="communt-left">

                </div>
                <div class="communt-right">
                    <h4>产品名称</h4>

                    <p>${product.productName}</p>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="communt">
                <div class="communt-left">

                </div>
                <div class="communt-right">
                    <h4>产品特点</h4>

                    <p>
                        <c:forEach items="${product.productCharactorSet}" var="productchar">
                            ${productchar.charactorDesc}  <br>
                        </c:forEach>

                    </p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="communt">
                <div class="communt-left">
                   W
                </div>
                <div class="communt-right">
                    <h4>上市时间</h4>

                    <p>${product.onLineDate}</p>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>