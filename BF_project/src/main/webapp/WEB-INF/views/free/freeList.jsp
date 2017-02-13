<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<script>
	function gowrite() {
		document.free.action = "freeWrite";
		document.free.submit();
	}

	/* function gosearch() {
		if (document.free.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.free.keyWord.focus();
			return;
		}

		document.free.action = "freeList";
		document.free.submit();
	} */
	
	
</script>

<style>
#freeList {
	margin: auto;
	width: 85%;
}

#writeBtn {
	margin-left: 71%;
}

td, th {
	text-align: center;
}

#keyWord {
	margin-left: 38%;
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
			<form name="free" method="post">
				<div class="container">
					<table class="table table-hover" id="freeList">
						<tr style="font-size: 20px;">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시날짜</th>
							<th>조회수</th>
						</tr>

						<c:choose>
							<c:when test="${freeListSize<=0 }">
								<tr>
									<td width="100%" colspan="5" align="center" height="23">
										There are no registered Free.</td>
								</tr>
							</c:when>
							<%-- <c:when test="${!empty freeSearch }">
								<c:forEach items="${freeSearch }" var="freeVO">
									<tr>
										<th>${freeVO.fre_num}</th>
										<th><a href="freeView?fre_num=${freeVO.fre_num}">${freeVO.fre_title}</a></th>
										<th>${freeVO.mbr_id}</th>
										<th>${freeVO.fre_date}</th>
										<th>${FreeVO.fre_cnt }</th>
									</tr>
								</c:forEach>
							</c:when> --%>
							<c:otherwise>
								<c:forEach items="${freeList }" var="freeVO">
									<tr>
										<td>${freeVO.fre_num }</td>
										<td><a href="freeView?fre_num=${freeVO.fre_num }">
												${freeVO.fre_title }</a></td>
										<td>${freeVO.mbr_id }</td>
										<td>${freeVO.fre_date }</td>
										<td>${freeVO.fre_cnt }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<br>
					<div style="margin-left: 48%;">${paging }</div>

					<!-- <select name="keyField" id="combo">
					<option value="fre_title">제목</option>
					<option value="mbr_id">작성자</option>
				</select>  -->
					<!-- <input type="text" id="keyWord" name="keyWord">
				 -->

				</div>
			</form>
			<center>
				<div id="searchsearch">
					<form action="freeSearch" method="post">
						<input type="text" id="keyWord" name="keyWord" value="Search"
							style="font-size: 16px;"
							onFocus="if (this.value == 'Search') this.value = '';"
							onBlur="if (this.value == '') this.value = 'Search';"/>
					</form>
				</div>
			</center>
			<button type="button" id="writeBtn" class="btn" onclick="gowrite()"
				style="background-color: black;">글 작성</button>
			<!-- <input type="button" id="searchBtn" onclick="location.href='freeList'" value="목록"> -->
			<br><br>
		</div>
	</div>

</body>
</html>