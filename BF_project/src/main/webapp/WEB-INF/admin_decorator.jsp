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
<%--     <script src="<%=request.getContextPath()%>/resources/admin/js/plugins/morris.min.js"></script> --%> <!-- chart -->
<%--     <script src="<%=request.getContextPath()%>/resources/admin/js/plugins/morris-data.js"></script> --%> <!-- chart -->
    
    <!-- alert창 꾸미기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wow-alert.css">
	<script src="<%=request.getContextPath()%>/resources/js/wow-alert.js"></script>
    
    <!-- 실시간 1:1 메시지 -->
    <script>
    	var messageListCount = 0;
    	var strArray = "";
    	var pupupWin;
    	var pupupArray = new Array();
    	
    	function adminAdvice(roomId){
    		var url = '<%=request.getContextPath()%>/admin/chat?roomId='+roomId+'&userName='+$('.messageUser').prop("id");
    		pupupWin = window.open(url, roomId, "toolbar=no, menubar=no, location=no, scrollbars=yes, resizable=no, width=480, height=620, top=200, left=1200"); // 이 팝업창의 이름은 roomId == strArray[0]
    		pupupArray.push(pupupWin)
//     		alert("현재 팝업 배열에 저장된 리스트 : " + pupupArray);
    	}
    	
    	$(function(){
    		$('#insertMessage').on("click", ".messageBtn",function(){
				adminAdvice($(this).prop("id"));
// 				alert($(this).prop("id"));
// 				alert($('.messageUser').prop("id"));
					$(this).remove();
					messageListCount -= 1;
					if(messageListCount >= 1){
						$("#messageOnView").css('visibility', 'visible');
					}else{
						$("#messageOnView").css('visibility', 'hidden');
					}
// 					alert(messageListCount);
			});
    		
    		var wsocket2 = new WebSocket("ws:/"+document.domain+":8181${pageContext.request.contextPath}/pushMessage");
			wsocket2.onopen = function(){
// 				alert("푸쉬 메시지 핸들러 연결");
			};
// 			wsocket2.onerror = function(){
// 				alert("error  " + JSON.stringify(arguments));
// 			};
// 			wsocket2.onclose = function(){
// 				alert("close  " + JSON.stringify(arguments));
// 			};
			wsocket2.onmessage = function onMessage(evt){
				var data = evt.data;
// 				alert("상담 요청 들어왔습니다.");
				
				var string = data; // data는 회원의 roomId와 owner를 받아온다.
				strArray = string.split(','); // strArray[0] ==> 해당 방번호  strArray[1] ==> 방주인
				
				var now = new Date();
				var nowTime = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+now.getDate()+"일 "+now.getHours()+"시 "+now.getMinutes()+"분 "; // +now.getSeconds()+"초" 

				var obj;
				var nObjCount = pupupArray.length;
				var begin = 'no';
				for(var i=0; i<nObjCount; i++){
					obj = pupupArray[i]
					if(strArray[0] == obj.name){
						// 있다는 건데
						begin = 'yes';
// 						alert(strArray[0]+'========='+obj.name);
					}
				}
				
				if(begin != 'yes'){
					var html= " ";
						html+='	<li class="message-preview">                                                       	 ';          
						html+='		<a href="#" class="messageBtn" id="'+strArray[0]+'">                             ';          
						html+='			<div class="media">                                                          ';          
						html+='				<span class="pull-left">                                                 ';          
						html+='					<img class="media-object" src="http://placehold.it/50x50" alt="">    ';          
						html+='				</span>                                                                  ';          
						html+='				<div class="media-body">                                                 ';          
						html+='					<h5 class="media-heading">                                           ';          
						html+='						<strong class="messageUser" id="'+strArray[1]+'">'+strArray[1]+'님의 실시간 상담요청</strong>            		 ';          
						html+='					</h5>                                                                ';          
						html+='					<p class="small text-muted">                                         ';          
						html+='						<i class="fa fa-clock-o">                                        ';          
						html+='						</i>'+nowTime+'                                        			 ';          
						html+='				</div>                                                                   ';          
						html+='			</div>                                                                       ';          
						html+='		</a>                                                                             ';          
						html+='	</li>                                                                            	 ';
						
					$('#insertMessage').append(html);
					messageListCount += 1;
					if(messageListCount >= 1){
						$("#messageOnView").css('visibility', 'visible');
					}else{
						$("#messageOnView").css('visibility', 'hidden');
					}
// 					alert(messageListCount);
				}
				
			};
   		});
    </script>

	<style>
		#messageOnView{
			-webkit-animation: blink 2.5s linear infinite
		}
		
		@-webkit-keyframes blink {
		    0% {background-color: red;}
		    33% {background-color: yellow;}
		    66% {background-color: blue;}
		    100% {background-color: green;}
		/*    from { background-color: red;}
		    to {background-color: green;}  */
		}
	</style>
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
			<li class="dropdwon" style="margin-top: 14px;">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown" id="messageOnView" style="padding:1px; font-size: 15px; color:white; font-weight:bold; visibility:hidden;">
					<i class="fa fa-bell"></i>&nbsp;메시지를 확인하세요.
				</a>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"	data-toggle="dropdown">
					<i class="fa fa-envelope"></i>
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu message-dropdown" id="insertMessage">
					<!-- messge가 오면 li로 리스트가 만들어지는 공간 -->
					<!-- messge가 오면 li로 리스트가 만들어지는 공간 -->
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
						<li class="ggggOne"><a href="<%=request.getContextPath()%>/admin/FreeList"><i class="fa fa-tag"></i>&nbsp;&nbsp;자유 게시판</a></li>
						<li class="ggggTwo"><a href="<%=request.getContextPath()%>/admin/CommunityList"><i class="fa fa-tag"></i>&nbsp;&nbsp;커뮤니티 게시판</a></li>
						<li class="ggggThree"><a href="<%=request.getContextPath()%>/admin/QnAList"><i class="fa fa-tag"></i>&nbsp;&nbsp;Q & A 게시판</a></li>
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
