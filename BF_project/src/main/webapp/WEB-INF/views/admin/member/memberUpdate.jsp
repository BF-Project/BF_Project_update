<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
		function memberUpdateComplete(){
			var mbr_id = document.getElementById('updateId').value;
			var mbr_pwd = document.getElementById('updatePWD').value;
			var mbr_nm = document.getElementById('updateNM').value;
			var mbr_phone = document.getElementById('updatePhone').value;
			var mbr_eml = document.getElementById('updateEmail').value;
			var mbr_addr = document.getElementById('updateAddr').value;
// 			var birth = document.getElementById('updateBirth').value;
// 			var gender = document.getElementById('updateGender').value;
// 			var joinDate = document.getElementById('updatejoinDate').value;
// 			var useyn = document.getElementById('updateUseyn').value;
// 			var emailRecieve = document.getElementById('updateEmailRecive').value;			
			// 관리자가 수정할 수 있는 회원의 정보는  pw | name | phone | email | address  5개만
			
			// 유효성 검사
			var pwdPattern = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/ // 무조껀 영어와 숫자를 혼용하여 최소 8자 ~ 20자
			var namePattern = /^[가-힣]{1,10}|[a-zA-Z]{1,20}$/ // 영어와 한글 혼용 금지
			var numberPattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/ // - 없이 번호 입력
			var emailPattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+){1,2}$/ 
			
			if(pwdPattern.test(mbr_pwd)==true){
				if(namePattern.test(mbr_nm)==true){
					if(numberPattern.test(mbr_phone)==true){
						if(emailPattern.test(mbr_eml)==true){
							if(!(mbr_addr==null) && !(mbr_addr=="")){
								location.href='<%=request.getContextPath()%>/admin/memberUpdateGoGo?mbr_id='+mbr_id+'&mbr_pwd='+mbr_pwd+'&mbr_nm='+mbr_nm+'&mbr_phone='+mbr_phone+'&mbr_eml='+mbr_eml+'&mbr_addr='+mbr_addr+'&page=${page}'
							}else{
								alert('주소를 입력해주세요.');
								document.getElementById('updateAddr').value="";
								document.getElementById('updateAddr').focus();
							}
						}else{
							alert('이메일 입력이 잘못되었습니다. 다시확인해주세요.');
							document.getElementById('updateEmail').value="";
							document.getElementById('updateEmail').focus();
						}
					}else{
						alert('전화번호는 - 없이 숫자로만 입력해주세요.');
						document.getElementById('updatePhone').value="";
						document.getElementById('updatePhone').focus();
					}
				}else{
					alert('이름에 공백과 영어와 한글을 혼용할 수 없습니다. 다시 확인해주세요.');
					document.getElementById('updateNM').value="";
					document.getElementById('updateNM').focus();
				}
			}else{
				alert('비밀번호는 영어와 숫자를 혼용하여 8 ~ 20자로 입력해주세요.');
				document.getElementById('updatePWD').value="";
				document.getElementById('updatePWD').focus();
			}
		}
	</script>	
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" style="text-align: center; height: 906.5px;">
			<div class="row">
			
			<!-- memberUpdateForm -->
			<br><br><h1><b>회원수정</b></h1>
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
									<td><input type="text" class="form-control" name="InputId" id="updateId" value="${memberVo.mbr_id}" readonly></td>
									<td></td>
									<td><input type="password" class="form-control" name="InputPassword1" id="updatePWD" value="${memberVo.mbr_pwd}" placeholder="비밀번호를 입력해주세요"></td>
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
									<td><input type="text" class="form-control" name="username" id="updateNM" value="${memberVo.mbr_nm}" placeholder="이름을 입력해 주세요"></td>
									<td></td>
									<td><input type="text" class="form-control" name="usernumber" id="updatePhone" value="${memberVo.mbr_phone}" placeholder=" - 없이 입력해 주세요"></td>
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
									<td><input type="email" class="form-control" name="InputEmail" id="updateEmail" value="${memberVo.mbr_eml}" placeholder="이메일 주소를 입력해 주세요"></td>
									<td></td>
									<td><input type="text" class="form-control" name="InputAddr" id="updateAddr" value="${memberVo.mbr_addr}" placeholder="주소를 입력해주세요"></td>
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
									<td><input type="text" class="form-control" name="InputBirth" id="updateBirth" value="<fmt:formatDate value="${memberVo.mbr_brt}" pattern="yyyy-MM-dd"/>" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="InputGender" id="updateGender" value="${memberVo.mbr_gnd}" readonly></td>
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
									<td><input type="text" class="form-control" name="joinDate" id="updatejoinDate" value="<fmt:formatDate value="${memberVo.mbr_date}" pattern="yyyy-MM-dd"/>" readonly></td>
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
									<td><input type="text" class="form-control" name="Useyn" id="updateUseyn" value="${memberVo.mbr_use_yn}" readonly></td>
									<td></td>
									<td><input type="text" class="form-control" name="EmailRecive" id="updateEmailRecive" value="${memberVo.mbr_eml_yn}" readonly></td>
								</tr>
							</table>
						</div>
					</article>
					<!-- tableForm : end -->
					
					<!-- button -->
						<button type="button" class="btn btn-info" onclick="memberUpdateComplete()" 
							style="padding:8px; margin-left:10px; margin-top:40px; position:relative; z-index:0">
								<b style="font-size:14px">수정완료</b>&nbsp;<i class="fa fa-edit spaceLeft"></i>
						</button>				
						<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/memberUpdateView?page=${page}&memberid=${memberVo.mbr_id}'" 
							style="padding:8px; margin-left:10px; margin-top:40px; position:relative; z-index:0">
								<b style="font-size:14px">정보 복구하기</b>&nbsp;<i class="fa fa-edit spaceLeft"></i>
						</button>						
						<button type="button" class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/admin/memberDetail?page=${page}&member_select_Id=${memberVo.mbr_id}'" 
							style="padding:8px; margin-left:10px; margin-top:40px; position:relative; z-index:0">
								<b style="font-size:14px">취소</b>&nbsp;<i class="fa fa-times spaceLeft"></i>
						</button>
					<!-- button -->
					
					<div class="page-header"></div>
				</div>
			<!-- memberUpdateForm : end -->
			
			</div>
		</div>
	</div>
</body>