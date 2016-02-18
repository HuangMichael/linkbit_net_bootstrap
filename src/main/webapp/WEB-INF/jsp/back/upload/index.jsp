<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
<!--/HEADER -->
<!-- PAGE -->
<section id="page">
    <!-- SIDEBAR -->
    <%@include file="../common/siderBar.jsp" %>
    <!-- /SIDEBAR -->
    <div id="main-content">
        <div class="container">
            <form method="POST" enctype="multipart/form-data" id="uploadForm" action="/back/upload/upload">
                文件上传: <input type="file" name="file" id="file"><br/> 文件名: <input
                    type="text" name="fileName" id="fileName"> <input type="submit" value="上传" id="submit">
            </form>
        </div>
    </div>
</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        /**
         * 提交上传文件
         * */
        $("#submit").on("click", function (data) {
            var fullName = $("#file").val();
            var fileName = fullName.substring(lastIndexOf("/"), fullName.length);
            $("#uploadForm").attr("action", url);
            var file = $("#file").val();
            var fileName = getFileName(file);
            console.log("fullName-------" + fullName);

            alert(fileName);
            $("#uploadForm").submit();

        })

        $("#file").on("change",function(){
            $("#fileName").val((getFileName($(this).val())));
        })


        /**
         * 获取文件名称
         * */
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
        }


    })
</script>

</body>
</html>
