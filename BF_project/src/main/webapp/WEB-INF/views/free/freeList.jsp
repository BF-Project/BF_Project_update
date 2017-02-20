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
	
	function freeDetail(frenum){
		location.href= "<%=request.getContextPath()%>/free/freeView?fre_num="+frenum;
		
	}
</script>

<style>
#freeList {
	margin: auto;
	width: 85%;
}

#writeBtn {
	margin-left: 65%;
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
						<b>자유</b> 게시판
					</h2>
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
						
							<c:otherwise>
								<c:forEach items="${freeList }" var="freeVO">
									
									<tr onclick="freeDetail('${freeVO.fre_num }')">
									
										<td>${freeVO.fre_num }</td>
										<td>${freeVO.fre_title }</td>
										<td>${freeVO.mbr_id }</td>
										<td>${freeVO.fre_date }</td>
										<td>${freeVO.fre_cnt }</td>
									</tr>
									
								</c:forEach>
							</c:otherwise>
							
						</c:choose>
						
					</table>
					<br>

					<center>
						<div>${paging }</div>
					</center>
					<!-- <select name="keyField" id="combo">
					<option value="fre_title">제목</option>
					<option value="mbr_id">작성자</option>
				</select>  -->
					<!-- <input type="text" id="keyWord" name="keyWord">
				 -->
					<div style="margin-left: 48%;">${paging }</div>
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
					style="padding:8px; background-color:gray;
					border:1px solid gray; border-radius:6px; color:white;">
					<i class="fa fa-pencil-square-o"></i>&nbsp;
					<b style="font-size:14px"></b>글작성
				</button>

		</div>
	</div>

</body>
</html>
