<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp" flush="true"/>
<div class="thought">

    <div class="wmuSlider example1 section" id="section-1">
        <div class="container">
            <h1>公司最新产品展示</h1>
        </div>
        <c:forEach var="product" items="${latestProductList}">
        <article style="position: absolute; width: 100%; opacity: 0;">
            <div class="banner-info">
                <div class="container">
                    <div class="col-md-5 thought-left">
                        <img src="${product.productImgUrl}" height="500px" width="500px" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-md-7 thought-right">
                        <div class="communt">
                            <div class="communt-left">
                                <i class="man"></i>
                            </div>
                            <div class="communt-right">
                                <h4>产品名称</h4>
                                <p>${product.productName}</p>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="communt">
                            <div class="communt-left">
                                <i class="bulb"></i>
                            </div>
                            <div class="communt-right">
                                <h4>产品特点</h4>
                                <p>

                                    <c:forEach items="${product.productCharactorSet}" var="productchar">
                                        ${productchar.charactorDesc}  <br>
                                    </c:forEach>

                                </p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="communt">
                            <div class="communt-left">
                                <i class="bar"></i>
                            </div>
                            <div class="communt-right">
                                <h4>上市时间</h4>
                                <p>${product.onLineDate}</p>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
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
                    <li>
                        <div class="tittle">
                            <h4><a href="/showDetail">北斗系统介绍</a></h4>
                            <p>介绍北斗系统组成</p>
                        </div>
                    </li>
                    <li>
                        <div class="tittle">
                            <h4><a href="/showDetail">北斗定位原理</a></h4>
                            <p>从科学角度介绍北斗导航系统定位原理</p>
                        </div>
                    </li>
                    <li>
                        <div class="tittle">

                            <h4><a href="/showDetail">北斗测速原理</a></h4>
                            <p>从科学角度介绍北斗导航系统测速原理</p>
                        </div>
                    </li>
                    <li>
                        <div class="tittle">

                            <h4><a href="/showDetail">手机定位导航原理</a></h4>
                            <p>介绍手机定位导航测速</p>
                        </div>
                    </li>
                    <li>
                        <div class="tittle">

                            <h4>其他的一些科普知识</h4>
                            <p> 与关于北斗模块相对应，可维护。</p>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(window).load(function(){
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function(slider){
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
        <li>
            <a href="#"><img src="images/m1.png" class="img-responsive" alt="" /></a>
        </li>
        <li>
            <a href="#"><img src="images/m2.png" class="img-responsive" alt="" /></a>
        </li>
        <li>
            <a href="#"><img src="images/m3.png" class="img-responsive" alt="" /></a>
        </li>
        <li>
            <a href="#"><img src="images/m4.png" class="img-responsive" alt="" /></a>
        </li>
        <li>
            <a href="#"><img src="images/m5.png" class="img-responsive" alt="" /></a>
        </li>
    </div>
</div>
<!-- bull -->
<!-- our-ne -->
<div class="our-ne">
    <div class="container">
        <h3>咨询电话：025-88888888</h3>
        <h4>留个联系方式吧!</h4>
        <form>
            <input type="text" class="text" placeholder="您的电话"/>
        </form>
        <label></label>
    </div>
</div>
<!-- our-ne -->
<!-- footer -->
<jsp:include page="footer.jsp" flush="true" />
<!-- footer -->
</body>

</html>