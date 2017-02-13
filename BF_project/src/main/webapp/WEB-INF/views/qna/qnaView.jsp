<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	function goUpdate(qna_num) {
		document.formm.action = "update?qna_num=" + qna_num;
		document.formm.submit();
	}

	/*삭제  */
	function goDelete(qna_num) {
		document.formm.action = "delete?qna_num=" + qna_num;
		document.formm.submit();
	}
</script>

<style>
#qnaView1 {
	margin: auto;
	width: 70%;
}

#mod, del, list {
	
	margin-left : 58%;
}

#list2 {
	margin-left : 500px;
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
			<br>

			<form name="formm" method="post" action="qnaView">
				<div class="container">
					<table class="table table-hover" id="qnaView1">
						<tr>
							<th>제목</th>
							<td>${qnaVO.qna_title}</td>
						</tr>

						<tr>
							<th>내용</th>
							<td>${qnaVO.qna_content}</td>
						</tr>

						<tr>
							<th>작성자</th>
							<td>${qnaVO.mbr_id}</td>
						</tr>

						<tr>
							<th>게시날짜</th>
							<td>${qnaVO.qna_date}</td>
						</tr>
						
						
						<tr>
						<th>답변내용</th>
						<td></td>
					</tr>
					
					</table>
					<c:choose>
					<c:when test="${qnaVO.mbr_id==sessionScope.loginUser }">
						<!-- 수정  -->
						<button type="button" id="mod" class="btn"
							onclick="goUpdate('${qnaVO.qna_num}')"
							style="color: white; background-color: black;">수정</button>
						<!-- 삭제  -->
						<button type="button" id="del" class="btn"
							onclick="goDelete('${qnaVO.qna_num}')"
							style="color: white; background-color: black;">삭제</button>
						<!-- 목록 -->
						<button type="button" id="list" class="btn"
							onclick="location.href='qnaList'"
							style="color: white; background-color: black;">목록</button>
					</c:when>
				
					<c:otherwise>
						<button type="button" id="list2" class="btn"
							onclick="location.href='qnaList'"
							style="color: white; background-color: black;">목록</button>
					</c:otherwise>
				
				</c:choose>
					
					
				</div>
				<br>
				</form>
					
				
				
			

		</div>
	</div>
</body>
</html>