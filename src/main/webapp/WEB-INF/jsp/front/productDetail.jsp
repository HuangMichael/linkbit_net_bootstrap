<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<link rel="stylesheet" href="/front/plugins/product_how/css/datouwang.css">
<div class="about-section">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="sp-wrap">
                    <a href="${product.productImgUrl}">
                        <img src="${product.productImgUrl}" alt="${product.productName}" class="img-responsive img-thumb img-rounded" />
                    </a>
                </div>
        </div>
            <div class="col-md-7">
            <div class="communt">
                <div class="communt-left">
                    <div class="col-md-1"></div>
                </div>
                <div class="communt-right">
                    <h4>产品名称</h4>
                    <p>${product.productName}</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="communt">
                <div class="communt-left">
                    <div class="col-md-1"></div>
                </div>
                <div class="communt-right">
                    <h4>上市时间</h4>
                    <p>${product.onLineDate}</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="communt">
                <div class="communt-left">
                    <div class="col-md-1"></div>
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
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="/front/plugins/product_how/js/smoothproducts.js"></script>
<!-- footer -->
</body>
</html>