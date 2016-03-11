<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>

<style type="text/css">
    #bom {
        position: fixed;
        left: 0px;
        bottom: 0;
        _position: absolute;
        _top: expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight);
        background: #575859;
        width: 100%;
    }</style>
<div id="bom" class="footer">
    <div class="container">
        <div class="col-md-12">
            <p>&copy;该网站版权归<a href="/front/index">江苏凌比特微电子技术有限公司</a>所有<a href="/back/logout"
                                                                         style="color:#575859;">管理入口</a>
                备案/许可证号：<a href="http://www.miibeian.gov.cn/">苏ICP备16007070号-2</a></p>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<script src="/front/plugins/jPages-master/js/js.js"></script>
<script src="/front/plugins/jPages-master/js/jPages.js"></script>
<script src="/back/js/terebentina-sco.js/js/sco.confirm.js"></script>
<script>
    /*    $(function () {
     var url = "/back/menu/findFrontMenus";
     $.getJSON(url, function (data) {
     var html = "";
     for (var x in data) {
     html += "<li>";
     html += '<a href="' + data[x].url + '" data-hover="' + data[x]["menuDesc"] + '">' + data[x]["menuDesc"] + '</a>';
     html += "</li>";
     }
     $("#menu_ul").html(html);
     });
     });*/
</script>


