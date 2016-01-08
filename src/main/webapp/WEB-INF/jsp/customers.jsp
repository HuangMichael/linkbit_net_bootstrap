<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<jsp:include page="header.jsp"/>
<div class="content_bg">
    <div class="container">
        <div class="register">
            <form>
                <div class="register-top-grid">
                    <h3>个人信息</h3>

                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>姓名<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>联系方式<label>*</label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>单位名称<label></label></span>
                        <input type="text">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>电子邮箱<label></label></span>
                        <input type="text">
                    </div>
                    <div class="clearfix"></div>

                </div>
            </form>
            <div class="clearfix"></div>
            <div class="register-but">
                <form>
                    <input type="submit" value="提交">
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>