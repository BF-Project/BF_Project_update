<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<style>
		.navbar-inverse .navbar-nav>.dddd>a, .navbar-inverse .navbar-nav>.active>a:focus,
		.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}	
	</style>
	<style>
 		.table-hover>tbody>#hoverId:hover{ 
 			background-color: #BEEFFF; 
 		} 		
	</style>
	<!-- 검색버튼 css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/search.css" rel="stylesheet">
	<script>
		function detail(noticeNum){
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/noticeDetail",
				type : "post",
				dataType : "text",
				data : ({
					noticeNum : noticeNum
				}),
				success:function(){
					location='<%=request.getContextPath()%>/admin/noticeDetailView?page=${page}'
				},
				error:function(error){
					alert('error');
				}
			});
		}
	</script>
	
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
		$('input[type="checkbox"][name="checkNoticeNumSelectAll"]').click(function(){
			// click 이벤트가 발생했는지 체크
			if($(this).prop('checked')){ // 체크시
				$('input[type="checkbox"][name="checkNoticeNum"]').prop('checked', true);
			}else{
				$('input[type="checkbox"][name="checkNoticeNum"]').prop('checked', false);
			}
		});
	})
	
	function selectDelete(){
		var checkNoticeNumValue = new Array();
		$('input[type="checkbox"][name="checkNoticeNum"]')
		$('input:checkbox:checked').each(function (index){  
			checkNoticeNumValue[0] += $(this).val() + ",";  
	    });
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/noticeSelectDelete",
			type:"post",
			dataType:"text",
			data : ({
				checkNoticeNumValue : checkNoticeNumValue[0]
			}),
			success:function(data){
				if(!data=="0"){
					location.href='notice?page=${page}&selectDelete='+data;
				}else{
					alert('공지사항을 삭제하지 못했습니다.');
				}
			},
			error:function(error){
				alert('error');
			}
		})
	}
	</script>
</head>
<body>
	
	<c:if test="${!empty sessionScope.noticeInsertOK}">
		<script>
			alert('공지사항을 등록했습니다.');
		</script>
		<c:remove var="noticeInsertOK" scope="session" />
	</c:if>
	
	<c:if test="${!empty sessionScope.delete }">
		<script>
			alert('공지사항을 삭제했습니다.');
		</script>
		<c:remove var="delete" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.selectDeleteCount}">
		<script>
			alert('공지사항을 '+'${selectDeleteCount}'+'개 삭제했습니다.');
		</script>
		<c:remove var="selectDeleteCount" scope="session" />
	</c:if>
	
	<div id="wrapper">                       
		<div id="page-wrapper" style="text-align: center; height: 947px;">
			<div class="row">
				<br><br>        
				<h1><b>공지사항</b></h1>
				<br>
				<div class="table-responsive">
					<center>
					<table class="table table-hover" style="width:1300px; text-align: center;">
						<thead>
							<tr style="font-size: 20px">
								<th style="text-align:center; width:50x">
									<span class="checksall">
										<input type="checkbox" id=selectAll name=checkNoticeNumSelectAll>
										<label for=selectAll></label>
									</span>
								</th>
								<th style="text-align:center; width:130px">글번호</th>								
								<th style="text-align:center; width:650px">제목</th>
								<th style="text-align:center; width:170px">작성자</th>
								<th style="text-align:center; width:200px">게시날짜</th>
								<th style="text-align:center; width:100px">조회수</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${noticeListSize<=0}">
								<tbody>
									<tr>
										<td colspan="6" align="center">등록된 공지사항이 없습니다.</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<tbody>
									<c:forEach items="${noticeList}" var="NoticeVO" varStatus="count" >
<!-- 										<form name="noticeForm"> -->
										<tr id="hoverId">
											<td id="noticeNum">
												<span class="checks">
													<input type="checkbox" id=${count.index} name=checkNoticeNum value="${NoticeVO.notice_num}">
													<label for=${count.index}></label>
												</span>
											</td>
											<td onclick="detail(${NoticeVO.notice_num})">${NoticeVO.notice_num}</td>
											<td onclick="detail(${NoticeVO.notice_num})">${NoticeVO.notice_title}</td>
											<td onclick="detail(${NoticeVO.notice_num})">${NoticeVO.admin_id}</td>
											<td onclick="detail(${NoticeVO.notice_num})">${NoticeVO.notice_date}</td>
											<td onclick="detail(${NoticeVO.notice_num})">${NoticeVO.notice_cnt}</td>
										</tr>
<!-- 										</form> -->
									</c:forEach>
								</tbody>
							</c:otherwise>
						</c:choose>
						<tr>
						</tr>
					</table>
					</center>
						<span style="text-aling:center;"> ${paging} </span>
						<c:if test="${empty paging}">
							<span style="text-aling:center;"> &nbsp; </span>
						</c:if>
						<!-- 검색 -->
						<div id="search-form">
							<form method="get" action="notice">
								<input type="text" id="search" name="search" value="Title Search" style="font-size: 16px;" 
								onFocus="if (this.value == 'Title Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Title Search';" />
							</form>
						</div>
						<!-- 검색 : end -->
						
						<!-- 글쓰기  -->
						<button type="button" class="btn btn-default" onclick="location.href='write?page=${page}'" 
						style="padding:8px; margin-left: -140px; margin-top:-160px; position:relative; z-index:0">
							<b style="font-size:14px">글쓰기</b>&nbsp;<i class="fa fa-edit spaceLeft"></i>
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- 글쓰기 :end -->
						<button type="button" class="btn btn-default" onclick="selectDelete()" 
						style="padding:8px; margin-left: -1180px; margin-top:-160px; position:relative; z-index:0">
							<b style="font-size:14px">선택삭제</b>&nbsp;<i class="fa fa-eraser"></i>
						</button>
				</div>
			</div>
		</div>
	</div>
</body>