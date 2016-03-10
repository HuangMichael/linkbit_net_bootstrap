<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css" />
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


                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">

                                            <div class="col-sm-2">
                                                <img src="${company.logoPath}" width="200px" />
                                            </div>
                                            <div class="col-sm-10">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="ds_host">公司名称</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_host" type="text"
                                                               value="${company.companyName}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="ds_name">公司地址</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="ds_name" type="text"
                                                               value="${company.address}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="longtitude">维度</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="longtitude" type="text"
                                                               value="${company.longtitude}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="latitude">经度</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="latitude" type="text"
                                                               value="${company.latitude}" readonly/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="telephone">电话</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="telephone" type="text"
                                                               value="${company.telephone}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="fax">传真</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="fax" type="text"
                                                               value="${company.fax}" readonly/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label" for="buildDate">成立日期</label>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" id="buildDate" type="date"
                                                               value="${company.buildDate}" readonly/>
                                                    </div>
                                                    <label class="col-sm-1 control-label" for="status">状态</label>
                                                    <div class="col-sm-5">
                                                        <form:select id="status" path="company.status"
                                                                     cssClass="form-control"
                                                                     itemValue="${company.status}">
                                                            <form:option value="1">是</form:option>
                                                            <form:option value="0">否</form:option>
                                                        </form:select>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                    <form id="uploadForm" method="post" class="form-horizontal" role="form"
                                          enctype="multipart/form-data" id="uploadForm" action="/back/company/upload">
                                           <div class="form-group">
                                               <input type="hidden" name="companyId" id="companyId" value="${company.id}"/>
                                               <input type="hidden" name="fileName" id="fileName"/>
                                               <label class="col-sm-1 control-label" for="file">上传图片</label>

                                               <div class="col-sm-6">
                                                   <input type="file" class="form-control" name="file" id="file"
                                                          required>
                                               </div>
                                               <div class="col-sm-1">
                                                   <input type="submit" value="上传" id="submit" class="form-control btn-primary">
                                               </div>
                                           </div>
                                       </form>


                                </div>

                                </div>
                            </div>

                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <div class="box-title">
                                    <h4><i class="fa fa-table"></i>公司属性</h4>
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
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>属性标题</th>
                                            <th>属性描述</th>
                                            <th>图片</th>
                                            <th>是否显示</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${company.companyPropertyList}" var="p" varStatus="status">
                                            <tr>
                                                <td>${status.index+1}</td>
                                                <td>${p.title}</td>
                                                <td>${p.propertyDesc}</td>
                                                <td><img src="${p.imgUrl}" width="20px" height="20px"
                                                         class="img-circle"/></td>
                                                <td>
                                                    <c:if test="${p.status}">是</c:if>
                                                    <c:if test="${!p.status}">否</c:if>
                                                </td>
                                                <td><a name="delBtn" data-pid="${p.id}">删除</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /BOX -->
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


<div class="modal fade" id="createModal" tabindex="-1"
     role="dialog" aria-labelledby="createModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="createModalLabel">新建公司属性信息</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control"
                           id="title"
                           name="title" value="${companyProperty.title}" required>
                </div>
                <div class="form-group">
                    <label for="propertyDesc">属性描述</label>
                    <input type="text" class="form-control"
                           id="propertyDesc"
                           name="propertyDesc" value="${companyProperty.propertyDesc}" required>
                </div>
                <div class="form-group">
                    <label for="content">属性值</label>
                    <input type="hidden" value="${company.id}" name="cid" id="cid" required/>

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
                <div class="form-group">
                    <label for="status">使用状态</label>
                    <select class="form-control"
                            id="status"
                            name="user.status">
                        <option value="1" selected>启用</option>
                        <option value="0">禁用</option>
                    </select>
                </div>


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
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<%@include file="../common/footer.jsp" %>
<script>
    $(function () {
       /* App.setPage("forms");  //Set current page*/

        App.setPage("rich_text_editors");
        App.init(); //Initialise plugins and elements
    });
</script><!-- /JAVASCRIPTS -->

<script type="text/javascript">
    $(function () {
        /**
         * 提交上传文件
         * */
        $("#submit").on("click", function (data) {
            var fullName = $("#file").val();
            $("#uploadForm").attr("action", url);
            $("#uploadForm").submit();

        });

        $("#file").on("change", function () {
            $("#fileName").val((getFileName($(this).val())));
        });


        /**
         * 获取文件名称
         * */
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
                }


    });


    //新建记录
    $("#create").click(function () {
        var title = $("#title").val();
        var propertyDesc = $("#propertyDesc").val();
        var content = $("#editor").html().trim();
        var status = $("#status").val();
        var cid =$("#cid").val();
        var companyProperty = {
            title: title,
            propertyDesc: propertyDesc,
            content: content,
            imgUrl:"as",
            status: status

        };
        console.log("companyProperty-------------" + JSON.stringify(companyProperty));
        console.log("cid-------------" + cid);
        $.ajax({
            type: "POST",
            url: "/back/company/saveProperty",
            data: {"companyProperty": companyProperty},
            success: function (msg) {
                $("#createModal").modal('hide');
                //App.init();
                $.bootstrapGrowl("公司属性信息添加成功！", {
                    type: 'info',
                    align: 'right',
                    stackup_spacing: 30
                });
                $(this).attr("disabled", "disabled");

            },
            error: function () {
                $.bootstrapGrowl("公司属性信息添加失败！", {
                    type: 'danger',
                    align: 'right',
                    stackup_spacing: 30
                });
            }
        });
    });
</script>


</body>
</html>
