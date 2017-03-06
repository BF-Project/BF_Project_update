<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

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
<title>성공하는 사람들</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="images/favicon.ico">

<!-- CSS -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/flexslider.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/prettyPhoto.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/examples-base.css" /> --%>
<!-- 검색버튼 css -->
<link href="<%=request.getContextPath()%>/resources/css/search.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/resources/admin/css/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- FONTS -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">

<!-- SCRIPTS -->
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if IE]><html class="ie" lang="en"> <![endif]-->

<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.nicescroll.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/superfish.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.flexslider-min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/animate.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.BlackAndWhite.js"></script>
	
<script src="<%=request.getContextPath()%>/resources/js/myscript.js"
	type="text/javascript"></script>


<script>
	//PrettyPhoto
	jQuery(document).ready(function() {
		$("a[rel^='prettyPhoto']").prettyPhoto();
	});

	//BlackAndWhite
	$(window).load(function() {
		$('.client_img').BlackAndWhite({
			hoverEffect : true, // default true
			// set the path to BnWWorker.js for a superfast implementation
			webworkerPath : false,
			// for the images with a fluid width and height 
			responsive : true,
			// to invert the hover effect
			invertHoverEffect : false,
			// this option works only on the modern browsers ( on IE lower than 9 it remains always 1)
			intensity : 1,
			speed : { //this property could also be just speed: value for both fadeIn and fadeOut
				fadeIn : 300, // 200ms for fadeIn animations
				fadeOut : 300
			// 800ms for fadeOut animations
			},
			onImageReady : function(img) {
				// this callback gets executed anytime an image is converted
			}
		});
	});
</script>

<!-- alert창 꾸미기 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wow-alert.css">
<script src="<%=request.getContextPath()%>/resources/js/wow-alert.js"></script>


<style>
#logo {
	vertical-align: middle;
	margin-top: 12px;
}

html, body {
	height: 100%
}

body {
	margin: 0
}

#body {
	min-height: 90%
}

#content {
	padding-bottom: 1.9em
}

#foot {
	margin-top: -1.9em;
	height: 1.9em
}

select { 
   width: 70px; /* 원하는 너비설정 */
   padding: .3em .2em; /* 여백으로 높이 설정 */ 
   font-family: inherit; /* 폰트 상속 */ 
   background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
   border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
   -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
   -moz-appearance: none; 
   appearance: none; 
}

</style>


<!-- 로그인 모달을 위한 css -->
<style>
  .modal-header, h4, .close {
      background-color: gray;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
</style>
<!-- 로그인 모달을 위한 css : end-->
	
<!-- 로그인 모달을 위한 jQuery -->
<script>
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("#myModal").modal();
	    });
	});
</script>
<!-- 로그인 모달을 위한 jQuery : end -->

<!-- 아이디찾기 / 비밀번호 찾기 / 로그인 모달 -->
<script>
	// 아이디 찾기
	$(function(){
		$('#idlook').click(function(){
			$("#myModal").modal('hide');
			$("#myModal2").modal('show');
		});
	})
	$(function(){
		$('#idlook2').click(function(){
			$("#myModal3").modal('hide');
			$("#myModal2").modal('show');
		});
	})
	
	// 로그인
	$(function(){
		$('#login').click(function(){
			$("#myModal2").modal('hide');
			$("#myModal").modal('show');
		});
	});
	$(function(){
		$('#login2').click(function(){
			$("#myModal3").modal('hide');
			$("#myModal").modal('show');
		});
	});
	
	// 비밀번호 찾기
	$(function(){
		$('#pwdlook').click(function(){
			$("#myModal").modal('hide');
			$("#myModal3").modal('show');
		});
	})
	$(function(){
		$('#pwdlook2').click(function(){
			$("#myModal2").modal('hide');
			$("#myModal3").modal('show');
		});
	})
</script>
<!-- 아이디찾기 / 비밀번호 찾기 / 로그인 모달 : end-->

<!-- 모달 내 function -->
<script>
	$(function(){
		// 로그인 기능
		$('#loginGo').click(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/join/login",
				type : "post",
				dataType : "text",
				data : ({
					id: $("input[name=loginid]").val(),
					pwd: $("input[name=loginpwd]").val()
				}),
				success:function(data){
					if(data=='yes'){
						$("#myModal").modal('hide');
// 						alert('로그인');
						window.location.reload();
					}else if(data=='admin'){
						$("#myModal").modal('hide');
						document.loginForm.loginid.value="";
						document.loginForm.loginpwd.value="";
						location='<%=request.getContextPath()%>/admin/start'
					}else{
						document.loginForm.loginid.value="";
						document.loginForm.loginpwd.value="";
						alert('아이디와 비밀번호를 다시 확인해주세요.');
					}
				},
				error:function(error){
					alert('error');
				}
			});
		});
		//
		
		// 아이디 찾기
		$('#idSearch').click(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/join/idSearch",
				type : "post",
				dataType : "text",
				data : ({
					name:$("input[name=nameSearch]").val(),
					email:$("input[name=mailSearch]").val()
				}),
				success:function(data){
					if(data=='yes'){
						$('#myModal2').modal('hide');
						document.idSearchForm.nameSearch.value="";
						document.idSearchForm.mailSearch.value="";
						alert('회원님의 이메일로 아이디를 전송했습니다.' +"\n" + '확인해주세요.');
					}else{
						document.idSearchForm.nameSearch.value="";
						document.idSearchForm.mailSearch.value="";
						alert('이름과 이메일을 다시 확인해주세요.')
					}
				},
				error:function(error){
					alert('error')
				}
			});
		});
		//
		
		// 비밀번호 찾기
		$('#pwdSearch').click(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/join/pwdSearch",
				type : "post",
				dataType : "text",
				data : ({
					id:$("input[name=pwdIdInput]").val(),
					name:$("input[name=pwdNameInput]").val()
				}),
				success:function(data){
					if(data=='yes'){
						$('#myModal3').modal('hide');
						document.pwdSearchForm.pwdIdInput.value="";
						document.pwdSearchForm.pwdNameInput.value="";
						alert('회원님의 이메일로 비밀번호를 전송했습니다.' +"\n" + '확인해주세요.')
					}else{
						document.pwdSearchForm.pwdIdInput.value="";
						document.pwdSearchForm.pwdNameInput.value="";
						alert('아이디와 이름을 다시 확인해주세요.')
					}
				},
				error:function(error){
					alert('error')
				}
			});
		});
	})
</script>
<!-- 모달 내 function : end -->

<script>
</script>

<script>
	function logoutBtn(){
		$.ajax({
			url : "<%=request.getContextPath()%>/join/logout",
			type : "post",
			dataType : "text",
			data : ({				
			}),
			success:function(data){
				location = '<%=request.getContextPath()%>/start'
// 				window.location.reload();
			},
			error:function(error){
				alert('error');
			}
		})
	}
</script>

<decorator:head />


</head>

<body>
	<div id="body">

		<!-- HEADER -->
		<header>

			<!-- MENU BLOCK -->
			<div class="menu_block">

				<!-- CONTAINER -->
				<div class="container clearfix">

					<!-- LOGO -->
					<div class="logo pull-left">
						<a href="<%=request.getContextPath()%>/start"><img
							style="width: 200px; heigth: 160px"
							src="<%=request.getContextPath()%>/resources/images/logo/logo.jpg"
							id="logo" alt="성공하는 사람들" /></a>
					</div>
					<!-- //LOGO -->

					<!-- Login FORM -->
					<div id="log-in" class="pull-right">
						<form method="get" action="#">
							<c:choose>
								<c:when test="${!empty sessionScope.loginUser}">
									<!-- 로그인 O -->
									<a class="btn btn-default btn-lg" onclick="logoutBtn()" style="position:absolute; top:-18px; right:-28px">
										<img src="<%=request.getContextPath()%>/resources/images/service/logout.jpg" style="width: 63px"><br>
										<span style="position: relative; right: 10px; top:-7px">logout</span>
									</a>
										<div style="z-index:0; position:absolute; width:500px; left:87px; top:29px"><b>${sessionScope.loginUserName}님 환영합니다.</b></div>
								</c:when>
								<c:otherwise>
									<!-- 로그인 X -->
									<a class="btn btn-default btn-lg" id="myBtn" style="position:absolute; top:-18px; right:-28px">
										<img src="<%=request.getContextPath()%>/resources/images/service/login.jpg" style="width: 63px"><br>
										<span style="position: relative; right: 10px; top:-7px">login</span>
									</a>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
					<!-- 끝 : Login FORM -->
					
					<!-- 로그인 창 모달 / start -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
						  
						    <!-- Modal content-->
							<div class="modal-content"> <!-- modal-content ?? -->
								<div class="modal-header" style="padding:15px 30px;">
									<h4 style="margin-top: 20px"><span class="glyphicon glyphicon-lock"></span> Login</h4>
								</div>
							<div class="modal-body" style="padding:30px 20px;">
								<form role="form" name="loginForm">
									<div class="form-group">
										<label for="usrname"><b style="font-size:19px">UserID</b></label>
										<input type="text" class="form-control" name="loginid" placeholder="아이디를 입력해주세요." style="font-size: 14px">
									</div>
									<div class="form-group">
										<label for="psw"><b style="font-size:19px">Password</b></label>
										<input type="password" class="form-control" name="loginpwd" placeholder="비밀번호를 입력해주세요." style="font-size: 14px">
									</div>
									<input type="button" class="btn btn-success btn-block" value="회원가입"
										style="margin-top: 7px; margin-left:80px; margin-bottom:-18px; width:170px; text-align: center; color:white; font-size: 16px; position:absolute; font-weight: bold; background-color: gray;"
										onclick="location='<%=request.getContextPath()%>/join/joinForm'">
									
									<input type="button"class="btn btn-success btn-block" value="Login" 
										style="margin-top: 7px; margin-left:290px; margin-bottom:-18px; width:170px; text-align: center; 
												background-color: gray; color:white; font-size: 16px; position:absolute;" id="loginGo">
									<br><br><br>	
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="width:120px; color:black; font-size: 16px;">
									Cancel
								</button>
								<p style="margin-top:7px;">Forgot Id ? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="idlook"><b>아이디 찾기</b></a></p>
								<p style="margin-bottom: -33px; margin-top: -6px">Forgot Password ? &nbsp;&nbsp;<a href="#" id="pwdlook"><b>비밀번호 찾기</b></a></p>
							</div>
							</div>
						</div>
					</div> 
					<!-- 로그인 창 모달 / end -->
					
					<!-- 아이디 찾기 모달  -->
					<div class="modal fade" id="myModal2" role="dialog">
						<div class="modal-dialog">
						  
						    <!-- Modal content-->
							<div class="modal-content"> <!-- modal-content ?? -->
								<div class="modal-header" style="padding:15px 30px;">
									<h4 style="margin-top: 20px">아이디 찾기</h4>
								</div>
							<div class="modal-body" style="padding:30px 20px;">
								<form role="form" name="idSearchForm">
									<div class="form-group">
										<label for="usrname"><b style="font-size:19px">UserName</b></label>
										<input type="text" class="form-control" name="nameSearch" id="searchusrname" placeholder="이름을 입력해주세요." style="font-size: 14px">
									</div>
									<div class="form-group">
										<label for="searchusermail"><b style="font-size:19px">E-mail</b></label>
										<input type="text" class="form-control" name="mailSearch" id="searchusermail" placeholder="이메일 주소를 입력해주세요." style="font-size: 14px">
									</div>
									<input type="button" value="아이디 찾기" id="idSearch" class="btn btn-success btn-block" style="margin-top: 7px; margin-left:80px; margin-bottom:-18px; width:170px; text-align: center; color:white; font-size: 16px; position:absolute; font-weight: bold; background-color: skyblue;">
									<input type="button" value="비밀번호 찾기" id="pwdlook2" class="btn btn-success btn-block" style="margin-top: 7px; margin-left:290px; margin-bottom:-18px; width:170px; text-align: center; background-color: gray; color:black; font-size: 16px; position:absolute;">
									<br><br><br>						
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="width:120px; color:black; font-size: 16px;">
									Cancel
								</button>
								<p style="margin-top:7px;">회원이 아니십니까 ? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location='<%=request.getContextPath()%>/join/joinForm'"><b>회원가입</b></a></p>
								<p style="margin-bottom: -33px; margin-top: -6px">로그인하러가기  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="login"><b>로그인</b></a></p>
							</div>
							</div>
						</div>
					</div> 
					<!-- 아이디 찾기 모달  : end -->
				
					<!-- 비밀번호 찾기 모달  -->
					<div class="modal fade" id="myModal3" role="dialog">
						<div class="modal-dialog">
						  
						    <!-- Modal content-->
							<div class="modal-content"> <!-- modal-content ?? -->
								<div class="modal-header" style="padding:15px 30px;">
									<h4 style="margin-top: 20px">비밀번호 찾기</h4>
								</div>
							<div class="modal-body" style="padding:30px 20px;">
								<form role="form" name="pwdSearchForm">
									<div class="form-group">
										<label for="usrname"><b style="font-size:19px">UserID</b></label>
										<input type="text" class="form-control" id="usrid" name="pwdIdInput" placeholder="아이디를 입력해주세요." style="font-size: 14px">
									</div>
									<div class="form-group">
										<label for="usrname"><b style="font-size:19px">UserName</b></label>
										<input type="text" class="form-control" id="searchusrname" name="pwdNameInput" placeholder="이름을 입력해주세요." style="font-size: 14px">
									</div>
									<input type="button" value="아이디 찾기" id="idlook2" class="btn btn-success btn-block" style="margin-top: 7px; margin-left:80px; margin-bottom:-18px; width:170px; text-align: center; color:white; font-size: 16px; position:absolute; font-weight: bold; background-color: gray;">
									<input type="button" value="비밀번호 찾기" id="pwdSearch" class="btn btn-success btn-block" style="margin-top: 7px; margin-left:290px; margin-bottom:-18px; width:170px; text-align: center; background-color: skyblue; color:black; font-size: 16px; position:absolute;">
									<br><br><br>						
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="width:120px; color:black; font-size: 16px;">
									Cancel
								</button>
								<p style="margin-top:7px;">회원이 아니십니까 ? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="location='<%=request.getContextPath()%>/join/joinForm'"><b>회원가입</b></a></p>
								<p style="margin-bottom: -33px; margin-top: -6px">로그인하러가기  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="login2"><b>로그인</b></a></p>
							</div>
							</div>
						</div>
					</div>
					<!-- 비밀번호 찾기 모달 : end -->
					
					
					<!-- MENU -->
					<div class="pull-right">
						<nav class="navmenu center">
							<ul id="ul-menu">
								<li class="first active scroll_btn"><a href="<%=request.getContextPath()%>/start#home"
									style="font-size: 14px">Home</a></li>
								<li class="scroll_btn"><a href="<%=request.getContextPath()%>/start#about"
									style="font-size: 14px">Site 소개</a></li>
								<li class="sub-menu"><a href="javascript:void(0);"
									style="font-size: 14px">컨설팅</a>
									<ul>
										<li><a href="<%=request.getContextPath()%>/consulting/consult" style="font-size: 13px">전문가 컨설팅</a></li>
										<li><a href="<%=request.getContextPath()%>/consulting/recommend" style="font-size: 13px">지역추천</a></li>
										<!-- <li><a href="javascript:void(0);" style="font-size: 13px">홈페이지
												제작(templates)</a></li> -->
									</ul></li>
								<li class="scroll_btn"><a
									href="<%=request.getContextPath()%>/simulator/main"
									style="font-size: 14px">시뮬레이터</a></li>

								<li class="sub-menu"><a href="javascript:void(0);"
									style="font-size: 14px">게시판</a>
									<ul>
										<li><a href="<%=request.getContextPath()%>/free/freeList">자유게시판</a></li>
										<li><a href="<%=request.getContextPath()%>/cmmt/cmmtList">커뮤니티
												게시판</a></li>
										<li><a href="<%=request.getContextPath()%>/qna/qnaList">Q & A 게시판</a></li>
									</ul></li>

								<li class="scroll_btn"><a href="<%=request.getContextPath()%>/notice/main" style="font-size: 14px">공지사항</a></li>

								<!-- c 태그 사용해서 회원 로그인 일때 / 아닐때 -->
								<c:choose>
									<c:when test="${!empty sessionScope.loginUser}">
								
										<!--<li><a href="#" style="font-size: 14px">내 정보</a></li> -->
										<li><a href="<%=request.getContextPath()%>/join/mypage" style="font-size: 14px">내 정보</a></li>
									
									
									</c:when>
									<c:otherwise>
										<li><a href="<%=request.getContextPath()%>/join/joinForm" style="font-size: 14px">회원가입</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
					<!-- //MENU -->
				</div>
				<!-- //MENU BLOCK -->
			</div>
			<!-- //CONTAINER -->
		</header>
		<!-- //HEADER -->

		<div id="content">
		
		
			<decorator:body />
			
			
		</div>
	</div>

	<div id="foot">
		<footer>

			<!-- CONTAINER -->
			<div class="container">

				<!-- ROW -->
				<!-- <div class="row" data-appear-top-offset="-200" data-animated="fadeInUp"> -->
				<div class="row">

					<div class="col-lg-4 col-md-4 col-sm-6 padbot30">
						<h4>
							<b>Featured</b> posts
						</h4>
						<div class="recent_posts_small clearfix">
							<div class="post_item_img_small">
								<img
									src="<%=request.getContextPath()%>/resources/images/blog/1.jpg"
									alt="" />
							</div>
							<div class="post_item_content_small">
								<a class="title" href="blog.html">As we have developed a
									unique layout template</a>
								<ul class="post_item_inf_small">
									<li>10 January 2014</li>
								</ul>
							</div>
						</div>
						<div class="recent_posts_small clearfix">
							<div class="post_item_img_small">
								<img
									src="<%=request.getContextPath()%>/resources/images/blog/2.jpg"
									alt="" />
							</div>
							<div class="post_item_content_small">
								<a class="title" href="blog.html">How much is to develop a
									design for the game?</a>
								<ul class="post_item_inf_small">
									<li>14 January 2014</li>
								</ul>
							</div>
						</div>
						<div class="recent_posts_small clearfix">
							<div class="post_item_img_small">
								<img
									src="<%=request.getContextPath()%>/resources/images/blog/3.jpg"
									alt="" />
							</div>
							<div class="post_item_content_small">
								<a class="title" href="blog.html">How to pump designer</a>
								<ul class="post_item_inf_small">
									<li>21 December 2013</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-4 col-sm-6 padbot30 foot_about_block">
						<h4>
							<b>About</b> us
						</h4>
						<p>We value people over profits, quality over quantity, and
							keeping it real. As such, we deliver an unmatched working
							relationship with our clients.</p>
						<p>Our team is intentionally small, eclectic, and skilled;
							with our in-house expertise, we provide sharp and</p>
						<ul class="social">
							<li><a href="javascript:void(0);"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="javascript:void(0);"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="javascript:void(0);"><i
									class="fa fa-google-plus"></i></a></li>
							<li><a href="javascript:void(0);"><i
									class="fa fa-pinterest-square"></i></a></li>
							<li><a href="javascript:void(0);"><i
									class="map_show fa fa-map-marker"></i></a></li>
						</ul>
					</div>

					<div class="respond_clear"></div>

					<div class="col-lg-4 col-md-4 padbot30">
						<h4>
							<b>Contacts</b> Us
						</h4>

						<!-- CONTACT FORM -->
						<div class="span9 contact_form">
							<div id="note"></div>
							<div id="fields">
								<form id="contact-form-face" class="clearfix" action="#">
									<input type="text" name="name" value="Name"
										onFocus="if (this.value == 'Name') this.value = '';"
										onBlur="if (this.value == '') this.value = 'Name';" />
									<textarea name="message"
										onFocus="if (this.value == 'Message') this.value = '';"
										onBlur="if (this.value == '') this.value = 'Message';">Message</textarea>
									<input class="contact_btn" type="submit" value="Send message" />
								</form>
							</div>
						</div>
						<!-- //CONTACT FORM -->
					</div>
				</div>
				<!-- //ROW -->
				<div class="row copyright">
					<div class="col-lg-12 text-center">
						<p>
							Crafted with <i class="fa fa-heart"></i>, <a
								style="color: skyblue">Business Friend</a>
						</p>
					</div>
				</div>
				<!-- //ROW -->
			</div>
			<!-- //CONTAINER -->
		</footer>
		<!-- //FOOTER -->
	</div>

</body>
</html>
