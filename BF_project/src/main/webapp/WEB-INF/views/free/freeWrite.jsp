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

<script>
	function goList() {
		document.free.action = "freeWriteForm";
		document.free.method = "post";
		document.free.submit();
	}
</script>

<style>
	#write {
		margin-left : 380px;
	}
	
	#writeBtn {
		margin-left: 39.3%;
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
						<b>FREE</b> BOARD
					</h2>
					<br> <br>
					<p>'자유게시판' 페이지 입니다.</p>
				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<br>
			<div class="container">
				<form name="free" method="post" action="freeWriteForm" id="write">
					<div class="form-group">
						<label for="usr">Title</label> 
						<input type="text" name="fre_title" class="form-control" id="usr" style="width: 30%;">
					</div>
					<div class="form-group">
						<label for="comment">Comment</label>
						<textarea class="form-control" rows="5" name="fre_content" id="comment" style="width: 50%; height: 300px;"></textarea>
					</div>
				</form>
			</div>
			<button type="button" id="writeBtn" class="btn" onclick="goList()"
				style="background-color: black;">등록</button>
			
			<button type="button" class="btn"
				onclick="location.href='freeList'"
				style="background-color: black;">목록</button>
		</div>
	</div>
</body>
</html>