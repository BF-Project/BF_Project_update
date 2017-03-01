<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
#send {
	margin-left: 65.9%;
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
			
			<button type="button" id="send" class="btn" onclick="location.href='sendMail'"
					style="padding:8px; background-color:gray;
					border:1px solid gray; border-radius:6px; color:white;">
					<i class="glyphicon glyphicon-envelope"></i>&nbsp;
					<b style="font-size:14px"></b>e-mail보내기
			</button>
		</div>
	</div>
	<br>
</body>
</html>