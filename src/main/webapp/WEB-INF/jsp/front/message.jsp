<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp" flush="true"/>

<div class="about-section">
    <div class="container" style="min-height: 604px">
        <div class="register">
            <div class="col-md-6">
                <img src="images/message/service.png"
                     class="img-responsive img-thumbnail img-rounded message_bg">
            </div>
            <div class="col-md-6">
                <form id="messageForm" method="post" action="/front/message/save" >
                    <div class="register-top-grid">
                        <h3>您的联系方式</h3>
                        <div class="col-md-6"><span>姓名<label>*</label></span>
                            <input type="text" id="userName" name="userName" required></div>
                        <div class="col-md-6"><span>电话<label>*</label></span>
                            <input type="text" id="telephone" name="telephone" required></div>
                        <div class="col-md-6"><span>工作单位<label>*</label></span>
                            <input type="text" id="workplace" name="workplace"></div>
                        <div class="col-md-6"><span>电子邮箱<label>*</label></span>
                            <input type="text" id="email" name="email"></div>
                        <div class="col-md-6"><span>留言<label>*</label></span>
                            <textarea id="content" name="content" cols="45" rows="5" required></textarea></div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="register-but">
                        <input type="submit" class=" btn btn-primary" id="send" value="发送给我们">
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</div>
<!-- footer -->
<div class="forever-bottom">
    <jsp:include page="footer.jsp" flush="true"/>
</div>
<!-- footer -->
<script type="text/javascript">
    $(function () {
       /* $("#messageForm").on("submit", function () {
            var url = "/front/message/save";
            var message = {
                userName: $("#userName").val(),
                telephone: $("#telephone").val(),
                worksplace: $("#worksplace").val(),
                email: $("#email").val(),
                content: $("#content").val()
            };

            console.log("message---------------"+JSON.stringify(message));

            return;
          *//*  $.post(url, message,
                    function (data) {
                        $("#send").val("保存成功");
                        $("#send").attr("disabled", "disabled")

                    });*//*
        })*/
    });
</script>
</body>

</html>