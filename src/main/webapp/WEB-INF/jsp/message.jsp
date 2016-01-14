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
                <form>
                    <div class="register-top-grid">
                        <h3>您的联系方式</h3>

                        <div class="col-md-6"><span>姓名<label>*</label></span>
                            <input type="text"></div>
                        <div class="col-md-6"><span>电话<label>*</label></span>
                            <input type="text"></div>
                        <div class="col-md-6"><span>工作单位<label>*</label></span>
                            <input type="text"></div>
                        <div class="col-md-6"><span>电子邮箱<label>*</label></span>
                            <input type="text"></div>
                        <div class="col-md-6"><span>留言<label>*</label></span>
                            <textarea name="msg" cols="45" rows="5"></textarea></div>
                        <div class="clearfix"></div>
                    </div>
                    <%--<div class="register-bottom-grid">
                        <h3>LOGIN INFORMATION</h3>

                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                            <span>Password<label>*</label></span>
                            <input type="text">
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Confirm Password<label>*</label></span>
                            <input type="text">
                        </div>
                    </div>--%>
                </form>
                <div class="clearfix"></div>
                <div class="register-but">
                    <form>
                        <input type="submit" value="发送给我们">

                        <div class="clearfix"></div>
                    </form>
                </div>
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
</body>

</html>