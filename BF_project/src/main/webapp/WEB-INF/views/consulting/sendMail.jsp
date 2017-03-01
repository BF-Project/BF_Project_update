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
#mail {
	margin-left: 38%;
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
			<form action="sendMail" id="mail" method="post">
				보내는사람 : <input type="text" class="form-control" name="sender" style="width: 25%;" /><br> 
				받는사람 : <input type="text" class="form-control" name="to" style="width: 25%;" /><br> 
				제목 : <input type="text" class="form-control" name="title" style="width: 25%;" /><br> 
				내용 : <textarea cols="40" rows="15" class="form-control" name="context" style="width: 40%; height: 315px;"></textarea>
				<!-- <input type="button" value="메일보내기" class="glyphicon glyphicon-envelope" onclick="javascript:this.form.submit();" /> -->
				<button type="button" id="send" class="btn" onclick="javascript:this.form.submit();"
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