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
		margin-left : 76%;
		
	}
	
	#paging {
		margin-left : 48%;
	}
	
	td, th {
		text-align : center;
	}
	
	#cmmtList {
		margin : auto;
		width : 70%;
	}
	
	/*추가 */
		#cmmtcmtDetailView {
			margin: auto;
			width: 70%;
			
		}
		th{
			font-size: 16.5px;
			width:130px;
		}
		td{
			font-size: 14px;
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
					<br> <br>
					<p>'커뮤니티 게시판' 페이지 입니다.</p>
				</div>
			</section>
			
			<!-- //BREADCRUMBS -->
			<br>
			<form name="form1" method="post" >
				<div class="container">
					<table class="table table-hover" id="cmmtcmtDetailView">
						<tr>
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

					<div id="paging">
						${paging }
					</div>
	<button type="button" id="writeBtn" class="btn" onclick="gowrite(this.form)" style="background-color:black;">글 작성</button>
		
				</div>
			</form>
					
			<!-- 검색 -->
			<center>
			<div id="searchsearch" style="margin-left: 40px">
			<form method="post" action="search">
			<input type="text" id="search" name="search" value="Search" style="font-size: 16px;" 
				onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
				
			</form>
			</div>
		</center>
			
			<!-- <input type="button" value="글 작성" onclick="gowrite(this.form)"> -->
				
			
		</div>
	</div>
</body>