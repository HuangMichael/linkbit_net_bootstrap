<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp" flush="true"/>

<div class="content_bg">
    <div class="container">
        <div class="register">
            <div class="col-md-6">
                <img src="images/message/service.png"
                     class="img-responsive img-thumbnail img-rounded message_bg">
            </div>
            <div class="col-md-6">
                <form id="messageForm" action="/message0/save" action="post">
                    <div class="register-top-grid">
                        <h3>您的联系方式</h3>
                        <div class="col-md-6"><span>姓名<label>*</label></span>
                            <input type="text" id="userName" name="message.userName" required></div>
                        <div class="col-md-6"><span>电话<label>*</label></span>
                            <input type="text" id="telephone" name="message.telephone" required></div>
                        <div class="col-md-6"><span>工作单位<label>*</label></span>
                            <input type="text" id="workplace" name="message.workplace"></div>
                        <div class="col-md-6"><span>电子邮箱<label>*</label></span>
                            <input type="text" id="email" name="message.email"></div>
                        <div class="col-md-6"><span>留言<label>*</label></span>
                            <textarea id="content" name="msg" cols="45" rows="5" required></textarea></div>
                        <div class="clearfix"></div>
                    </div>
                <div class="clearfix"></div>
                <div class="register-but">
                    <input type="button" id="send" value="发送给我们">
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
        $("#send").on("click", function () {
            var url = "/message0/save";
            var message = new Object();
            message.userName = $("#userName").val();
            message.telephone = $("#telephone").val();
            message.worksplace = $("#worksplace").val();
            message.email = $("#email").val();
            message.content = $("#content").val();
            $.ajax({
                type: "POST",
                url: url,
                data: message,
                success: function (data) {
                    $("#send").val("保存成功");
                    $("#send").attr("disabled", "disabled")
                }
            });

        })
    });
</script>
</body>

</html>