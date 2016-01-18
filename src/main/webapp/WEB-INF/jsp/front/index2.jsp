<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp" flush="true"/>

<div class="container">
    <%--    <div class="more">
            <ul id="sb-examples">
                <li><a href="index.html">效果一</a></li>
                <li><a href="index2.html">效果二</a></li>
                <li><a href="index3.html">效果三</a></li>
                <li class="selected"><a href="index4.html">效果四</a></li>
            </ul>
        </div>--%>
    <div class="wrapper">
        <ul id="sb-slider" class="sb-slider">
            <c:forEach var="product" items="${latestProductList}">
                <li>
                    <a href="#" target="_blank"><img src="${product.productImgUrl}" alt="image1"  class="img-responsive"/></a>
                    <div class="sb-description">
                        <h3>${product.productName}</h3>
                </div>
                </li>
            </c:forEach>
        </ul>

        <div id="shadow" class="shadow"></div>

        <div id="nav-arrows" class="nav-arrows">
            <a href="#">下一个</a>
            <a href="#">上一个</a>
        </div>

    </div><!-- /wrapper -->
    <%--<div class="footer-banner" style="width:728px; margin:30px auto"></div>--%>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.slicebox.js"></script>
<script type="text/javascript">
    $(function () {

        var Page = (function () {

            var $navArrows = $('#nav-arrows').hide(),
                    $shadow = $('#shadow').hide(),
                    slicebox = $('#sb-slider').slicebox({
                        onReady: function () {

                            $navArrows.show();
                            $shadow.show();

                        },
                        orientation: 'r',
                        cuboidsRandom: true,
                        disperseFactor: 30
                    }),

                    init = function () {

                        initEvents();

                    },
                    initEvents = function () {

                        // add navigation events
                        $navArrows.children(':first').on('click', function () {

                            slicebox.next();
                            return false;

                        });

                        $navArrows.children(':last').on('click', function () {

                            slicebox.previous();
                            return false;

                        });

                    };

            return {init: init};

        })();

        Page.init();

    });
</script>
<%--<script src="http://dreamsky.github.io/main/blog/common/init.js"></script>--%>
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
                            <h4><a href="/showDetail">${lk.title}</a></h4>

                            <p>${lk.keywords}</p>
                        </div>
                    </li>
                    </c:forEach>
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

        <c:forEach items="${customerList}" var="customer">
        <li>
            <a href="#"><img src="${customer.logoPath}"  width="120px" height="80px"  class="img-responsive img-thumbnail" alt="" /></a>
        </li>
        </c:forEach>
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