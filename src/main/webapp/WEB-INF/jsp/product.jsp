<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<div class="content_bg">
    <div class="container">
        <h1>公司产品</h1>
        <div class="main">
            <div class="gallery">

                <section>
                    <ul class="lb-album">
                        <c:forEach items="${allProductList}" var="product" varStatus="status" begin="0" end="3">
                        <li>
                            <a href="#image-${status.index}">
                                <img src="${product.productImgUrl}" height="120px" width="120px"
                                     class="img-responsive img-thumbnail" alt="${product.productName}">
                                <span> </span>
                            </a>

                            <div class="lb-overlay" id="image-${status.index}">
                                <img src="${product.productImgUrl}" height="600px" width="800px"
                                     class="img-responsive img-thumbnail" alt="">
                                <a href="#" class="lb-close"> </a>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </section>

                <section>
                    <ul class="lb-album">
                        <c:forEach items="${allProductList}" var="product" varStatus="status" begin="4" end="7">
                            <li>
                                <a href="#image-${status.index}">
                                    <img src="${product.productImgUrl}" height="120px" width="120px"
                                         class="img-responsive img-thumbnail" alt="${product.productName}">
                                    <span> </span>
                                </a>

                                <div class="lb-overlay" id="image-${status.index}">
                                    <img src="${product.productImgUrl}" height="600px" width="800px"
                                         class="img-responsive img-thumbnail" alt="">
                                    <a href="#" class="lb-close"> </a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </section>

                <section>
                    <ul class="lb-album">
                        <c:forEach items="${allProductList}" var="product" varStatus="status" begin="8" end="11">
                            <li>
                                <a href="#image-${status.index}">
                                    <img src="${product.productImgUrl}" height="120px" width="120px"
                                         class="img-responsive img-thumbnail" alt="${product.productName}">
                                    <span> </span>
                                </a>

                                <div class="lb-overlay" id="image-${status.index}">
                                    <img src="${product.productImgUrl}" height="600px" width="800px"
                                         class="img-responsive img-thumbnail" alt="">
                                    <a href="#" class="lb-close"> </a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </section>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>