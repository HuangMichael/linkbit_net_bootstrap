<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<div class="header">
    <div class="container">
       <%-- <div class="logo header-top" style="font-size: 24pt; font-weight:bold ;color:#ffffff;font-family:'微软雅黑;margin-left: 100px;;" >
            <!--<a href="index.html"><img src="images/logo.png" class="img-responsive" alt="" /></a>-->

            江苏凌比特微电子技术有限公司
        </div>--%>
        <div class="hader-top">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul class="cl-effect-16">
                    <li class="active"><a href="/index" data-hover="公司主页">公司主页</a></li>
                    <li><a href="/product" data-hover="公司产品">公司产品</a></li>
                    <li><a href="/beidou" data-hover="关于北斗">关于北斗</a></li>
                    <li><a href="/news" data-hover="行业新闻">行业新闻</a></li>
                    <li><a href="/contact" data-hover="联系我们">联系我们</a></li>
                    <div class="clearfix"></div>
                </ul>
                <!-- script-for-nav -->

                <!-- script-for-nav -->
            </div>
            <div class="head-right">
                <P><a href="/admin">管理员入口</a></P>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">


    $(function () {
        $("ul li").on("click", function () {

            console.log("click----------");
            $(this).addClass("active");
        })
    });

    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {

        });
    });
</script>