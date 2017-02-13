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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script>
	function goList() {
		document.form2.action = "qnaUpdateForm"; // qnaUpdateForm
		document.form2.method = "post"; 
		document.form2.submit(); 
	}
</script>

<style>
	#update {
		margin-left: 380px;
	}
	
	#updateBtn {
		margin-left: 442px;
	}
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
			
			<div class="container">
				<form name="form2" method="post" action="qnaUpdateForm" id="update">
					<input type="text" name="qna_num" hidden="hidden" value="${param.qna_num}">
					<div class="form-group">
						<br>
						<label for="usr">제 목</label><br> 
						<input type="text" class="form-control" name="qna_title" id="usr" value="${qnaVO.qna_title}" style="width:30%;">
					</div> 
					
					<div class="form-gourp">
						<label for="comment">내 용</label><br>
						<textarea rows="5" id="comment" class="form-control" name="qna_content" style="width:50%; height:300px;">${qnaVO.qna_content}</textarea>
					</div>
					
					<br>
		
			<button type="button" id="updateBtn" class="btn" onclick="goList()"
				style="color: white; background-color: black;">수정</button>
			<button type="button" class="btn"
				onclick="location.href='qnaList'"
				style="color: white; background-color: black;">목록</button>
		
				
				</form>
			</div>
			
		</div>


	</div>
</body>
</html>
