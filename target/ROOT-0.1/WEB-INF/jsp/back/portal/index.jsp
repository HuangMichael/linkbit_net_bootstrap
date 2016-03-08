<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<html lang="en">
<%@include file="../common/head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/header.jsp" %>

<div id="main-container">
<section id="page">
    <!-- SIDEBAR -->
    <%@include file="../common/siderBar.jsp" %>
    <!-- /SIDEBAR -->
    <div id="main-content">
        <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
        <div class="container">
            <div class="row">
                <div id="content" class="col-lg-12">
                    <!-- PAGE HEADER-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-header">
                                <!-- STYLER -->

                                <!-- /STYLER -->
                                <!-- BREADCRUMBS -->
                                <ul class="breadcrumb">
                                    <li>
                                        <i class="fa fa-home"></i>
                                        <a href="/back/">后台管理系统</a>
                                    </li>
                                    <li>门户</li>
                                </ul>
                                <!-- /BREADCRUMBS -->
                                <div class="clearfix">

                                    <!-- /DATE RANGE PICKER -->
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /PAGE HEADER -->
<%--
                    //所有产品信息数量
                    private long allProductsCount;
                    //所有新闻信息数量
                    private long allNewsCount;
                    //所有知识信息数量
                    private long allKnowlegeCount;
                    //所有客户信息数量
                    private long allCustomersCount;
                    //所有留言信息数量
                    private long allMessageCount;--%>


                    <!-- DASHBOARD CONTENT -->
                    <div class="row">
                        <!-- COLUMN 1 -->
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashbox panel panel-default">
                                        <div class="panel-body">
                                            <div class="panel-left red">
                                                <i class="fa fa-instagram fa-3x"></i>
                                            </div>
                                            <div class="panel-right">
                                                <div class="number">${portalNumberDTO.allProductsCount}</div>
                                                <div class="title">产品总数量</div>
												<span class="label label-success">
													${portalNumberDTO.allProductsCount}
												</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashbox panel panel-default">
                                        <div class="panel-body">
                                            <div class="panel-left blue">
                                                <i class="fa fa-twitter fa-3x"></i>
                                            </div>
                                            <div class="panel-right">
                                                <div class="number"> ${portalNumberDTO.allCustomersCount}</div>
                                                <div class="title">客户总数量</div>
												<span class="label label-warning">
                                                   3
												</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="quick-pie panel panel-default">
                                        <div class="panel-body">
                                            <div class="col-md-4 text-center">
                                                <div id="dash_pie_1" class="piechart" data-percent="59">
                                                    <span class="percent"></span>
                                                </div>
                                                <a href="#" class="title">知识信息 <i class="fa fa-angle-right"></i></a>
                                            </div>
                                            <div class="col-md-4 text-center">
                                                <div id="dash_pie_2" class="piechart" data-percent="73">
                                                    <span class="percent"></span>
                                                </div>
                                                <a href="#" class="title">北斗新闻 <i class="fa fa-angle-right"></i></a>
                                            </div>
                                            <div class="col-md-4 text-center">
                                                <div id="dash_pie_3" class="piechart" data-percent="90">
                                                    <span class="percent"></span>
                                                </div>
                                                <a href="#" class="title">留言信息<i
                                                        class="fa fa-angle-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /COLUMN 1 -->

                        <!-- COLUMN 2 -->
                        <div class="col-md-6">
                            <div class="box solid grey">
                                <div class="box-title">
                                    <h4><i class="fa fa-dollar"></i>网站访问量统计</h4>

                                    <div class="tools">
											<span class="label label-danger">
												20% <i class="fa fa-arrow-up"></i>
											</span>
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
                                    <div id="chart-revenue" style="height:240px"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /COLUMN 2 -->
                    </div>
                    <!-- /DASHBOARD CONTENT -->
                    <!-- HERO GRAPH -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border blue">
                                <div class="box-title">
                                    <h4><i class="fa fa-bars"></i> <span
                                            class="hidden-inline-mobile">公司产品访问统计</span></h4>
                                </div>
                                <div class="box-body">
                                    <div class="tabbable header-tabs">
                                        <ul class="nav nav-tabs">
                                            <%--<li><a href="#box_tab2" data-toggle="tab"><i class="fa fa-search-plus"></i>
                                                <span class="hidden-inline-mobile">Select & Zoom Sales Chart</span></a>
                                            </li>--%>
                                            <li class="active"><a href="#box_tab1" data-toggle="tab"><i
                                                    class="fa fa-bar-chart-o"></i> <span class="hidden-inline-mobile">产品访问统计</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="box_tab1">
                                                <!-- TAB 1 -->
                                                <div id="chart-dash" class="chart"></div>
                                                <hr class="margin-bottom-0">
                                                <!-- /TAB 1 -->
                                            </div>
                                            <div class="tab-pane fade" id="box_tab2">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="demo-container">
                                                            <div id="placeholder" class="demo-placeholder"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="demo-container" style="height:100px;">
                                                            <div id="overview" class="demo-placeholder"></div>
                                                        </div>
                                                        <div class="well well-bottom">
                                                            <h4>Month over Month Analysis</h4>
                                                            <ol>
                                                                <li>Selection support makes it easy to construct
                                                                    flexible zooming schemes.
                                                                </li>
                                                                <li>With a few lines of code, the small overview plot to
                                                                    the right has been connected to the large plot.
                                                                </li>
                                                                <li>Try selecting a rectangle on either of them.</li>
                                                            </ol>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /BOX -->
                        </div>
                    </div>
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
</div>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- JQUERY -->
<script src="js/jquery/jquery-2.0.3.min.js"></script>
<!-- JQUERY UI-->
<script src="js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
<!-- BOOTSTRAP -->
<script src="bootstrap-dist/js/bootstrap.min.js"></script>


<!-- DATE RANGE PICKER -->
<script src="js/bootstrap-daterangepicker/moment.min.js"></script>

<script src="js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
<!-- SLIMSCROLL -->
<script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
<!-- SLIMSCROLL -->
<script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
<!-- BLOCK UI -->
<script type="text/javascript" src="js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
<!-- SPARKLINES -->
<script type="text/javascript" src="js/sparklines/jquery.sparkline.min.js"></script>
<!-- EASY PIE CHART -->
<script src="js/jquery-easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/easypiechart/jquery.easypiechart.min.js"></script>
<!-- FLOT CHARTS -->
<script src="js/flot/jquery.flot.min.js"></script>
<script src="js/flot/jquery.flot.time.min.js"></script>
<script src="js/flot/jquery.flot.selection.min.js"></script>
<script src="js/flot/jquery.flot.resize.min.js"></script>
<script src="js/flot/jquery.flot.pie.min.js"></script>
<script src="js/flot/jquery.flot.stack.min.js"></script>
<script src="js/flot/jquery.flot.crosshair.min.js"></script>
<!-- TODO -->
<script type="text/javascript" src="js/jquery-todo/js/paddystodolist.js"></script>
<!-- TIMEAGO -->
<script type="text/javascript" src="js/timeago/jquery.timeago.min.js"></script>
<!-- FULL CALENDAR -->
<script type="text/javascript" src="js/fullcalendar/fullcalendar.min.js"></script>
<!-- COOKIE -->
<script type="text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
<!-- GRITTER -->
<script type="text/javascript" src="js/gritter/js/jquery.gritter.min.js"></script>
<!-- CUSTOM SCRIPT -->
<script src="js/script.js"></script>
<script>
    jQuery(document).ready(function () {
        App.setPage("index");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- /JAVASCRIPTS -->
</body>
</html>
