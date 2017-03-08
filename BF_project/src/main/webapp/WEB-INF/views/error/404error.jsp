<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 3. 8.      pc21      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title></title>
<style type="text/css">

div{
	width:100%;
	text-align:center;
}
body {
	background-image: url('<%=request.getContextPath()%>/resources/images/error/error_modify.png');
	background-repeat:no-repeat;
	background-position:center;
	background-attachment:fixed;
}

</style>
</head>
<body>
<div style="margin-top: 28%;">
	<input type="button" class="btn" value="메인으로가기" onclick="location.href='<%=request.getContextPath() %>/'" />
</div>
</body>
</html>