<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
	function goList() {
		document.form2.action = "cmmtUpdateForm";
		document.form2.method = "post";
		document.form2.submit();
	}
</script>

<style>
#gobtn1 {
	margin-left: 40.3%;
}

#titletext {
	margin-right: 135px;
}

#titletext1 {
	margin-right: 341px;
}

#content1 {
	margin-right: 320px;
}

#hideimg {
	margin-right: 165px;
}

#file {
	margin-right: 120px;
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
	margin-right: 6%;
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
						<b>커뮤니티</b> 게시판
					</h2>
					<p>'커뮤니티 게시판 수정 '페이지 입니다.</p>
				</div>
			</section>
			<!-- //BREADCRUMBS -->

			<center>
				<div class="container">
					<form name="form2" method="post" id="cmmtUpdate"
						action="cmmtUpdateForm" enctype="multipart/form-data">

						<input type="text" name="cmmt_num" hidden="hidden"
							value="${cmmtVO.cmmt_num}">
						<div class="form-group">
							<br> <label for="usr" id="titletext1">제목</label><br> <input
								type="text" id="titletext" class="form-control"
								name="cmmt_title" value="${cmmtVO.cmmt_title}"
								style="width: 20%;">
						</div>

						<div class="form-group">
							<label id="content1">내용</label><br>
							<textarea class="form-control" rows="8" cols="65" id="content2"
								name="cmmt_content" style="width: 32%; height: 300px;">${cmmtVO.cmmt_content}</textarea>
						</div>

						<!--사진수정  -->
						<div class="form-group">
							<input type="hidden" class="form-control" name="nofile"
								value="${cmmtVO.cmmt_pict_afat}">
							<c:if test="${!empty cmmtVO.cmmt_pict_afat}">
								<img
									src="<%=request.getContextPath() %>/upload/${cmmtVO.cmmt_pict_afat}"
									width="200pt" id="hideimg">
							</c:if>
						</div>

						<div class="file_input">
							<label> <i class="fa fa-photo"></i>&nbsp;사진첨부 <input
								type="file" name="file"
								onchange="javascript:document.getElementById('file_route').value=this.value">
							</label> <input type="text" readonly="readonly" title="File Route"
								id="file_route">
						</div>
					</form>
			</center>
		</div>

		<div id="gobtn1">
			<button type="button" class="btn" onclick="goList()"
				style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
				<i class="fa fa-exchange"></i>&nbsp;<b style="font-size: 14px">수정</b>
			</button>

			<!-- 목록 -->
			<button type="button" class="btn" onclick="location.href='cmmtList'"
				style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
				<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size: 14px">목록</b>
			</button>
		</div>
	</div>
	</div>
</body>
