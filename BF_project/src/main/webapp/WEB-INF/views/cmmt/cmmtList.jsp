<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<script>
	function gowrite() {
		document.form1.action = "cmmtWrite";
		document.form1.submit();
	}

	function cmmtDetatil(cmmtnum){
	
		location.href="<%=request.getContextPath()%>/cmmt/cmmtView?cmmt_num="+cmmtnum;
		
	}
</script>

<style>
 	#writeBtn {
		margin-left : 65%;
		
	}
	
	#paging {
		margin-left : 48%;
	}
			
	#cmmtList {
		margin : auto;
		width : 70%;
	}
	
	/*추가 */
	#cmmtcmtDetailView {
		margin: auto;
		width: 85%;
	}
	
	th{
		font-size: 20px;
		width:130px;
		text-align : center;
	}
	
	td{
		font-size: 14px;
		text-align : center;
	}
		
	a{
		color:#999;
	}
		
	.table>tbody>#hoverId:hover{ 
 		background-color: #e8e8e8; 
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
						<b>커뮤니티</b> 고객 게시판
					</h2>
				</div>
			</section>
			
			<!-- //BREADCRUMBS -->
			<br>
			<form name="form1" method="post" >
				<div class="container">
					<table class="table table-hover" id="cmmtcmtDetailView">
						<tr style="font-size: 20px">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시날짜</th>
							<th>조회수</th>
						</tr>

						<c:choose>
							<c:when test="${cmmtListSize<=0}">
								<tr>
									<td width="100%" colspan="5" align="center" height="23">
										There are no registered Q&A.</td>
								</tr>
							</c:when>
					
							<c:otherwise>
								<c:forEach items="${cmmtList}" var="cmmtVO">
										<!-- 수정1. -->
										<tr onclick="cmmtDetatil('${cmmtVO.cmmt_num}')">
										<td>${cmmtVO.cmmt_num}</td>
										<td>${cmmtVO.cmmt_title }</td>
										<td>${cmmtVO.mbr_id }</td>
										<td>${cmmtVO.cmmt_date }</td>
										<td>${cmmtVO.cmmt_cnt }</td>
									</tr>
									
								</c:forEach>
							</c:otherwise>

						</c:choose>
					
					</table>

					<div id="paging">${paging}</div>
		
				</div>
			</form>
					
			<!-- 검색 -->
			<center>
			<div id="searchsearch" style="margin-left: 40px">
			<form method="post" action="search">
			<input type="text" id="search" name="search" value="TitleSearch" style="font-size: 16px;" 
				onFocus="if (this.value == 'TitleSearch') this.value = '';" onBlur="if (this.value == '') this.value = 'TitleSearch';" />
			
			</form>
		</div>
	</center>
			<button type="button" id="writeBtn" class="btn" onclick="gowrite(this.form)" style="padding:8px; background-color:gray;
							border:1px solid gray; border-radius:6px; color:white;">
							<i class="fa fa-pencil-square-o"></i>&nbsp;
							<b style="font-size:14px"></b>글작성
							</button>
	
		</div>
	</div>
</body>