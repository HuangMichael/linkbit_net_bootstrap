<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<link rel="stylesheet" href="plugins/product_how/css/datouwang.css">
<div class="about-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="sp-wrap">
                    <a href="${product.productImgUrl}">
                        <img src="${product.productImgUrl}" alt="${product.productName}" class="img-responsive img-thumb img-rounded carousel-inner"/>
                    </a>
                    <a href="${product.productImgUrl}">
                        <img src="${product.productImgUrl}" alt="${product.productName}" class="img-responsive img-thumb img-rounded carousel-inner"/>
                    </a>
                    <a href="${product.productImgUrl}">
                        <img src="${product.productImgUrl}" alt="${product.productName}" class="img-responsive img-thumb img-rounded carousel-inner"/>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <h1>${product.productName}</h1>
                <c:forEach items="${product.productCharactorSet}" var="productchar">
                           <div class="communt-left">
                                <div class="col-md-1"></div>
                             </div>
                        <div class="communt">
                            <h4>${productchar.charactorName}:${productchar.charactorDesc}</h4>
                        </div>
                        <div class="clearfix"></div>

                </c:forEach>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div style="padding-bottom: 10px"></div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="plugins/product_how/js/smoothproducts.js"></script>
<!-- footer -->
</body>
</html>