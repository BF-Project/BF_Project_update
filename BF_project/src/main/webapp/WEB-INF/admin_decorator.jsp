<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/ss-admin.css" rel="stylesheet">
    
	<!-- Morris Charts CSS -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/plugins/morris.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/resources/admin/css/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/jquery.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/bootstrap.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/admin/js/plugins/raphael.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/js/plugins/morris.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/js/plugins/morris-data.js"></script>
    
    <!-- alert창 꾸미기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wow-alert.css">
	<script src="<%=request.getContextPath()%>/resources/js/wow-alert.js"></script>
    
    <!-- 실시간 1:1 메시지 -->
    <script>
    	function adminAdvice(){
    		var url = '<%=request.getContextPath()%>/admin/chat'
			window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=600, top=200, left=1200");
    	}
    </script>
    
    <decorator:head />
    
<title>'성공하는 사람들' 관리자 화면</title>
</head>
<body>
<div id="wrapper">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header" style="height: 70px; vertical-align: middle;">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/start" style="font-size: 24px; padding: 7px;">
			<img src="<%=request.getContextPath()%>/resources/images/logo/logo.jpg" style="width:120px; position:absolute; left:18px; top:21px;">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Administrator screen</a>
		</div>
		<!-- 상단메뉴 -->
		<ul class="nav navbar-right top-nav" style="margin-top: 10px; margin-bottom: 15px;">
			
			<!-- message 확인용 -->
				<a href="#" onclick="adminAdvice()" class="dropdown-toggle"	data-toggle="dropdown" style="position:absolute; margin-right: 1000px; margin-top: 80px">
					<i class="fa fa-envelope"></i>
					<b class="caret"></b>
				</a>
			<!-- message 확인용 -->
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown">
					<i class="fa fa-envelope"></i>
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu message-dropdown">
					<li class="message-preview">
						<a href="#">
							<div class="media">
								<span class="pull-left">
									<img class="media-object" src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o">
										</i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
						</a>
					</li>
					<li class="message-preview">
						<a href="#">
							<div class="media">
								<span class="pull-left">
									<img class="media-object" src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o">
										</i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
						</a>
					</li>
					<li class="message-preview">
						<a href="#">
							<div class="media">
								<span class="pull-left"> 
									<img class="media-object" src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>John Smith</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o">
										</i> Yesterday at 4:32 PM
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur...</p>
								</div>
							</div>
						</a>
					</li>
					<li class="message-footer">
						<a href="#">Read All New Messages</a>
					</li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown">
					<i class="fa fa-bell">
					</i>
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu alert-dropdown">
					<li>
						<a href="#">Alert Name
							<span class="label label-default">Alert Badge</span>
						</a>
					</li>
					<li>
						<a href="#">Alert Name
							<span class="label label-primary">Alert Badge</span>
						</a>
					</li>
					<li>
						<a href="#">Alert Name
							<span class="label label-success">Alert Badge</span>
						</a>
					</li>
					<li>
						<a href="#">Alert Name
							<span class="label label-info">Alert Badge</span>
						</a>
					</li>
					<li>
						<a href="#">Alert Name
							<span class="label label-warning">Alert Badge</span>
						</a>
					</li>
					<li>
						<a href="#">Alert Name
							<span class="label label-danger">Alert Badge</span>
						</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">View All</a>
					</li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown">
					<i class="fa fa-user"> </i>
					${sessionScope.adminName } '관리자'님 안녕하세요. <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="<%=request.getContextPath()%>/admin/exit"><i class="fa fa-fw fa-power-off"></i> LogOut</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- 상단메뉴 : end -->
		
		<!-- 사이드 메뉴 -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav" style="margin-top: 60px;">
				<li class="aaaa" style="font-size: 16px;"><a href="<%=request.getContextPath()%>/admin/start">
					<i class="fa fa-fw fa-dashboard"></i> Main X</a>
				</li>
				<li class="bbbb" style="font-size: 16px; margin-top: 8px"><a href="<%=request.getContextPath()%>/admin/memberOperate">
					<i class="fa fa-group"></i> 회원관리</a>
				</li>
				<li class="cccc" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-bar-chart-o"></i> 시뮬레이터 X</a>
				</li>
				<li class="dddd" style="font-size: 16px; margin-top: 8px"><a href="<%=request.getContextPath()%>/admin/notice">
					<i class="fa fa-fw fa-edit"></i> 공지사항</a>
				</li>
				<li class="gggg" style="font-size: 16px; margin-top: 8px">
					<a href="javascript:;" data-toggle="collapse" data-target="#demo">
						<i class="fa fa-fw fa-table"></i> 게시판 X<i class="fa fa-fw fa-caret-down"></i>
					</a>
					<ul id="demo" class="collapse">
						<li><a href="#"><i class="fa fa-tag"></i>&nbsp;&nbsp;자유 게시판</a></li>
						<li><a href="<%=request.getContextPath()%>/admin/free"><i class="fa fa-tag"></i>&nbsp;&nbsp;커뮤니티 게시판</a></li>
						<li><a href="#"><i class="fa fa-tag"></i>&nbsp;&nbsp;Q & A 게시판</a></li>
					</ul>
				</li>
				<li class="eeee" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-desktop"></i> Bootstrap Elements X</a>
				</li>
				<li class="ffff" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-wrench"></i> Bootstrap Grid X</a>
				</li>
				<li class="hhhh" style="font-size: 16px; margin-top: 8px">
					<a href="#">
						<i class="fa fa-fw fa-file"></i> Blank Page X
					</a>
				</li>
				<li class="iiii" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-wrench"></i> Bootstrap Grid X</a>
				</li>
				<li class="jjjj" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-money"></i> Bootstrap Grid X</a>
				</li>
				<li class="kkkk" style="font-size: 16px; margin-top: 8px"><a href="#">
					<i class="fa fa-fw fa-strikethrough"></i> Bootstrap Grid X</a>
				</li>
				<li class="llll" style="font-size: 16px; margin-top: 8px">
					<a href="<%=request.getContextPath()%>/admin/exit"><i class="fa fa-fw fa-power-off"></i> Home(관리자모드 종료) </a>
				</li>
			</ul>
		</div>
		<!-- 사이드 메뉴 : end -->
	</nav>
</div>
	<decorator:body />
</body>
</html>
