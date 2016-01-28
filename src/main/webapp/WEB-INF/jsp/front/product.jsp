<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="head.jsp" flush="true"/>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header -->
<div class="about-section">
    <div class="container">
        <div class="main">
            <div id="mi-slider" class="mi-slider">
                <c:forEach items="${productTypeList}" var="type">
                    <ul>
                        <c:forEach items="${type.productList}" var="p">
                            <li><a href="/product/detail/${p.id}">
                                <img src="${p.productImgUrl}" alt="${p.productName}" id="${p.id}" title="${p.productName}">
                                <h4>${p.productName}</h4></a></li>
                        </c:forEach>
                    </ul>
                </c:forEach>
                <nav>
                    <c:forEach items="${productTypeList}" var="type">
                    <a href="#">${type.typeName}</a>
                   </c:forEach>
                </nav>
            </div>
        </div>
        <div style="min-height: 80px" id="productDetail"></div>
    </div>
</div>
<script>
    $('#mi-slider').catslider();

  /*  $("img").on("click", function () {
        $("#productDetail").append('<div style="min-height: 600px">this is detail</div>');
    })*/
</script>

<jsp:include page="footer.jsp"/>
<!-- footer -->
</body>
</html>