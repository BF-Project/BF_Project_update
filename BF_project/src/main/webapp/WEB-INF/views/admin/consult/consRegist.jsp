<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<div id="wrapper">                       
		<div id="page-wrapper" style="text-align: center; height: 986px;">
			<div class="row">
				<br><br>        
				<h1><b>전문가등록</b><br></h1><br><br>
				<center>
				<form method="post" action='ConsManager'>
					<table>
						<tr>
							<td>이름</td>
						</tr>
						<tr style="height:10px;"></tr>
						<tr>
							<td><input type="text" class="form-control" id="irum" name="irum" style="width:200px;"/></td>
						</tr>
						<tr style="height:20px;"></tr>
						<tr>
							<td>이메일</td>
						</tr>
						<tr style="height:10px;"></tr>
						<tr>
							<td><input type="text" class="form-control" id="email" name="email" style="width:400px;" /></td>
						</tr>
						<tr style="height:20px;"></tr>
						<tr>
							<td>
								<button type="submit" class="btn btn-warning" id="regist">등록</button>	
							</td>
						</tr>
					</table>
				</form>
				</center>
			</div>
		</div>
	</div>
</body>
</html>