<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<style>
		.navbar-inverse .navbar-nav>.bbbb>a, .navbar-inverse .navbar-nav>.active>a:focus,
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
		$('input[type="checkbox"][name="checkMemberSelectAll"]').click(function(){
			// click 이벤트가 발생했는지 체크
			if($(this).prop('checked')){ // 체크시
				$('input[type="checkbox"][name="checkMember"]').prop('checked', true);
			}else{
				$('input[type="checkbox"][name="checkMember"]').prop('checked', false);
			}
		});
	})
	</script>
	<script>
	function selectDelete(){
		var checkMemberKey = new Array();
		$('input[type="checkbox"][name="checkMember"]:checked').each(function(index){
			checkMemberKey[0] += $(this).val() + ",";  
		});
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/SelectMemberDelete",
			type:"post",
			dataType:"text",
			data : ({
				checkMemberKey : checkMemberKey[0]
			}),
			success:function(data){
				if(!(data=="0")){
					location.href='memberOperate?page=${page}&selectDelete='+data;
				}else{
					alert('선택한 회원이 없습니다.');
				}
			},
			error:function(error){
				alert('회원을 정지시키지 못했습니다.');
			}
		})
	}
	</script>
	<script>
		function selectReuse(){
			var checkMemberReuse = new Array();
			$('input[type="checkbox"][name="checkMember"]:checked').each(function(index){
				checkMemberReuse[0] += $(this).val() + ",";  
			});
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/SelectMemberReuse",
				type : "post",
				dataType : "text",
				data : ({
					checkMemberReuse : checkMemberReuse[0]
				}),
				success:function(data){
					if(!(data=="0")){
						location.href='memberOperate?page=${page}&reuseMember='+data;
					}else{
						alert('선택한 회원이 없습니다.');
					}
				},
				error:function(error){
					alert('회원을 재사용시키지 못했습니다.');
				}
			})
		}
	</script>
	<script>
		// 사용여부로 검색
		function useYN_Whether(choice){
			var myChoice = choice; 
			location.href='memberOperate?choiceUseYNT='+myChoice; // +'&comboSelectMember=${param.comboSelectMember}';
		}
	</script>
	<script>
		// 회원 상세보기
		function detailMember(member_select_Id){
			location = '<%=request.getContextPath()%>/admin/memberDetail?&member_select_Id='+member_select_Id+'&page=${page}';
		}
	</script>
</head>
<body>
	<c:if test="${!empty sessionScope.selectDeleteCount}">
		<script>
			alert('회원을 ${selectDeleteCount}명 사용불가 시켰습니다.');
		</script>
		<c:remove var="selectDeleteCount" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.reuseMemberCount}">
		<script>
			alert('회원을 ${reuseMemberCount}명 재사용 시켰습니다.');
		</script>
		<c:remove var="reuseMemberCount" scope="session"/>
	</c:if>
	
	<div id="wrapper">                       
		<div id="page-wrapper" style="text-align: center; height: 986px;">
			<div class="row">
				<br><br>        
				<h1><b>회원목록</b><br>
					<span style="font-size: 25px"> | Use('Y') ${memberUseYCount}명 | </span>
<!-- 					<span style="font-size: 25px">아이디 정지 or 사용여부자 확인<i class="fa fa-arrow-right"></i></span> -->
				</h1>
				<br>
				<div class="table-responsive">
					<center>
					<table class="table table-hover" style="width:1300px; text-align: center;">
						<thead>
							<tr style="font-size: 20px">
								<th style="text-align:center; width:50px">
									<span class="checksall">
										<input type="checkbox" id=selectAll name=checkMemberSelectAll>
										<label for=selectAll></label>
									</span>								
								</th>
								<th style="text-align:center; width:100px">
								아이디
								</th>
								<th style="text-align:center; width:200px">이름</th>
								<th style="text-align:center; width:200px">전화번호</th>
								<th style="text-align:center; width:300px">E-mail</th>
								<th style="text-align:center; width:150px">생년월일</th>
								<th style="text-align:center; width:150px">가입일</th>
								<th style="text-align:center; width:150px">
								사용여부
									<a href="javascript:;" data-toggle="collapse" data-target="#useyn">
										<i class="fa fa-fw fa-caret-down"></i>
									</a>
									<ul id="useyn" class="collapse" style="font-size: 15px">
										<li style="text-align: left"><a href="#" onclick="useYN_Whether('Total')">Total</a></li>
										<li style="text-align: left"><a href="#" onclick="useYN_Whether('Y')">Use(Y)</a></li>
										<li style="text-align: left"><a href="#" onclick="useYN_Whether('N')">Unuse(N)</a></li>
									</ul>
								</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${memberListSize<=0}">
								<tbody>
									<tr>
										<td colspan="8" align="center">회원 목록이 없습니다.</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<tbody>
									<c:forEach items="${memberList}" var="MbrVO" varStatus="count" >
										<!-- <form name="MemberListForm"> -->
										<tr id="hoverId">
											<td>
												<span class="checks">
													<input type="checkbox" id=${count.index} name=checkMember value="${MbrVO.mbr_id}">
													<label for=${count.index}></label>
												</span>
											</td>
											<td onclick="detailMember('${MbrVO.mbr_id}')">${MbrVO.mbr_id}</td>
											<td onclick="detailMember('${MbrVO.mbr_id}')">${MbrVO.mbr_nm}</td>
											<td onclick="detailMember('${MbrVO.mbr_id}')">${MbrVO.mbr_phone}</td>
											<td onclick="detailMember('${MbrVO.mbr_id}')">${MbrVO.mbr_eml}</td>
											<td onclick="detailMember('${MbrVO.mbr_id}')"><fmt:formatDate value="${MbrVO.mbr_brt}" pattern="yyyy-MM-dd"/></td>
											<td onclick="detailMember('${MbrVO.mbr_id}')"><fmt:formatDate value="${MbrVO.mbr_date}" pattern="yyyy-MM-dd"/></td>
											<td onclick="detailMember('${MbrVO.mbr_id}')">${MbrVO.mbr_use_yn}</td>
										</tr>
										<!-- <form name="MemberListForm"> -->
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
							<form method="get" action="memberOperate">
								<!-- c -->
								<c:choose>
									<c:when test="${!empty param.comboSelectMember}">
										<c:if test="${param.comboSelectMember eq 'comboName'}">
											<select name="comboSelectMember" style="height: 30px">
												    <option value="comboName" selected>이름</option>
												    <option value="comboId">아이디</option>
												    <option value="comboPhone">전화번호</option>
											</select>
										</c:if>
										<c:if test="${param.comboSelectMember eq 'comboId'}">
											<select name="comboSelectMember" style="height: 30px">
											    <option value="comboName">이름</option>
											    <option value="comboId" selected>아이디</option>
											    <option value="comboPhone">전화번호</option>
											</select>
										</c:if>
										<c:if test="${param.comboSelectMember eq 'comboPhone'}">
											<select name="comboSelectMember" style="height: 30px">
											    <option value="comboName">이름</option>
											    <option value="comboId">아이디</option>
											    <option value="comboPhone" selected>전화번호</option>
											</select>
										</c:if>
									</c:when>
									<c:otherwise>
										<select name="comboSelectMember" style="height: 30px">
										    <option value="comboName" selected>이름</option>
										    <option value="comboId">아이디</option>
										    <option value="comboPhone">전화번호</option>
										</select>
									</c:otherwise>
								</c:choose>
								<!-- c -->
								&nbsp;
								<input type="text" id="search" name="search" value="Search" style="font-size: 16px;" 
								onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
							</form>
						</div>
						<button type="button" class="btn btn-warning" onclick="selectDelete()" 
						style="padding:8px; margin-left: -1000px; margin-top:-160px; position:relative; z-index:0">
							<b style="font-size:14px">선택 아이디 정지</b>&nbsp;<i class="fa fa-eraser"></i>
						</button>
						<button type="button" class="btn btn-info" onclick="selectReuse()" 
						style="padding:8px; margin-left: 0px; margin-top:-160px; position:relative; z-index:0">
							<b style="font-size:14px">선택 아이디 재사용</b>&nbsp;<i class="fa fa-retweet"></i>
						</button>
				</div>
			</div>
		</div>
	</div>
	
</body>