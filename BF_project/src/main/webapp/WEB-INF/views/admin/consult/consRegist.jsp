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
				<form style="margin-left:-220px">
					이름 : <br><input type="text" class="form-control" id="irum" style="width:200px; margin-left:930px;"/><br>
					이메일 : <br><input type="text" class="form-control" id="email" style="width:400px; margin-left:930px;" /><br>
					<button type="button" class="btn btn-warning" id="regist" onclick="location.href='ConsManager'">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>