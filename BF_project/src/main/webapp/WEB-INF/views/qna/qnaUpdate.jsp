<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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
	margin-left: auto;
}

.file_input label {
	display: inline-block;
	padding: .5em .75em;
	color: #1E82FF;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #1E82FF;
	border-bottom-color: #1E82FF;
	border-radius: .25em;
	margin-right: 280px;
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
	width: 200px;
	height: 26px;
	line-height: 28px;
	font-size: 15px;
	/* 		    color:#fdfdfd; */
	/* 		    padding:0; */
	border: 0px;
	/* 		    border:1px solid #777; */
}
</style>

</head>
<body>

	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- BREADCRUMBS -->
		<section class="breadcrumbs_block clearfix parallax">
			<div class="container center">
				<h2>
					<b>Q & A</b> 게시판
				</h2>

				<p>'Q & A 게시판 수정 '페이지 입니다.</p>
			</div>
		</section>
		
		<!-- //BREADCRUMBS -->

		<div class="container">
			<form name="form2" method="post" action="qnaUpdateForm" id="update"
				enctype="multipart/form-data">
				<input type="text" name="qna_num" hidden="hidden"
					value="${param.qna_num}">

				<div class="form-group">
					<br> <label for="usr">제 목</label><br> <input type="text"
						class="form-control" name="qna_title" id="usr"
						value="${qnaVO.qna_title}" style="width: 30%;">
				</div>

				<div class="form-gourp">
					<label for="comment">내 용</label><br>
					<textarea rows="5" id="comment" class="form-control"
						name="qna_content" style="width: 50%; height: 300px;">${qnaVO.qna_content}</textarea>
				</div>

				<!--사진수정  -->
				<div class="form-group">
					<input type="hidden" class="form-control" name="nofile"
						value="${qnaVO.qna_pict_afat}">
					<c:if test="${!empty qnaVO.qna_pict_afat}">
						<img
							src="<%=request.getContextPath() %>/upload/${qnaVO.qna_pict_afat}"
							width="200px" id="hideimg">
					</c:if>
				</div>

				<div class="file_input">
					<label> <i class="fa fa-photo"></i>&nbsp;사진첨부 <input
						type="file" name="file">
					</label>
				</div>

				<button type="button" id="updateBtn" class="btn" onclick="goList()"
					style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
					<i class="fa fa-exchange"></i>&nbsp;<b style="font-size: 14px">수정</b>
				</button>

				<button type="button" class="btn btn-success"
					onclick="location.href='qnaList'"
					style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
					<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size: 14px">목록</b>
				</button>
			</form>
		</div>
	</div>
</body>
</html>
