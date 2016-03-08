<%@page pageEncoding="UTF-8" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<div class="about-section">
    <div class="container" style="min-height: 604px">
        <div class="main">

            <div class="communt">
                <div class="communt-left">
                    <i class="glyphicon glyphicon-home"></i>
                </div>
                <div class="communt-right">
                    <h4>产品名称</h4>
                    <p>${product.productName}</p>

                </div>

                <div class="clearfix"> </div>
            </div>
            <div class="communt">
                <div class="communt-left">
                    <i class="glyphicon glyphicon-calendar"></i>
                </div>
                <div class="communt-right">
                    <h4>上市时间</h4>
                    <p>${product.onLineDate}</p>

                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="communt">
                <div class="communt-left">
                    <i class="glyphicon glyphicon-calendar"></i>
                </div>
                <div class="communt-right">
                    <h4>产品描述</h4>
                    <p>${product.productDesc}</p>
                </div>
                <div class="clearfix"> </div>
            </div>


            <%--<div class="details">
                <h3 class="style1">产品详细描述</h3>
                <div class="det_pic">
                    <img src="images/gallery3.jpg" class="img-responsive" alt="">
                </div>
                <div class="det_text">
                    <p class="para1">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. </p>
                    <p class="para1">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics</p>
                </div>
                <div class="clear"></div>
            </div>--%>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>