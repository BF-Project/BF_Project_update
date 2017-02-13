<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<style>
		#paging {
			margin-left : 48%;
		}
		
		td, th {
			text-align : center;
		}
		
		#noticeList {
			margin : auto;
			width : 85%;
		}
		.table>tbody>#hoverId:hover{ 
 			background-color: #e8e8e8; 
 		} 
	</style>
	
	<script>
		function detail(noticeNum){
			$.ajax({
				url : "<%=request.getContextPath()%>/notice/detailNotice",
				type : "post",
				dataType : "text",
				data : ({
					noticeNum : noticeNum
				}),
				success:function(data){
					location='<%=request.getContextPath()%>/notice/detailNoticeView?page=${page}';
				},
				error:function(error){
					alert('error');
				}
			});
		}
	</script>
</head>
<body>
	<!-- PRELOADER -->
	<!-- 로딩 이미지 -->
	<img id="preloader"	src="<%=request.getContextPath()%>/resources/images/preloader.gif" alt="" />
	
	<!-- //PRELOADER -->
	<div class="preloader_hide" style="height: 950px">
		<div class="qnaHeader">
		
		<section class="breadcrumbs_block clearfix parallax">
			<div class="container center">
				<h2>
					<b>공지사항</b> 게시판
				</h2>
			</div>
		</section>
		<br>
		<!-- 리스트 -->
		<div class="container">
			<table id="noticeList" class="table">
				<tr style="font-size: 20px">
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>게시날짜</th>
					<th>조회수</th>
				</tr>

				<c:choose>
					<c:when test="${noticeListSize<=0}">
						<tbody>
							<tr style="font-size: 14px">
								<td width="100%" colspan="5" align="center" height="23">등록된 공지사항이 없습니다.</td>
							</tr>
						</tbody>
					</c:when>
					<c:otherwise>
					
						<tbody>
							<c:forEach items="${noticeList}" var="NoticeVO" varStatus="count" >
								<tr id="hoverId" style="font-size: 14px" onclick="detail(${NoticeVO.notice_num})">
									<td id="noticeNum">${NoticeVO.notice_num}</td>
									<td>${NoticeVO.notice_title}</td>
									<td>${NoticeVO.admin_id}</td>
									<td>${NoticeVO.notice_date}</td>
									<td>${NoticeVO.notice_cnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:otherwise>
				</c:choose>
				<tr></tr>
			</table>
			<br>
			<div id="paging" style="font-size: 16px">
				${paging }
			</div>
		</div>
			
			<!-- 검색 -->
			<center>
			<div id="searchsearch" style="margin-left: 40px">
				<form method="get" action="main">
				<input type="text" id="search" name="search" value="Title Search" style="font-size: 16px;" 
				onFocus="if (this.value == 'Title Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Title Search';" />
				</form>
			</div>
			</center>
			
			<!-- 검색 : end -->
		<!-- 리스트 : end -->
		</div>
	</div>
</body>
