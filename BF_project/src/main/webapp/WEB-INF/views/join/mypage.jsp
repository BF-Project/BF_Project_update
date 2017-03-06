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

<style>
#mbrbtn {
	margin-left: 45%;
}

#mypage {
	width : 300px;
}

#mypageForm {
	margin-left : 25%;
}
</style>

</head>

<body>

	<br>
	<br>

	<center>
		<h1>
			<b>회원정보</b>
		</h1>
	</center>
	<div class="table-responsive">
		<div class="page-header"></div>

		<!-- tableForm -->
		<article class="container" id="mypageForm">
			<div class="col-md-6 col-md-offset-3">
				<table id="label" style="width: 880px; margin-left: -150px"
					border="0">
					<tr>
						<td style="width:40%;"><label for="InputId">&nbsp;&nbsp;아이디</label></td>

						<td style="width: 10px"></td>

						<td><label for="InputPassword1">&nbsp;&nbsp;비밀번호</label></td>

					</tr>

					<tr>
						<td><input type="text" class="form-control" name="InputId"
							value="${MbrVO.mbr_id}" id="mypage" readonly></td>
						<td></td>
						<td><input type="password" class="form-control"
							name="InputPassword1" value="${MbrVO.mbr_pwd}" id="mypage" readonly></td>
					</tr>

					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>

					<tr>
						<td><label for="username">&nbsp;&nbsp;이름</label></td>
						<td></td>
						<td><label for="usernumber">&nbsp;&nbsp;휴대폰 번호</label></td>
					</tr>

					<tr>
						<td><input type="text" class="form-control" name="username"
							value="${MbrVO.mbr_nm}" id="mypage" readonly></td>
						<td></td>
						<td><input type="text" class="form-control" name="usernumber"
							value="${MbrVO.mbr_phone}" id="mypage" readonly></td>
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
						<td><input type="text" class="form-control" name="InputEmail"
							value="${MbrVO.mbr_eml}" id="mypage" readonly></td>
						<td></td>
						<td><input type="text" class="form-control" name="InputAddr"
							value="${MbrVO.mbr_addr}" id="mypage" readonly></td>
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
						<td><input type="text" class="form-control" name="InputBirth"  id="mypage"
							value="<fmt:formatDate value="${MbrVO.mbr_brt}" pattern="yyyy-MM-dd"/>"
							readonly></td>
						<td></td>
						<td><input type="text" class="form-control"
							name="InputGender" value="${MbrVO.mbr_gnd}" id="mypage" readonly></td>
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
						<td><input type="text" class="form-control" name="Useyn"
							value="${MbrVO.mbr_use_yn}" id="mypage" readonly></td>
						<td></td>
						<td><input type="text" class="form-control"
							name="EmailRecive" value="${MbrVO.mbr_eml_yn}" id="mypage" readonly></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td><label for="joinDate">&nbsp;&nbsp;가입날짜</label></td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td><input type="text" class="form-control" name="joinDate"  id="mypage" 
							value="<fmt:formatDate value="${MbrVO.mbr_date}" pattern="yyyy-MM-dd"/>"
							readonly></td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>

				</table>
			</div>
		</article>
		<!-- tableForm : end -->
	</div>
	<br>
	<div id="mbrbtn">
		<!--회원정보수정버튼클릭 -->
		<button type="button" class="btn"
			onclick="location.href='<%=request.getContextPath()%>/join/memberUpdateView?&memberid=${MbrVO.mbr_id}'"
			style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
			<b style="font-size: 14px">정보 수정하기</b>&nbsp; 
			<i class="fa fa-edit spaceLeft"></i>
		</button>

		<%-- <!--회원탈퇴-->
		<button type="button" class="btn btn-default"
			onclick="location.href='<%=request.getContextPath()%>/join/memberRemove?=memberid=${memberVo.mbr_id}'"
			style="padding: 8px; margin-left: 10px; margin-top: 40px; position: relative; background-color: lightblue;">
			<b style="font-size: 14px">회원탈퇴</b>&nbsp; <i
				class="fa fa-edit spaceLeft"></i>
		</button> --%>

		<!-- 회원탈퇴 -->
		<button type="button" id="del" class="btn"
			onclick="location.href='<%=request.getContextPath()%>/join/memberRemove?=memberid=${memberVo.mbr_id}'"
			style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
			<b style="font-size: 14px">회원탈퇴</b>&nbsp;
			<i class="fa fa-cut"></i>
		</button>
	</div>

</body>
</html>