<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<!-- checkbox를 꾸미기 위함 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
	function goList() {
		document.form2.action = "qnaWriteForm";
		document.form2.method = "post";
		document.form2.submit();
	}
</script>

<style>
#write {
	margin-left: 380px;
}

#writeBtn {
	margin-left: 1100px;
}


.checks {position: relative;} 

.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); border: 0 } 

.checks input[type="checkbox"] + label {
	display: inline-block; 
	position: relative; 
	cursor: pointer; 
	-webkit-user-select: none; 
	-moz-user-select: none; 
	-ms-user-select: none; } 

.checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
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
	border-radius : 3px; 
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } 

.checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { 
	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } 

.checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
	content: '\2714'; /* 체크표시 유니코드 사용 */ 
	color: #FF0000; 
	text-shadow: 1px 1px #FF0000; 
	background: white; 
 	border-color: #000000; /* 검정 */
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }

</style>

</head>
<body>
	<!-- PRELOADER -->
	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

	<!-- //PRELOADER -->
	<div class="preloader_hide">
		<div class="qnaHeader">

			<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>
						<b>Q & A</b> 고객 게시판
					</h2>
					<br> <br>
					<p>'Q & A 게시판' 페이지 입니다.</p>
				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<br>
			<div class="container">
				<form name="form2" method="post" action="qnaWriteForm" id="write" enctype="multipart/form-data">
					<div class="form-group">
						<label for="usr">Title</label> 
															
						<input type="text" name="qna_title" class="form-control" id="usr" style="width: 30%;">
					</div>
								
					<div class="form-group">
						<label for="comment">Comment</label>
						<textarea class="form-control" rows="5" name="qna_content" id="comment" style="width: 50%; height: 300px;"></textarea>
					</div>
				
				<div class="checks" >
					<input type="checkbox" id="agree-all" name="qnasecrit" value="Y"/>비밀글
					<label for="agree-all"></label>
				</div>
								
				</form>
			</div>
				
						
			<button type="button" id="writeBtn" class="btn" onclick="goList()"
				style="color: white; background-color: black;">등록</button>
			<button type="button" class="btn"
				onclick="location.href='qnaList'"
				style="color: white; background-color: black;">목록</button>
		</div>
	</div>

</body>
</html>
