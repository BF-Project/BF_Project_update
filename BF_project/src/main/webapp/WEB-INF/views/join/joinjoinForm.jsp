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

<!-- checkbox를 꾸미기 위함 -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
.checks {
	position: relative;
}

.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}

.checks input[type="checkbox"]+label {
	display: inline-block;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="checkbox"]+label:before { /* 가짜 체크박스 */
	content: ' ';
	display: inline-block;
	width: 21px; /* 체크박스의 너비를 지정 */
	height: 21px; /* 체크박스의 높이를 지정 */
	line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: white;
	border: 1px solid #000000;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.checks input[type="checkbox"]+label:active:before, .checks input[type="checkbox"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
	content: '\2714'; /* 체크표시 유니코드 사용 */
	color: #FF0000;
	text-shadow: 1px 1px #FF0000;
	background: white;
	border-color: #000000; /* 검정 */
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
}
</style>

<script>
	// 체크박스를 라디오 버튼처럼 사용하기 : 라디오버튼이 css때문에 안먹힘...
	$(function(){
		$('input[type="checkbox"][name="check"]').click(function(){
			// click 이벤트가 발생했는지 체크
			if($(this).prop('checked')){
				// checkbox 전체를 checked 해제 후 click한 요소만 true 지정
				$('input[type="checkbox"][name="check"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
	});		
</script>

</head>
<body>
	<!-- body -->

	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

	<div class="preloader_hide">

		<!-- PAGE -->
		<div id="page" class="single_page">

			<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<a href="<%=request.getContextPath()%>/start"> 
						<img src="<%=request.getContextPath()%>/resources/images/logo/logo.jpg"	style="z-index: 0; width: 590px; height: 170px">
					</a> 
					<br> <br> <br>
					<br>
					<h2>
						<b>Join</b> membership
					</h2>
					<p>'성공하는 사람들' 회원가입 페이지 입니다.</p>
				</div>
			</section>

			<!-- 회원가입 form -->

			<article class="container">
				<div class="page-header">
				</div>
				<div class="col-md-6 col-md-offset-3">
					<form role="form" name="abc" action="<%= request.getContextPath() %>/join/joinjoinForm">
						<div class="form-group">
							<label for="InputId">아이디</label> 
								<input type="email" class="form-control" name="InputId" placeholder="아이디를 입력해주세요" id="id" style="width:475px">
								<input type="button" value="중복확인" style="position:absolute; left:495px; top:25px; background-color:#000000; color=#FFF0F0; height:35px; width:75px; margin:0; padding:0;" 
											id="idcheck" class="btn btn-info">
						</div>
						
						<!-- 아이디 중복확인을 클릭했는지를 알아보기위함 -->
						<input type="hidden" id="idcheckyn" name="idcheckyn" value="no">
						<!-- 아이디 중복확인을 클릭했는지를 알아보기위함 -->
						
						<div class="form-group">
							<label for="InputPassword1">비밀번호</label>
								<input type="password" class="form-control" name="InputPassword1" placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="form-group">
							<label for="InputPassword2">비밀번호 확인</label> 
								<input type="password" class="form-control" name="InputPassword2" placeholder="비밀번호 재확인">
							<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
						</div>
						<div class="form-group">
							<label for="username">이름</label> 
								<input type="email" class="form-control" name="username" placeholder="이름을 입력해 주세요">
						</div>
						<div class="form-group">
							<label for="usernumber">휴대폰 번호</label>
							<div class="input-group">
								<input type="tel" class="form-control" name="usernumber" placeholder=" - 없이 입력해 주세요">
							</div>
						</div>
						<div class="form-group">
							<label for="InputEmail">이메일</label> 
								<input type="email" class="form-control" name="InputEmail" placeholder="이메일 주소를 입력해 주세요">
								<p class="help-block">ex : aaaa12@naver.com 과 같이 올바르게 입력해주세요</p>
						</div>
						
						<!-- 주소 -->
						<div class="form-group">
							<label for="InputAddr">주소</label>
								<input type="email" class="form-control" name="InputAddr1" placeholder="검색해주세요" style="width:400px" readonly>
								<input type="button" value="Search" style="position:absolute; left:420px; bottom:371.9px; background-color:#000000; color=#FFF0F0; height:35px; width:75px; margin:0; padding:0;" 
											class="btn btn-info" onclick="searchAddr()">
								<input type="email" class="form-control" name="InputAddr2" placeholder="상세주소를 입력해주세요" style="width:470px; margin-top: 8px">
						</div>
						
						<!-- 생년월일 -->
						<div class="form-group">
							<label for="InputBirth">생년월일</label>
							<div class="input-group">
								<input type="tel" class="form-control" name="InputBirth" placeholder="ex : 19910505">
								<p class="help-block">숫자로만 생년월일을 입력해주세요</p>
							</div>
						</div>
						
						<!-- 성별 -->
						<label for="InputGender">성별</label><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="checks">
							<input type="checkbox" id="agree-one" class="sex1" name="check" value="남자" checked> 남자
							<label for="agree-one"></label>
						</span>
						&nbsp;
						<span class="checks">
							<input type="checkbox" id="agree-two" class="sex2" name="check" value="여자" > 여자
							<label for="agree-two"></label>
						</span>
						
						<!-- check box로 성별을 구분해서 값을 가져가기 힘들다. 그래서 사용한 구문 -->
						<input type="hidden" id="i_result" name="gender">
						<!-- ////////////////////////////////////////////////// -->
						<br><br><br>
						
						<div class="form-group text-center">
							<button type="button" class="btn btn-info" onclick="goJoin(this.form)" style="padding:17px">
								<b style="font-size:20px">회원가입</b>&nbsp;<i class="fa fa-check spaceLeft"></i>
							</button>
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<button type="button" class="btn btn-warning" onclick="gohome()" style="padding:17px">
								<b style="font-size:20px">가입취소</b>&nbsp;<i class="fa fa-times spaceLeft"></i>
							</button>
							<br><br><br>
						</div>
					</form>
				</div>
			</article>
			<!-- 회원가입 form -->

		</div>
	</div>	
</body>

<!-- alert창 꾸미기 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wow-alert.css">
<script src="<%=request.getContextPath()%>/resources/js/wow-alert.js"></script>

<script>
	// ajax 아이디 중복검사
	$(function(){
		$('#idcheck').click(function(){ // 아이디 중복검사 버튼 클릭이벤트
			//
			$.ajax({
				url : "<%=request.getContextPath()%>/join/idcheck",
				type : "post",
				dataType:'text',
				data : ({
					userid: $("input[name=InputId]").val()
					
				}),
				success:function(data){ // 중복확인 후 return되는 값 data
					var id = document.abc.InputId.value;
					var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,15}$/; // 처음은 영어 / 영(대,소) + 숫자 조합의 4~16자리
					
					if(!idPattern.test(id)==true){
						alert('아이디의 첫 글자는 영어이며 4 ~ 16자로 입력해주세요.');
						$('#idcheckyn').val('no');
						document.abc.InputId.value="";
						docuemnt.abc.InputId.focus();
					}else if(data=='yes'){
						alert('사용가능한 아이디입니다.');
						$(function(){
							$('#idcheckyn').val('yes');
						});
						$('input[name=InputPassword1]').focus();
					}else if(data=='no'){
						alert('사용하실 수 없는 아이디입니다. 아이디를 다시 입력해주세요.');
						$('#idcheckyn').val('no');
						$("input[name=InputId]").val("");
						$("input[name=InputId]").focus();
					}
				},
				error : function(error){
					alert('알수없는 error 페이지를 재시작해주세요.');
				}
			});
			//
		});
	});
	
	// 주소검색
	function searchAddr(){
		var url = "findZipNum";
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=450, top=200, left=200, ");
	}

	// 가입취소, 홈으로 돌아가기
	function gohome(){
		location.href="<%=request.getContextPath()%>/start"
	}
	
	// 회원가입
	function goJoin(form){
		
		// 정규식
		var id = document.abc.InputId.value; // 아이디
		var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,15}$/; // 처음은 영어 / 영(대,소) + 숫자 조합의 4~16자리
		
		var pwd = document.abc.InputPassword1.value; // 패스워드
		var pwdPattern = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/ // 무조껀 영어와 숫자를 혼용하여 최소 8자 ~ 20자 
		
		var pwdChk = document.abc.InputPassword2.value; // 패스워드 확인
		
		var name = document.abc.username.value; // 이름
		var namePattern = /^[가-힣]{1,10}|[a-zA-Z]{1,20}$/ // 영어와 한글 혼용 금지
		
		var number = document.abc.usernumber.value; // 전화번호 
		var numberPattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/ // - 없이 번호 입력
		
		var email = document.abc.InputEmail.value; // 이메일
		var emailPattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+){1,2}$/ //
		
		//
		var addr1 = document.abc.InputAddr1.value; // 검색한 주소
		var addr2 = document.abc.InputAddr2.value; // 입력한 상세주소
		//
		
		var birth = document.abc.InputBirth.value; // 생년월일
		var birthPattern = /^[0-9]{8}$/ // 8자리 생년월일 ex) 19910505
				
		// 아이디 중복확인을 했는지 확인하기 위함 Yes여야 넘어감
		var idid = document.abc.idcheckyn.value;
		
		if(idid=='yes'){
			if(idPattern.test(id)==true){
				if(pwdPattern.test(pwd)==true){
					if(pwd==pwdChk){
						if(namePattern.test(name)==true){
							if(numberPattern.test(number)==true){
								if(emailPattern.test(email)==true){
									if(!addr1==null || !addr1==""){
										if(!addr2==null || !addr2==""){
											if(birthPattern.test(birth)==true){
												
												if ($('.sex1').is(":checked")){ 
													var gender = $('.sex1').val(); // 남자
													$(function(){
														$('#i_result').val('남자');
													});
													// 링크걸기
														form.method="post";
														form.submit();
												}else if($('.sex2').is(":checked")){
													var gender = $('.sex2').val(); // 여자
													$(function(){
														$('#i_result').val('여자');
													});
													// 링크걸기
														form.method="post";
														form.submit();
												}else{
													alert('성별을 선택해 주세요.');
													document.abc.check.focus();
												}
												
											}else{
												alert('생년월일은 8자리로 ex)19910505 와 같이 입력해주세요.');
												document.abc.InputBirth.value="";
												document.abc.InputBirth.focus();
											}
										}else{
											alert('상세주소를 입력해주세요.');
											document.abc.InputAddr2.fucus();
										}
									}else{
										alert('주소를 검색해주세요.');
										document.abc.InputAddr1.focus();
									}
								}else{
									alert('이메일 입력이 잘못되었습니다. 다시확인해주세요.');
									document.abc.InputEmail.value="";
									document.abc.InputEmail.focus();
								}
							}else{
								alert('전화번호는 - 없이 숫자로만 입력해주세요.');
								document.abc.usernumber.value="";
								document.abc.usernumber.focus();
							}
						}else{
							alert('이름에 공백과 영어와 한글을 혼용할 수 없습니다. 다시 확인해주세요.');
							document.abc.username.value="";
							document.abc.username.focus();
						}
					}else{
						alert('비밀번호가 서로 일치하지 않습니다. 다시 확인해주세요.');
						document.abc.InputPassword2.value="";
						codument.abc.InputPassword2.focus();
					}
				}else{
					alert('비밀번호는 영어와 숫자를 혼용하여 8 ~ 20자로 입력해주세요.');
					document.abc.InputPassword1.value="";
					document.abc.InputPassword1.focus();
				}
			}else{
				alert('아이디의 첫 글자는 영어이며 4 ~ 16자로 입력해주세요.');
				document.abc.InputId.value="";
				docuemnt.abc.InputId.focus();
			}
		}else{
			alert('아이디 중복확인을 해주세요.');
		}
	}
</script>

</html>