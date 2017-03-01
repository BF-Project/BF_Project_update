<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
	#freeList {
		margin : auto;
	}
</style>

</head>
<body>
<div id="wrapper">
<form name="free" method="post">
	<table class="table" id="freeList">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>게시날짜</th> 
			<th>조회수</th>
		</tr>
		<%-- <c:forEach items="${freeList }" var="freeVO">
		<tr>
			<td>${freeVO.fre_num }</td>
			<td>${freeVO.fre_title }</td>
			<td>${freeVO.mbr_id }</td>
			<td>${freeVO.fre_date }</td>
			<td>${freeVO.fre_cnt }</td>
		</tr>
		</c:forEach> --%>
	</table>
</form>
</div>
</body>
</html>