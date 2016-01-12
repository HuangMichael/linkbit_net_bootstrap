<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="header">
    <div class="container">
       <%-- <div class="logo header-top" style="font-size: 24pt; font-weight:bold ;color:#ffffff;font-family:'微软雅黑;margin-left: 100px;;" >
            <!--<a href="index.html"><img src="images/logo.png" class="img-responsive" alt="" /></a>-->

            江苏凌比特微电子技术有限公司
        </div>--%>
        <div class="hader-top">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul class="cl-effect-16" id="menu_ul">
                    <c:forEach  var="menu" items="${menusList}">
                        <li><a href="${menu.url}" data-hover="${menu.menuDesc}">${menu.menuDesc}</a></li>
                    </c:forEach>
                    <div class="clearfix"></div>
                </ul>
                <!-- script-for-nav -->
                <!-- script-for-nav -->
            </div>
            <%--<div class="head-right">
                <P><a href="/admin">管理员入口</a></P>
            </div>--%>
            <div class="clearfix"></div>
        </div>
           <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">


    $(function () {
        //<li><a href="${menu.url}" data-hover="${menu.menuDesc}">${menu.menuDesc}</a></li>
        var url = "/menu/findAll";

        $.getJSON(url, null, function (data) {
            for (var i in data) {
                console.log("i------------" + i);
                console.log("<li><a href='" + data[i]['url'] + "' data-hover='" + data[i]['menuDesc'] + "''" + data[i]['menuDesc'] + "'</a></li>");
                $("#menu_ul").append("<li><a href='" + data[i]['url'] + "' data-hover='" + data[i]['menuDesc'] + "''" + data[i]['menuDesc'] + "'</a></li>");
            }
        });

        //首页 公司产品 知识讲堂 行业咨询 联系我们

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