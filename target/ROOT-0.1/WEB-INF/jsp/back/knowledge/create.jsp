<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css"/>
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
                                    <a type="button" class="btn btn-default btn-mini navbar-btn"
                                       href="/back/knowledge/index">信息列表 </a>

                                    <form id="createForm" class="form-horizontal" role="form" action="/back/knowledge/save" method="post">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="title">主题</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="title" type="text"
                                                               name="title" value="${knowledge.title}" required/>
                                                    </div>

                                                    <label class="col-sm-2 control-label" for="knowledgeDesc">描述</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="knowledgeDesc" type="text"
                                                               name="knowledgeDesc" value="${knowledge.knowledgeDesc}"
                                                               required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="keywords">关键字</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="keywords" type="text"
                                                               name="keywords" value="${knowledge.keywords}" required/>
                                                    </div>
                                                    <label class="col-sm-2 control-label"
                                                           for="showInMainPage">主页显示</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="showInMainPage" type="text"
                                                               name="showInMainPage" value="${knowledge.showInMainPage}"
                                                               required/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="publisher">发布人</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="publisher" type="text"
                                                               name="publisher" value="${knowledge.publisher}" required
                                                               readonly/>
                                                    </div>
                                                    <label class="col-sm-2 control-label" for="publishTime">发布时间</label>

                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="publishTime" type="text"
                                                               name="publishTime" value="2016-03-01" required
                                                               />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-12">
                                                        <div id="alerts"></div>
                                                        <div class="btn-toolbar" data-role="editor-toolbar"
                                                             data-target="#editor">
                                                            <div class="btn-group">
                                                                <a class="btn btn-default dropdown-toggle"
                                                                   data-toggle="dropdown" title=""
                                                                   data-original-title="Font"><i class="fa fa-font"></i><b
                                                                        class="caret"></b></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a data-edit="fontName Serif"
                                                                           style="font-family:'Serif'">Serif</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Sans"
                                                                           style="font-family:'Sans'">Sans</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Arial"
                                                                           style="font-family:'Arial'">Arial</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Arial Black"
                                                                           style="font-family:'Arial Black'">Arial
                                                                        Black</a></li>
                                                                    <li><a data-edit="fontName Courier"
                                                                           style="font-family:'Courier'">Courier</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Courier New"
                                                                           style="font-family:'Courier New'">Courier
                                                                        New</a></li>
                                                                    <li><a data-edit="fontName Comic Sans MS"
                                                                           style="font-family:'Comic Sans MS'">Comic
                                                                        Sans MS</a></li>
                                                                    <li><a data-edit="fontName Helvetica"
                                                                           style="font-family:'Helvetica'">Helvetica</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Impact"
                                                                           style="font-family:'Impact'">Impact</a></li>
                                                                    <li><a data-edit="fontName Lucida Grande"
                                                                           style="font-family:'Lucida Grande'">Lucida
                                                                        Grande</a></li>
                                                                    <li><a data-edit="fontName Lucida Sans"
                                                                           style="font-family:'Lucida Sans'">Lucida
                                                                        Sans</a></li>
                                                                    <li><a data-edit="fontName Tahoma"
                                                                           style="font-family:'Tahoma'">Tahoma</a></li>
                                                                    <li><a data-edit="fontName Times"
                                                                           style="font-family:'Times'">Times</a>
                                                                    </li>
                                                                    <li><a data-edit="fontName Times New Roman"
                                                                           style="font-family:'Times New Roman'">Times
                                                                        New Roman</a></li>
                                                                    <li><a data-edit="fontName Verdana"
                                                                           style="font-family:'Verdana'">Verdana</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default dropdown-toggle"
                                                                   data-toggle="dropdown" title=""
                                                                   data-original-title="Font Size"><i
                                                                        class="fa fa-text-height"></i>&nbsp;<b
                                                                        class="caret"></b></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a data-edit="fontSize 5"><font
                                                                            size="5">Huge</font></a></li>
                                                                    <li><a data-edit="fontSize 3"><font
                                                                            size="3">Normal</font></a></li>
                                                                    <li><a data-edit="fontSize 1"><font
                                                                            size="1">Small</font></a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default" data-edit="bold" title=""
                                                                   data-original-title="Bold (Ctrl/Cmd+B)"><i
                                                                        class="fa fa-bold"></i></a>
                                                                <a class="btn btn-default" data-edit="italic" title=""
                                                                   data-original-title="Italic (Ctrl/Cmd+I)"><i
                                                                        class="fa fa-italic"></i></a>
                                                                <a class="btn btn-default" data-edit="strikethrough"
                                                                   title=""
                                                                   data-original-title="Strikethrough"><i
                                                                        class="fa fa-strikethrough"></i></a>
                                                                <a class="btn btn-default" data-edit="underline"
                                                                   title=""
                                                                   data-original-title="Underline (Ctrl/Cmd+U)"><i
                                                                        class="fa fa-underline"></i></a>
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default"
                                                                   data-edit="insertunorderedlist" title=""
                                                                   data-original-title="Bullet list"><i
                                                                        class="fa fa-list-ul"></i></a>
                                                                <a class="btn btn-default" data-edit="insertorderedlist"
                                                                   title=""
                                                                   data-original-title="Number list"><i
                                                                        class="fa fa-list-ol"></i></a>
                                                                <a class="btn btn-default" data-edit="outdent" title=""
                                                                   data-original-title="Reduce indent (Shift+Tab)"><i
                                                                        class="fa fa-outdent"></i></a>
                                                                <a class="btn btn-default" data-edit="indent" title=""
                                                                   data-original-title="Indent (Tab)"><i
                                                                        class="fa fa-indent"></i></a>
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default" data-edit="justifyleft"
                                                                   title=""
                                                                   data-original-title="Align Left (Ctrl/Cmd+L)"><i
                                                                        class="fa fa-align-left"></i></a>
                                                                <a class="btn btn-default" data-edit="justifycenter"
                                                                   title=""
                                                                   data-original-title="Center (Ctrl/Cmd+E)"><i
                                                                        class="fa fa-align-center"></i></a>
                                                                <a class="btn btn-default" data-edit="justifyright"
                                                                   title=""
                                                                   data-original-title="Align Right (Ctrl/Cmd+R)"><i
                                                                        class="fa fa-align-right"></i></a>
                                                                <a class="btn btn-default" data-edit="justifyfull"
                                                                   title=""
                                                                   data-original-title="Justify (Ctrl/Cmd+J)"><i
                                                                        class="fa fa-align-justify"></i></a>
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default dropdown-toggle"
                                                                   data-toggle="dropdown" title=""
                                                                   data-original-title="Hyperlink"><i
                                                                        class="fa fa-link"></i></a>

                                                                <div class="dropdown-menu input-append">
                                                                    <input class="span2" placeholder="URL" type="text"
                                                                           data-edit="createLink">
                                                                    <button class="btn btn-default" type="button">Add
                                                                    </button>
                                                                </div>
                                                                <a class="btn btn-default" data-edit="unlink" title=""
                                                                   data-original-title="Remove Hyperlink"><i
                                                                        class="fa fa-scissors"></i></a>

                                                            </div>

                                                            <div class="btn-group">
                                                                <a class="btn btn-default" title="" id="pictureBtn"
                                                                   data-original-title="Insert picture (or just drag &amp; drop)"><i
                                                                        class="fa fa-picture-o"></i></a>
                                                                <input type="file" data-role="magic-overlay"
                                                                       data-target="#pictureBtn"
                                                                       data-edit="insertImage"
                                                                       style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 41px; height: 34px;">
                                                            </div>
                                                            <div class="btn-group">
                                                                <a class="btn btn-default" data-edit="undo" title=""
                                                                   data-original-title="Undo (Ctrl/Cmd+Z)"><i
                                                                        class="fa fa-undo"></i></a>
                                                                <a class="btn btn-default" data-edit="redo" title=""
                                                                   data-original-title="Redo (Ctrl/Cmd+Y)"><i
                                                                        class="fa fa-repeat"></i></a>
                                                            </div>
                                                            <input type="text" data-edit="inserttext" id="voiceBtn"
                                                                   x-webkit-speech=""
                                                                   style="display: none;">
                                                        </div>

                                                        <input type="hidden" id="content_hidden" name="content"></div>
                                                    <div id="editor" contenteditable="true">
                                                        ${knowledge.content}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <a class="btn btn-default" href="/back/knowledge/index">关闭</a>
                                                <button type="submit" id="save${knowledge.id}" name="saveBtn"
                                                        class="btn btn-primary">保存
                                                </button>
                                            </div>
                                        </div>
                                </div>
                                </form>

                                </form>
                            </div>
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

</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
        App.setPage("rich_text_editors");
        App.init(); //Initialise plugins and elements
    });
</script><!-- /JAVASCRIPTS -->

<script type="text/javascript">
    $(function () {
        $(":submit").on("click", function () {
            var content=$("#editor").html();
            $("#content_hidden").val("content");
            $("#createForm").submit();
        });
    })
</script>


</body>
</html>
