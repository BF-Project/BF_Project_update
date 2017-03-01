<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<style>
		.navbar-inverse .navbar-nav>.bbbb>a, .navbar-inverse .navbar-nav>.active>a:focus,
		.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}	
	</style>
	<style>
		#label{
			text-align: left;
		}
	</style>
	<script>
		function oneIdDelete(memberid){
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/oneMemberDelete",
				type : "post",
				dataType : "text",
				data : ({
					memberid : memberid
				}),
				success:function(data){
		 			window.location.reload();		 			
				},
				error:function(error){
					alert('error');
				}
			})
		}
		
		function oneIdreUse(memberid){
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/oneMemberReuse",
				type : "post",
				dataType : "text",
				data : ({
					memberid : memberid
				}),
				success:function(data){
					window.location.reload();
				},
				error:function(error){
					alert('error');
				}
			})
		}
	</script>
</head>
<body>
	<c:if test="${!empty sessionScope.memberId}">
		<script>
			alert('${memberId} 아이디를 정지했습니다.');
		</script>
		<c:remove var="memberId" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.memberReuseId}">
		<script>
			alert('${memberReuseId} 아이디를 재사용 시켰습니다.');
		</script>
		<c:remove var="memberReuseId" scope="session"/>
	</c:if>
	
	<c:if test="${!empty sessionScope.memberUpdateYY}">
		<script>
			alert('${memberUpdateYY} 회원을 수정하였습니다.');
		</script>
		<c:remove var="memberUpdateYY" scope="session"/>
	</c:if>
	
	<div id="wrapper">
		<div id="page-wrapper" style="text-align: center; height: 906.5px;">
			<div class="row">
			
			<!-- 회원 상세보기 -->
			<br><br><h1><b>회원 상세보기</b></h1>
				<div class="table-responsive">
				<div class="page-header"></div>
				
					<!-- tableForm -->
					<article class="container">
						<div class="col-md-6 col-md-offset-3">
							<table id="label" style="width:880px; margin-left: -150px" >
								<tr>
									<td><label for="InputId">&nbsp;&nbsp;아이디</label></td>
									<td style="width:60px"></td>
									<td><label for="InputPassword1">&nbsp;&nbsp;비밀번호</label></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="InputId" value="${memberVo.mbr_id}" readonly></td>
									<td></td>
									<td><input type="password" class="form-control" name="InputPassword1" value="${memberVo.mbr_pwd}" readonly></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td><label for="username">&nbsp;&nbsp;이름</label> </td>
									<td></td>
									<td><label for="usernumber">&nbsp;&nbsp;휴대폰 번호</label></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="username" value="${memberVo.mbr_nm}" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="usernumber" value="${memberVo.mbr_phone}" readonly></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td><label for="InputEmail">&nbsp;&nbsp;이메일</label></td>
									<td></td>
									<td><label for="InputAddr">&nbsp;&nbsp;주소</label></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="InputEmail" value="${memberVo.mbr_eml}" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="InputAddr" value="${memberVo.mbr_addr}" readonly></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td><label for="InputBirth">&nbsp;&nbsp;생년월일</label></td>
									<td></td>
									<td><label for="InputGender">&nbsp;&nbsp;성별</label></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="InputBirth" value="<fmt:formatDate value="${memberVo.mbr_brt}" pattern="yyyy-MM-dd"/>" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="InputGender" value="${memberVo.mbr_gnd}" readonly></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td><label for="joinDate">&nbsp;&nbsp;가입날짜</label></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="joinDate" value="<fmt:formatDate value="${memberVo.mbr_date}" pattern="yyyy-MM-dd"/>" readonly></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td><label for="Useyn">&nbsp;&nbsp;사용여부</label></td>
									<td></td>
									<td><label for="EmailRecive">&nbsp;&nbsp;이메일 수신여부</label></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" name="Useyn" value="${memberVo.mbr_use_yn}" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="EmailRecive" value="${memberVo.mbr_eml_yn}" readonly></td>
								</tr>
							</table>
						</div>
					</article>
					<!-- tableForm : end -->
					<!-- button -->
					<c:choose>
						<c:when test="${memberVo.mbr_use_yn eq 'Y'}">
							<button type="button" class="btn btn-warning" onclick="oneIdDelete('${memberVo.mbr_id}')" 
								style="padding:8px; margin-top:40px; position:relative; z-index:0">
									<b style="font-size:14px">아이디 정지</b>&nbsp;<i class="fa fa-eraser"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-warning" onclick="oneIdreUse('${memberVo.mbr_id}')" 
								style="padding:8px; margin-top:40px; position:relative; z-index:0">
									<b style="font-size:14px">아이디 재사용</b>&nbsp;<i class="fa fa-retweet"></i>
							</button>
						</c:otherwise>
					</c:choose>
					<button type="button" class="btn btn-info" onclick="location.href='<%=request.getContextPath()%>/admin/memberUpdateView?page=${page}&memberid=${memberVo.mbr_id}&comboSelectMember=${param.comboSelectMember}'"
						style="padding:8px; margin-left:10px; margin-top:40px; position:relative; z-index:0">
							<b style="font-size:14px">정보 수정하기</b>&nbsp;<i class="fa fa-edit spaceLeft"></i>
					</button>						
					<button type="button" class="btn btn-default" onclick="location.href='memberOperate?page=${page}&comboSelectMember=${param.comboSelectMember}'" 
						style="padding:8px; margin-left:10px; margin-top:40px; position:relative; z-index:0">
							<b style="font-size:14px">목록</b>&nbsp;<i class="fa fa-list-ul"></i>
					</button>
					<!-- button -->
					<div class="page-header"></div>
				</div>
			<!-- 회원 상세보기 : end -->
			
			</div>
		</div>
	</div>
</body>