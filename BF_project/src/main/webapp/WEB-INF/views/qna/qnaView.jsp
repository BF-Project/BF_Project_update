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
	
	margin-left : 69.2%;
}

#list2 {
	margin-left : 80%;
}
th{
	font-size:16.5px;
	width:130px;
	font-weight:bold;
	width:200px;
}
td{
	font-size:14px;
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
					<b>Q & A</b> 고객 게시판
				</h2>
				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<br><br>

			<form name="formm" method="post" action="qnaView">
				<div class="container" style="height: 700px">
					<table class="table" id="qnaView1">
						<tr>
							<th><i class="fa fa-folder-open-o"/>글번호</th>
							<td>${qnaVO.qna_num}</td>
						</tr>
						
						<tr>
							<th>
							<i class="fa fa-edit spaceLeft"/>제목</th>
							<td>${qnaVO.qna_title}</td>
						</tr>
 
						<tr>
							<th>
							<i class="fa fa-edit spaceLeft"/>내용</th>
							<td colspan="3">${qnaVO.qna_content}</td>
						</tr>

						<tr>
							<th>
							<i class="fa fa-user"/>작성자</th>
							<td>${qnaVO.mbr_id}</td>
						</tr>

						<tr>
							<th>
							<i class="fa fa-clock-o"/>게시날짜</th>
							<td>${qnaVO.qna_date}</td>
						</tr>
						
					<c:if test="${!empty qnaVO.qna_pict_afat}"> 
						
						<tr>
							<th><i class="fa fa-image"/>사진첨부</th>
						<td>
							<img src="<%=request.getContextPath() %>/resources/upload/${qnaVO.qna_pict_afat}" width="200px">
							<a href="<%=request.getContextPath()%>/qnaphotoDownload/${qnaVO.qna_num}">
							<b style="color:#6495ed">파일 다운로드</b>
							</a>
						</td>
						
						</tr>
						</c:if>
						
						<tr>
						<th>답변내용</th>
						<td></td>
					</tr>
					</table>
					<br>
					<c:choose>
					<c:when test="${qnaVO.mbr_id==sessionScope.loginUser }">
						
						<!-- 수정  -->
						<button type="button" id="mod" class="btn"
							onclick="goUpdate('${qnaVO.qna_num}')"
							style="padding:8px; background-color:gray;
							border:1px solid gray; border-radius:6px; color:white;">
							<i class="fa fa-exchange"></i>&nbsp;<b style="font-size:14px"></b>수정
						</button>
						
						<!-- 삭제  -->
						<button type="button" id="del" class="btn"
							onclick="goDelete('${qnaVO.qna_num}')"
							style="padding:8px; background-color:gray;
							border:1px solid gray; border-radius:6px; color:white;">
							<i class="fa fa-eraser"></i>&nbsp;<b style="font-size:14px"></b>삭제
					 	</button>
						
						<!-- 목록 -->
						<button type="button" id="list" class="btn"
							onclick="location.href='qnaList'"
							style="padding:8px; background-color:gray;
							border:1px solid gray; border-radius:6px; color:white;">
							<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px"></b>목록
						</button>
					
					</c:when>
				
					<c:otherwise>
						<button type="button" id="list2" class="btn"
							onclick="location.href='qnaList'"
								style="padding:8px; background-color: gray; border: 1px solid gray; 
									border-radius: 6px; color:white;">
								 <i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px">목록</b>
						</button>
					</c:otherwise>
				</c:choose>
				</div>
				<br>
			</form>
		</div>
	</body>
</html>