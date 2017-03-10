<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>

<script>
	function gowrite() {
		document.form1.action = "qnaWrite";
		document.form1.submit();
	}
</script>

<style>
#writeBtn {
	margin-left: 69.7%;
}

#paging {
	margin-left: 48%;
}

td, th {
	text-align: center;
}

#qnaList {
	margin: auto;
	width: 85%;
}
</style>
<script>
		function qnaDetatil(qnanum){
			$.ajax({
				url : "<%=request.getContextPath()%>/qna/qnaViewBeforYN",
			type : "post",
			dataType : "text",
			data : ({
				qna_num : qnanum
			}),
			success : function(data) {
				if (data == 'yes') {
					location.href = 'qnaView?qna_num=' + qnanum;
				} else {
					alert('비밀글입니다.');
				}

			},
			error : function(error) {
				alert('error');
			}
		})
	}

						
	</script>

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
				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<br>
			<form name="form1" method="post">
				<div class="container">
					<table class="table table-hover" id="qnaList">
						<tr style="font-size: 20px">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시날짜</th>
							<th>조회수</th>
						</tr>

						<c:choose>
							<c:when test="${qnaListSize<=0}">
								<tr>
									<td width="100%" colspan="5" align="center" height="23">
										There are no registered Q&A.</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${qnaList}" var="qnaVO">
									<!-- //////////////////////////////////////////// -->
									<c:if test="${qnaVO.qna_secrit eq 'Y'}">
										<c:if test="${qnaVO.mbr_id eq sessionScope.loginUser}">
											<tr onclick="qnaDetatil('${qnaVO.qna_num}')">
												<td>${qnaVO.qna_num }</td>
												<td>${qnaVO.qna_title}(비밀글)</td>
												<td>${qnaVO.mbr_id }</td>
												<td>${qnaVO.qna_date }</td>
												<td>${qnaVO.qna_cnt }</td>
											</tr>
										</c:if>
										<c:if test="${!(qnaVO.mbr_id eq sessionScope.loginUser)}">
											<tr onclick="qnaDetatil('${qnaVO.qna_num}')">
												<td>${qnaVO.qna_num }</td>
												<td><b style="color: red"><ins>${qnaVO.qna_title}
															(비밀글)</ins></b></td>
												<td>${qnaVO.mbr_id }</td>
												<td>${qnaVO.qna_date }</td>
												<td>${qnaVO.qna_cnt }</td>
											</tr>
										</c:if>
									</c:if>
									<c:if test="${qnaVO.qna_secrit eq 'N'}">
										<tr onclick="qnaDetatil('${qnaVO.qna_num}')">
											<td>${qnaVO.qna_num }</td>
											<!-- 수정1. -->
											<td>${qnaVO.qna_title }</td>
											<td>${qnaVO.mbr_id }</td>
											<td>${qnaVO.qna_date }</td>
											<td>${qnaVO.qna_cnt }</td>
										</tr>
									</c:if>
									<!-- //////////////////////////////////////////// -->
									
								</c:forEach>
							</c:otherwise>
												
						</c:choose>
						
					
						
						
					</table>

					<div id="paging">${paging }</div>

				</div>
			</form>

			<!-- 검색 -->
			<center>
				<div id="searchsearch" style="margin-left: 40px">
					<form method="post" action="search">
						<input type="text" id="search" name="search" value="TitleSearch"
							style="font-size: 16px;"
							onFocus="if (this.value == 'TitleSearch') this.value = '';"
							onBlur="if (this.value == '') this.value = 'TitleSearch';" />

					</form>
				</div>
			</center>
			<button type="button" id="writeBtn" class="btn"
				onclick="gowrite(this.form)"
				style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
				<i class="fa fa-pencil-square-o"></i>&nbsp; <b
					style="font-size: 14px"></b>글작성
			</button>
		</div>
	</div>
</body>
</html>
