<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
	#regist {
		margin-left : 41%;
	}
</style>

</head>
<body>
	<div id="wrapper">                       
		<div id="page-wrapper" style="text-align: center; height: 986px;">
			<div class="row">
				<br><br>        
				<h1><b>전문가목록</b><br></h1><br><br>
				<form action="ConsManager">
					<spring:eval expression="@cons" var="cons"></spring:eval>
					<center>
					<table class="table table-hover" style="width:800px; text-align: center;">
						<tr style="font-size: 20px">
							<td><b>이름</b></td>
							<td><b>메일주소</b></td>
						</tr>
						<c:forEach items="${cons}" var="ent">
							<tr>
								<td>${ent.value}</td>
								<td>${ent.key}</td>
							</tr>
						</c:forEach>
					</table>
					</center>
				</form>
				<div>
					<button type="button" class="btn btn-warning" id="regist" onclick="location.href='regist'">등록</button>
					<button type="button" class="btn btn-info">삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>