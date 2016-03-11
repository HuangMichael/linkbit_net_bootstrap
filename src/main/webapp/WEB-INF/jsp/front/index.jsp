<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp" flush="true"/>
<div class="about-section">
    <div class="wmuSlider example1 section" id="section-1">
        <c:forEach var="product" items="${latestProductList}">
            <article style="position: absolute; width: 100%; opacity: 0;">
                <div class="banner-info">
                    <div class="container">
                        <div class="col-md-5 thought-left">
                            <img src="${product.productImgUrl}" height="500px" width="500px" class="img-responsive img-"
                                 alt=""/>
                        </div>
                        <div class="col-md-7 thought-right">
                            <div class="communt">
                                <div class="communt-left">
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="communt-right">
                                    <h4>产品名称</h4>

                                    <p>${product.productName}</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="communt">
                                <div class="communt-left">
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="communt-right">
                                    <h4>上市时间</h4>

                                    <p>${product.onLineDate}</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="communt">
                                <div class="communt-left">
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="communt-right">
                                    <h4>产品描述</h4>

                                    <p>${product.productDesc}</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </article>
        </c:forEach>

        <ul class="wmuSliderPagination">
            <c:forEach var="product" items="${latestProductList}" varStatus="status">
                <li><a href="#" class="">${status.index}</a></li>
            </c:forEach>
        </ul>
    </div>

    <!-- script -->
    <script src="js/jquery.wmuSlider.js"></script>
    <script>
        $('.example1').wmuSlider();
    </script>
    <!-- script -->
</div>
<!-- thought -->
<!-- why-so -->
<div class="why-so">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <c:forEach items="${latestKnowledgeList}" var="lk" varStatus="status">
                        <li>
                            <div class="tittle">
                                <h4><a href="/front/knowledge/detail/${lk.id}">${lk.title}</a></h4>

                                <p>${lk.keywords}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>
        <!-- FlexSlider -->
        <script defer src="/front/js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function () {
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <!-- FlexSlider -->

    </div>
</div>
<!-- why-so -->
<!-- bull -->
<div class="bull">
    <div class="container">

        <c:forEach items="${customerList}" var="customer">
            <li>
                <a href="javascript:void(0)"><img src="${customer.logoPath}" width="120px" height="80px"
                                                  class="img-responsive img-thumbnail" alt=""/></a>
            </li>
        </c:forEach>
    </div>
</div>
<!-- bull -->
<!-- our-ne -->
<div class="our-ne">
    <div class="container">
        <div class="col-md-12">
            <address>
                <c:if test="${company.companyName!=null}">
                    <strong>公司名称:</strong>${company.companyName}
                </c:if>
                <c:if test="${company.address!=null}">
                    <strong>地址:</strong>${company.address}
                </c:if>
                <c:if test="${company.telephone!=null}">
                    <abbr title="Phone">电话:</abbr>${company.telephone}
                </c:if>
            </address>
        </div>

    </div>
</div>
<!-- our-ne -->
<!-- footer -->
<jsp:include page="footer.jsp" flush="true"/>
<!-- footer -->
</body>
</html>