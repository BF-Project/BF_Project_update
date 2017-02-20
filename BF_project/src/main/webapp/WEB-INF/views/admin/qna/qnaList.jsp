<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 17.        차승현      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<head>
	<style>
		.navbar-inverse .navbar-nav>.gggg>a, .navbar-inverse .navbar-nav>.active>a:focus,
		.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}
	</style>
	<style>
		.ggggThree, .navbar-inverse .navbar-nav>.active>a:focus,
		.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}
	</style>
	<!-- 검색버튼 css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/search.css" rel="stylesheet">
	
	<!-- checkbox를 꾸미기 위함 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<style>
	.checks {position: relative;} 
	
	.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); border: 0 } 
	
	.checks input[type="checkbox"] + label {
		display: inline-block; 
		position: relative; 
		cursor: pointer; 
		-webkit-user-select: none; 
		-moz-user-select: none; 
		-ms-user-select: none; } 
	
	.checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
		content: ' '; 
		display: inline-block; 
		width: 16px; /* 체크박스의 너비를 지정 */ 
		height: 16px; /* 체크박스의 높이를 지정 */ 
		line-height: 16px; /* 세로정렬을 위해 높이값과 일치 */ 
		margin: -2px 8px 0 0; 
		text-align: center; 
		vertical-align: middle; 
		background: white; 
		border: 1px solid #000000; 
		border-radius : 3px; 
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } 
	
	.checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { 
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } 
	
	.checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
		content: '\2714'; /* 체크표시 유니코드 사용 */ 
		color: blue; 
		text-shadow: 1px 1px skyblue; 
		background: white; 
	 	border-color: #000000; /* 검정 */
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }
	
	.checksall {position: relative;} 
	
	.checksall input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); border: 0 } 
	
	.checksall input[type="checkbox"] + label {
		display: inline-block; 
		position: relative; 
		cursor: pointer; 
		-webkit-user-select: none; 
		-moz-user-select: none; 
		-ms-user-select: none; } 
	
	.checksall input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
		content: ' '; 
		display: inline-block; 
		width: 16px; /* 체크박스의 너비를 지정 */ 
		height: 16px; /* 체크박스의 높이를 지정 */ 
		line-height: 16px; /* 세로정렬을 위해 높이값과 일치 */ 
		margin: -2px 8px 0 0; 
		text-align: center; 
		vertical-align: middle; 
		background: #E0FFFF; 
		border: 1px solid #000000; 
		border-radius : 3px; 
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } 
	
	.checksall input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { 
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } 
	
	.checksall input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
		content: '\2714'; /* 체크표시 유니코드 사용 */ 
		color: red; 
		text-shadow: 1px 1px hotpink; 
		background: #E0FFFF; 
	 	border-color: #000000; /* 검정 */
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }
	</style>
	<script>
		$(function(){
			$('input[type="checkbox"][name="checkQnASelectAll"]').click(function(){
				// click 이벤트가 발생했는지 체크
				if($(this).prop('checked')){ // 체크시
					$('input[type="checkbox"][name="checkQnA"]').prop('checked', true);
				}else{
					$('input[type="checkbox"][name="checkQnA"]').prop('checked', false);
				}
			});
		})
	</script>
	<style>
 		.table-hover>tbody>#hoverId:hover{ 
 			background-color: #BEEFFF; 
 		} 		
	</style>
	<script>
		function selectDelete(){
			var checkQnANumValue = new Array();
			$('input[type="checkbox"][name="checkQnA"]:checked').each(function (index){  
				checkQnANumValue[0] += $(this).val() + ",";  
		    });
// 		    alert(checkQnANumValue[0]);
		    $.ajax({
		    	url:"<%=request.getContextPath()%>/admin/qnaDelete",
		    	type:"post",
		    	dataType:"text",
		    	data:({
		    		checkQnaNumValue : checkQnANumValue[0]
		    	}),
			    success:function(data){
			    	if(data != 0){
			    		// rerolad
			    		location.reload();			    		
			    	}
			    },
			    error:function(error){
			    	alert('error');
			    }
		    })
		}
		
		function detailQna(qnaNum){
			location.href='<%=request.getContextPath()%>/admin/detailQna?qnaNum='+qnaNum+'&page=${page}&comboSelectQnA=${param.comboSelectQnA}'
		}
	</script>
</head>
<body>
	<c:if test="${!empty sessionScope.deleteCount}"> 
		<script>
			alert("Q&A 게시글이 ${deleteCount}개 삭제되었습니다.");
		</script>
		<c:remove var="deleteCount" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.selectQnADelete}">
		<script>
			alert("Q&A 해당 게시글이 삭제되었습니다.");
		</script>
		<c:remove var="selectQnADelete" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.respondComplete}">
		<script>
			alert("답변이 정상적으로 이루어졌습니다.");
		</script>
		<c:remove var="respondComplete" scope="session"/>
	</c:if>
	
	<div id="wrapper">                       
		<div id="page-wrapper" style="text-align: center; height: 947px;">
			<div class="row">
				<br><br>        
				<h1><b>Q & A 리스트</b></h1>
				<br>
				<div class="table-responsive">
				
				<!-- list -->
				<center>
				<table class="table table-hover" style="width:1300px; text-align: center;">
					<thead>
						<tr style="font-size: 20px">
							<th style="text-align:center; width:50px">
								<span class="checksall">
									<input type="checkbox" id=selectAll name=checkQnASelectAll>
									<label for=selectAll></label>
								</span>								
							</th>
							<th style="text-align:center; width:130px">글번호</th>
							<th style="text-align:center; width:560px">제목</th>
							<th style="text-align:center; width:180px">작성자</th>
							<th style="text-align:center; width:160px">게시날짜</th>
							<th style="text-align:center; width:110px">조회수</th>
							<th style="text-align:center; width:110px">답변여부</th>
						</tr>					
					<thead>
						<c:choose>
							<c:when test="${qnaListSize<=0}">
								<tbody>
									<tr>
										<td colspan="7" align="center">Q & A 목록이 없습니다.</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<tbody>
									<c:forEach items="${qnaList}" var="QnAVO" varStatus="count" >
										<tr id="hoverId">
											<td>
												<span class="checks">
													<input type="checkbox" id=${count.index} name=checkQnA value="${QnAVO.qna_num}">
													<label for=${count.index}></label>
												</span>
											</td>
											<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.qna_num}</td>
											<c:choose>
												<c:when test="${QnAVO.qna_secrit eq 'Y'}">
													<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.qna_title}<b style="color:hotpink">&nbsp;(비밀글)</b></td>
												</c:when>
												<c:otherwise>
													<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.qna_title}</td>
												</c:otherwise>
											</c:choose>
											<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.mbr_id}</td>
											<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.qna_date}</td>
											<td onclick="detailQna('${QnAVO.qna_num}')">${QnAVO.qna_cnt}</td>
											<c:choose>
												<c:when test="${QnAVO.qna_respond_yn eq 'N'}">
													<td onclick="detailQna('${QnAVO.qna_num}')"><b style="color:red">답변대기</b></td>
												</c:when>
												<c:otherwise>
													<td onclick="detailQna('${QnAVO.qna_num}')"><b style="color:blue">답변완료</b></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</c:otherwise>
						</c:choose>
						<tr>
						</tr>
				</table>
				</center>
				<!-- list : end -->
				<span style="text-aling:center;"> ${paging} </span>
					<c:if test="${empty paging}">
						<span style="text-aling:center;"> &nbsp; </span>
				</c:if>
				<!-- 검색 -->
				<div id="search-form">
					<form method="get" action="QnAList">
						<c:choose>
							<c:when test="${!empty param.comboSelectQnA}">
								<c:if test="${param.comboSelectQnA eq 'comboTitle' or param.comboSelectQnA eq 'Title'}">
									<select name="comboSelectQnA" style="height: 30px">
										<option value="">&nbsp;</option>
									    <option value="comboTitle" selected>제목</option>
									    <option value="comboId">아이디</option>
									</select>
								</c:if>
								<c:if test="${param.comboSelectQnA eq 'comboId' or param.comboSelectQnA eq 'ID'}">
									<select name="comboSelectQnA" style="height: 30px">
										<option value="">&nbsp;</option>
									    <option value="comboTitle">제목</option>
									    <option value="comboId" selected>아이디</option>
									</select>
								</c:if>
								<c:if test="${param.comboSelectQnA eq 'NOMAL'}">
									<select name="comboSelectQnA" style="height: 30px">
										<option value="" selected>&nbsp;</option>
									    <option value="comboTitle">제목</option>
									    <option value="comboId">아이디</option>
									</select>
								</c:if>
							</c:when>
							<c:otherwise>
								<select name="comboSelectQnA" style="height: 30px">
									<option value="" selected>&nbsp;</option>
								    <option value="comboTitle">제목</option>
								    <option value="comboId">아이디</option>
								</select>
							</c:otherwise>
						</c:choose>
						&nbsp;
						<input type="text" id="search" name="search" value="Search" style="font-size: 16px;" 
						onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
					</form>
				</div>
				<!-- 검색 : end -->
				
				<!-- button -->
				<button type="button" class="btn btn-default" onclick="selectDelete()" 
						style="padding:8px; margin-left: -1180px; margin-top:-160px; position:relative; z-index:0">
					<b style="font-size:14px">선택삭제</b>&nbsp;<i class="fa fa-eraser"></i>
				</button>
				<!-- button -->
				</div>
			</div>
		</div>
	</div>
</body>