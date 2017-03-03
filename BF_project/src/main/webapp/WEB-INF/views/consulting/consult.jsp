<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
	#consultant {
		margin-left : 62%;
	}
</style>

</head>
<body>
	<!-- PRELOADER -->
	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

	<!-- //PRELOADER -->
	<div class="preloader_hide">
		<div class="qnaHeader">

			<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>
						<b>전문가</b> 컨설팅
					</h2>
				</div>
			</section>
			<br>
			<center>
				<img src="<%=request.getContextPath()%>/resources/images/consulting.jpg" style="height: 565px;" />
			</center>
			<br>
			<form action="sendMail" id="consultant">
				<spring:eval expression="@cons" var="cons"></spring:eval>
				
				<select name="cons">
					<c:forEach items="${cons}" var="entry">
						<option value="${entry.key}">${entry.value}</option>
					</c:forEach>
				</select>
				<button type="submit" id="send" class="btn"
						style="padding:8px; background-color:gray;
						border:1px solid gray; border-radius:6px; color:white;">
						<i class="glyphicon glyphicon-envelope"></i>&nbsp;
						<b style="font-size:14px"></b>e-mail보내기
				</button>
			</form>
		</div>
	</div>
	<br>
</body>
</html>