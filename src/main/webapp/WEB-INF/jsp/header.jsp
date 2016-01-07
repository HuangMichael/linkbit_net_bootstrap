<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<div class="header">
    <div class="container">
        <div class="logo">
            <!--<a href="index.html"><img src="images/logo.png" class="img-responsive" alt="" /></a>-->
        </div>
        <div class="hader-top">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul class="cl-effect-16">
                    <li class="active"><a href="/index" data-hover="公司主页">公司主页</a></li>
                    <li><a href="/product" data-hover="公司产品">公司产品</a></li>
                    <li><a href="/beidou" data-hover="关于北斗">关于北斗</a></li>
                    <li><a href="/news" data-hover="行业新闻">行业新闻</a></li>
                    <li><a href="/customers" data-hover="公司客户">公司客户</a></li>
                    <div class="clearfix"></div>
                </ul>
                <!-- script-for-nav -->
                <script>
                    $("span.menu").click(function () {
                        $(".head-nav ul").slideToggle(300, function () {
                            // Animation complete.
                        });
                    });
                </script>
                <!-- script-for-nav -->
            </div>
            <div class="head-right">
                <P><a href="/contact">联系我们</a></P>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<script type="text/javascript">


    $(function () {
        $("ul>li").on("click", function () {
            $(this).addClass("active");
        })
    })
</script>