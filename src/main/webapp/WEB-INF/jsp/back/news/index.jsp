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
            <div class="row">
                <div id="content" class="col-lg-12">
                    <%@include file="../common/banner.jsp" %>
                    <!-- TABLE IN MODAL -->
                    <!-- EXPORT TABLES -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <%@include file="../common/menu.jsp" %>
                                <div class="box-body">
                                    <button type="button" class="btn btn-default btn-mini navbar-btn"
                                            data-toggle="modal"
                                            data-target="#createModal">新建记录
                                    </button>
                                    <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                                           class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="center">序号</th>
                                            <th class="center">新闻标题</th>
                                            <th class="center">新闻描述</th>
                                            <th class="center hidden-xs">发布时间</th>
                                            <th class="center hidden-xs">是否显示</th>
                                            <th class="center ">编辑</th>
                                            <th class="center ">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        <c:forEach items="${newsList}" var="news" varStatus="status">
                                            <tr class="gradeX" id="tr${news.id}">
                                                <td class="center">${status.index+1}</td>
                                                <td class="center"><a
                                                        href="/back/news/detail/${news.id}">${news.newsTitle}</a>
                                                </td>
                                                <td class=" center">${news.newsDesc}</td>
                                                <td class=" center hidden-xs"><fmt:formatDate
                                                        value="${news.publishTime}" pattern="yyyy-MM-dd"/></td>
                                                    <%-- <td class=" center hidden-xs">${news.display}</td>--%>
                                                <td class=" center hidden-xs">


                                                    <c:if test="${news.status==1}">是</c:if>
                                                    <c:if test="${news.status!=1}">否</c:if>


                                                </td>
                                                <td class="center "><a href="/back/news/edit/${news.id}">编辑</a></td>
                                                <td class="center "><a  id="delBtn${news.id}">删除</a>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /BOX -->
                        </div>
                    </div>
                    <!-- /EXPORT TABLES -->
                    <div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i>回到顶部
							</span>
                    </div>
                </div><!-- /CONTENT-->
            </div>
        </div>
    </div>


   <div class="modal fade" id="createModal" tabindex="-1"
          role="dialog" aria-labelledby="myModalLabel2">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                             aria-label="Close"><span
                             aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title" id="myModalLabel2">新建新闻信息</h4>
                 </div>

                 <div class="modal-body">
                     <form id="newsCreateForm">
                         <div class="form-group">
                             <label for="newsTitle">新闻标题</label>
                             <input type="text" class="form-control"
                                    id="newsTitle"
                                    name="newsTitle" required>
                         </div>
                         <div class="form-group">
                             <label for="keywords">关键字</label>
                             <input type="text" class="form-control"
                                    id="keywords"
                                    name="keywords" required>
                         </div>
                         <div class="form-group">
                             <label for="newsDesc">摘要</label>
                             <input type="text" class="form-control"
                                    id="newsDesc"
                                    name="newsDesc" required
                             >
                         </div>
                         <div class="form-group">
                             <label for="status">是否启用</label>
                             <select class="form-control" name="status" id="status" required>
                                 <option value="">请选择</option>
                                 <option value="1">是</option>
                                 <option value="0">否</option>
                             </select>
                         </div>

                         <div class="form-group">
                             <label for="showInMainPage">主页显示</label>
                             <select class="form-control" name="showInMainPage" id="showInMainPage" required>
                                 <option value="">请选择</option>
                                 <option value="1">是</option>
                                 <option value="0">否</option>
                             </select>
                         </div>

                         <div class="form-group">

                             <label for="editor">内容</label>
                             <div class="box border">
                                 <div class="box-title">
                                     <h4><i class="fa fa-pencil-square-o"></i>
                                     </h4>

                                     <div class="tools hidden-xs">
                                         <a href="#box-config" data-toggle="modal" class="config">
                                             <i class="fa fa-cog"></i>
                                         </a>
                                         <a href="javascript:;" class="reload">
                                             <i class="fa fa-refresh"></i>
                                         </a>
                                         <a href="javascript:;" class="collapse">
                                             <i class="fa fa-chevron-up"></i>
                                         </a>
                                         <a href="javascript:;" class="remove">
                                             <i class="fa fa-times"></i>
                                         </a>
                                     </div>
                                 </div>
                                 <div class="box-body">
                                     <div id="alerts"></div>
                                     <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
                                         <div class="btn-group">
                                             <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title=""
                                                data-original-title="Font"><i class="fa fa-font"></i><b
                                                     class="caret"></b></a>
                                             <ul class="dropdown-menu">
                                                 <li><a data-edit="fontName Serif" style="font-family:'Serif'">Serif</a>
                                                 </li>
                                                 <li><a data-edit="fontName Sans" style="font-family:'Sans'">Sans</a>
                                                 </li>
                                                 <li><a data-edit="fontName Arial" style="font-family:'Arial'">Arial</a>
                                                 </li>
                                                 <li><a data-edit="fontName Arial Black"
                                                        style="font-family:'Arial Black'">Arial Black</a></li>
                                                 <li><a data-edit="fontName Courier" style="font-family:'Courier'">Courier</a>
                                                 </li>
                                                 <li><a data-edit="fontName Courier New"
                                                        style="font-family:'Courier New'">Courier New</a></li>
                                                 <li><a data-edit="fontName Comic Sans MS"
                                                        style="font-family:'Comic Sans MS'">Comic Sans MS</a></li>
                                                 <li><a data-edit="fontName Helvetica" style="font-family:'Helvetica'">Helvetica</a>
                                                 </li>
                                                 <li><a data-edit="fontName Impact"
                                                        style="font-family:'Impact'">Impact</a></li>
                                                 <li><a data-edit="fontName Lucida Grande"
                                                        style="font-family:'Lucida Grande'">Lucida Grande</a></li>
                                                 <li><a data-edit="fontName Lucida Sans"
                                                        style="font-family:'Lucida Sans'">Lucida Sans</a></li>
                                                 <li><a data-edit="fontName Tahoma"
                                                        style="font-family:'Tahoma'">Tahoma</a></li>
                                                 <li><a data-edit="fontName Times" style="font-family:'Times'">Times</a>
                                                 </li>
                                                 <li><a data-edit="fontName Times New Roman"
                                                        style="font-family:'Times New Roman'">Times New Roman</a></li>
                                                 <li><a data-edit="fontName Verdana" style="font-family:'Verdana'">Verdana</a>
                                                 </li>
                                             </ul>
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title=""
                                                data-original-title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
                                                     class="caret"></b></a>
                                             <ul class="dropdown-menu">
                                                 <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                                                 <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                                                 <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                                             </ul>
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default" data-edit="bold" title=""
                                                data-original-title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                                             <a class="btn btn-default" data-edit="italic" title=""
                                                data-original-title="Italic (Ctrl/Cmd+I)"><i
                                                     class="fa fa-italic"></i></a>
                                             <a class="btn btn-default" data-edit="strikethrough" title=""
                                                data-original-title="Strikethrough"><i
                                                     class="fa fa-strikethrough"></i></a>
                                             <a class="btn btn-default" data-edit="underline" title=""
                                                data-original-title="Underline (Ctrl/Cmd+U)"><i
                                                     class="fa fa-underline"></i></a>
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default" data-edit="insertunorderedlist" title=""
                                                data-original-title="Bullet list"><i class="fa fa-list-ul"></i></a>
                                             <a class="btn btn-default" data-edit="insertorderedlist" title=""
                                                data-original-title="Number list"><i class="fa fa-list-ol"></i></a>
                                             <a class="btn btn-default" data-edit="outdent" title=""
                                                data-original-title="Reduce indent (Shift+Tab)"><i
                                                     class="fa fa-outdent"></i></a>
                                             <a class="btn btn-default" data-edit="indent" title=""
                                                data-original-title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default" data-edit="justifyleft" title=""
                                                data-original-title="Align Left (Ctrl/Cmd+L)"><i
                                                     class="fa fa-align-left"></i></a>
                                             <a class="btn btn-default" data-edit="justifycenter" title=""
                                                data-original-title="Center (Ctrl/Cmd+E)"><i
                                                     class="fa fa-align-center"></i></a>
                                             <a class="btn btn-default" data-edit="justifyright" title=""
                                                data-original-title="Align Right (Ctrl/Cmd+R)"><i
                                                     class="fa fa-align-right"></i></a>
                                             <a class="btn btn-default" data-edit="justifyfull" title=""
                                                data-original-title="Justify (Ctrl/Cmd+J)"><i
                                                     class="fa fa-align-justify"></i></a>
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title=""
                                                data-original-title="Hyperlink"><i class="fa fa-link"></i></a>

                                             <div class="dropdown-menu input-append">
                                                 <input class="span2" placeholder="URL" type="text"
                                                        data-edit="createLink">
                                                 <button class="btn btn-default" type="button">Add</button>
                                             </div>
                                             <a class="btn btn-default" data-edit="unlink" title=""
                                                data-original-title="Remove Hyperlink"><i class="fa fa-scissors"></i></a>

                                         </div>

                                         <div class="btn-group">
                                             <a class="btn btn-default" title="" id="pictureBtn"
                                                data-original-title="Insert picture (or just drag &amp; drop)"><i
                                                     class="fa fa-picture-o"></i></a>
                                             <input type="file" data-role="magic-overlay" data-target="#pictureBtn"
                                                    data-edit="insertImage"
                                                    style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 41px; height: 34px;">
                                         </div>
                                         <div class="btn-group">
                                             <a class="btn btn-default" data-edit="undo" title=""
                                                data-original-title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                                             <a class="btn btn-default" data-edit="redo" title=""
                                                data-original-title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                         </div>
                                         <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech=""
                                                style="display: none;">
                                     </div>
                                     <div id="editor" contenteditable="true">
                                     </div>
                                 </div>
                             </div>


                         </div>


                     </form>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                             data-dismiss="modal">关闭
                     </button>
                     <button type="button" id="create" name="createBtn"
                             class="btn btn-primary">保存
                     </button>
                 </div>
             </div>
         </div>
     </div>

</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        App.setPage("dynamic_table");  //Set current page
  /*      App.setPage("rich_text_editors");*/
        App.init(); //Initialise plugins and elements
    });



    //新建记录
    $("#create").on("click", function () {
        var news = {
            newsTitle: $("#newsTitle").val(),
            keywords: $("#keywords").val(),
            newsDesc: $("#newsDesc").val(),
            //publisher: $("#publisher").val(),
            newsContent: $("#editor").html(),
            status: $("#status").val(),
            showInMainPage: $("#showInMainPage").val()
        };
        $.ajax({
            type: "POST",
            url: "/back/news/save",
            data: news,
            success: function (msg) {
                $("#createModal").modal('hide');
              //  addRow(news);
                $.bootstrapGrowl("新闻信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("新闻信息添加失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    })
    ;


    /*var addRow = function (news) {
        var dateString = news.onLineDate.Format('yyyy-MM-dd');
        var html = '<tr class="gradeX">';
        html += '<td class="center">1</td>';
        html += '<td class ="center"><a href ="#" data-toggle="modal" data-target="#myModal" >' + news.newsName + '</a></td>';
        html += '<td class= "center hidden-xs" >' + news.newsType + '</td>';
        html += '<td class= "center hidden-xs" >' + dateString + ' </td>';
        html += '<td class = "center">' + news.newsDesc + '</td>';
        html += '<td class = "center"><a href = "#" > 编辑 </a> </td>';
        html += '<td class  = "center"><a id = "delBtn">删除</a></td>';
        html += '</tr>';
        $("#tbody").prepend(html);
    };*/


    //删除操作

    $("a[id^=delBtn]").on("click", function () {
        var id = $(this).attr("id").substring(6);
        $.ajax({
            type: "POST",
            url: "/back/news/delete/" + id,
            success: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("新闻信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            },
            error: function () {
                $("#tr" + id).fadeOut("slow");
                $.bootstrapGrowl("新闻信息删除成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });
</script><!-- /JAVASCRIPTS -->
</body>
</html>
