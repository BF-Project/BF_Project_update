<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<style>
	.navbar-inverse .navbar-nav>.aaaa>a, .navbar-inverse .navbar-nav>.active>a:focus,
	.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}	
	</style>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.charts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.powercharts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.widgets.js"></script>
</head>
<body>
<script>
function getFormatDate(interval){
	
	var date = new Date();
	date.setDate(date.getDate()-interval);
	
	var year = date.getFullYear();                                 //yyyy
	var month = (1 + date.getMonth());                     //M
	month = month >= 10 ? month : '0' + month;     // month 두자리로 저장
	var day = date.getDate();                                      //d
	day = day >= 10 ? day : '0' + day;                            //day 두자리로 저장

	return  year + '-' + month + '-' + day;

}

FusionCharts.ready(function () {
	var today = new Date();
    var visitChart = new FusionCharts({
        type: 'mssplinearea',
        renderAt: 'chart-container',
        width: '1400',
        height: '400',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "날짜별 현황",
                "xAxisName": "Day",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",                        
                "subcaptionFontBold": "0",
                "paletteColors" : "#6baa01,#FFBB00,#FF3636",
                "usePlotGradientColor": "0",
                "bgColor" : "#ffffff",
                "showBorder" : "0",
                "showPlotBorder": "0",
                "showValues": "0",                 
                "showShadow" : "0",
                "showAlternateHGridColor" : "0",
                "showCanvasBorder": "0",
                "showXAxisLine": "1",
                "xAxisLineThickness": "1",
                "xAxisLineColor": "#999999",
                "canvasBgColor" : "#ffffff",
                "divlineAlpha" : "100",
                "divlineColor" : "#999999",
                "divlineThickness" : "1",
                "divLineIsDashed" : "1",
                "divLineDashLen" : "1",
                "divLineGapLen" : "1",
                "legendBorderAlpha": "0",
                "legendShadow": "0",
                "toolTipColor": "#ffffff",
                "toolTipBorderThickness": "0",
                "toolTipBgColor": "#000000",
                "toolTipBgAlpha": "80",
                "toolTipBorderRadius": "2",
                "toolTipPadding": "5"
            },
            
            "categories": [
                {
                    "category": [
						{ "label": getFormatDate(30) },                                 
						{ "label": getFormatDate(27) },                                 
						{ "label": getFormatDate(24) },
						{ "label": getFormatDate(21) },
                        { "label": getFormatDate(18) }, 
                        { "label": getFormatDate(15) }, 
                        { "label": getFormatDate(12) },
                        { "label": getFormatDate(9) }, 
                        { "label": getFormatDate(6) },
                        { "label": getFormatDate(3) }, 
                        { "label": getFormatDate(0) }
                    ]
                }
            ],
            "dataset": [
                {
                    "seriesname": "커뮤니티 게시글 수",
                    "data": [
						{ "value": "${countCmmt[10]}" }, 
						{ "value": "${countCmmt[9]}" }, 
						{ "value": "${countCmmt[8]}" }, 
						{ "value": "${countCmmt[7]}" }, 
                        { "value": "${countCmmt[6]}" }, 
                        { "value": "${countCmmt[5]}" }, 
                        { "value": "${countCmmt[4]}" }, 
                        { "value": "${countCmmt[3]}" }, 
                        { "value": "${countCmmt[2]}" }, 
                        { "value": "${countCmmt[1]}" }, 
                        { "value": "${countCmmt[0]}" }
                    ]
                }, 
                {
                    "seriesname": "자유게시판 게시글 수",
                    "data": [
                        { "value": "${countFree[10]}" }, 
						{ "value": "${countFree[9]}" }, 
						{ "value": "${countFree[8]}" }, 
						{ "value": "${countFree[7]}" }, 
                        { "value": "${countFree[6]}" }, 
                        { "value": "${countFree[5]}" }, 
                        { "value": "${countFree[4]}" }, 
                        { "value": "${countFree[3]}" }, 
                        { "value": "${countFree[2]}" }, 
                        { "value": "${countFree[1]}" }, 
                        { "value": "${countFree[0]}" }
                    ]
                },
                {
                    "seriesname": "회원수",
                    "data": [
                        { "value": "${countMbr[10]}" }, 
						{ "value": "${countMbr[9]}" }, 
						{ "value": "${countMbr[8]}" }, 
						{ "value": "${countMbr[7]}" }, 
                        { "value": "${countMbr[6]}" }, 
                        { "value": "${countMbr[5]}" }, 
                        { "value": "${countMbr[4]}" }, 
                        { "value": "${countMbr[3]}" }, 
                        { "value": "${countMbr[2]}" }, 
                        { "value": "${countMbr[1]}" }, 
                        { "value": "${countMbr[0]}" }
                    ]
                }
          
            ]
        }
    }).render();
});
</script>


<div id="wrapper">

	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						성공하는 사람들 <small></small>
					</h1>
					<ol class="breadcrumb">
						<li class="active">
						</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						<i class="fa fa-info-circle"></i> <strong>Admin Main</strong>
						<a
							href="http://startbootstrap.com/template-overviews/sb-admin-2"
							class="alert-link"></a>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${countQnaRespond }</div>
									<div>QNA 미답변 게시글 수</div>
								</div>
							</div>
						</div>
						<a href="<%=request.getContextPath()%>/admin/QnAList">
							<div class="panel-footer">
								<span class="pull-left">QNA게시판 관리</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-table fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${totalCmmt }</div>
									<div>커뮤니티 게시글 수</div>
								</div>
							</div>
						</div>
						<a href="<%=request.getContextPath()%>/admin/CommunityList">
							<div class="panel-footer">
								<span class="pull-left">커뮤니티 게시판 관리</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${totalFree}</div>
									<div>자유게시판 게시글 수</div>
								</div>
							</div>
						</div>
						<a href="<%=request.getContextPath()%>/admin/FreeList">
							<div class="panel-footer">
								<span class="pull-left">자유게시판 관리</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-group fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${totalMbr}</div>
									<div>총 회원 수</div>
								</div>
							</div>
						</div>
						<a href="<%=request.getContextPath()%>/admin/memberOperate">
							<div class="panel-footer">
								<span class="pull-left">회원 관리</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bar-chart-o fa-fw"></i> Charts
							</h3>
						</div>
						<div class="panel-body" style="text-align:center;">
							<div id="chart-container">FusionCharts will render here</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<!-- 
			<div class="row">
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-long-arrow-right fa-fw"></i> Donut Chart
							</h3>
						</div>
						<div class="panel-body">
							<div id="morris-donut-chart"></div>
							<div class="text-right">
								<a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-clock-o fa-fw"></i> Tasks Panel
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<a href="#" class="list-group-item"> <span class="badge">just
										now</span> <i class="fa fa-fw fa-calendar"></i> Calendar updated
								</a> <a href="#" class="list-group-item"> <span class="badge">4
										minutes ago</span> <i class="fa fa-fw fa-comment"></i> Commented on a
									post
								</a> <a href="#" class="list-group-item"> <span class="badge">23
										minutes ago</span> <i class="fa fa-fw fa-truck"></i> Order 392
									shipped
								</a> <a href="#" class="list-group-item"> <span class="badge">46
										minutes ago</span> <i class="fa fa-fw fa-money"></i> Invoice 653 has
									been paid
								</a> <a href="#" class="list-group-item"> <span class="badge">1
										hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has been
									added
								</a> <a href="#" class="list-group-item"> <span class="badge">2
										hours ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
									"pick up dry cleaning"
								</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
									<i class="fa fa-fw fa-globe"></i> Saved the world
								</a> <a href="#" class="list-group-item"> <span class="badge">two
										days ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
									"fix error on sales page"
								</a>
							</div>
							<div class="text-right">
								<a href="#">View All Activity <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-money fa-fw"></i> Transactions Panel
							</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th>Order #</th>
											<th>Order Date</th>
											<th>Order Time</th>
											<th>Amount (USD)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3326</td>
											<td>10/21/2013</td>
											<td>3:29 PM</td>
											<td>$321.33</td>
										</tr>
										<tr>
											<td>3325</td>
											<td>10/21/2013</td>
											<td>3:20 PM</td>
											<td>$234.34</td>
										</tr>
										<tr>
											<td>3324</td>
											<td>10/21/2013</td>
											<td>3:03 PM</td>
											<td>$724.17</td>
										</tr>
										<tr>
											<td>3323</td>
											<td>10/21/2013</td>
											<td>3:00 PM</td>
											<td>$23.71</td>
										</tr>
										<tr>
											<td>3322</td>
											<td>10/21/2013</td>
											<td>2:49 PM</td>
											<td>$8345.23</td>
										</tr>
										<tr>
											<td>3321</td>
											<td>10/21/2013</td>
											<td>2:23 PM</td>
											<td>$245.12</td>
										</tr>
										<tr>
											<td>3320</td>
											<td>10/21/2013</td>
											<td>2:15 PM</td>
											<td>$5663.54</td>
										</tr>
										<tr>
											<td>3319</td>
											<td>10/21/2013</td>
											<td>2:13 PM</td>
											<td>$943.45</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="text-right">
								<a href="#">View All Transactions <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->


		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->
</div>
</body>