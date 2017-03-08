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

<style>
.checks {position: relative;} 

.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); border: 0 } 

.checks input[type="checkbox"] + label {
	display: inline-block; 
	position: relative; 
	cursor: pointer; 
	-webkit-user-select: none; 
	-moz-user-select: none; 
	-ms-user-select: none; } 

.checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
	content: ' '; 
	display: inline-block; 
	width: 21px; /* 체크박스의 너비를 지정 */ 
	height: 21px; /* 체크박스의 높이를 지정 */ 
	line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ 
	margin: -2px 8px 0 0; 
	text-align: center; 
	vertical-align: middle; 
	background: white; 
	border: 1px solid #000000; 
	border-radius : 3px; 
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } 

.checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { 
	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } 

.checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
	content: '\2714'; /* 체크표시 유니코드 사용 */ 
	color: #FF0000; 
	text-shadow: 1px 1px #FF0000; 
	background: white; 
 	border-color: #000000; /* 검정 */
	box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }
	
		.file_input label {
		    display: inline-block; 
 			padding: .5em .75em; 
 			color: #1E82FF; 
 			font-size: inherit; 
 			line-height: normal; 
 			vertical-align: middle; 
 			background-color: #fdfdfd; 
 			cursor: pointer; 
 			border: 1px solid #1E82FF; 
 			border-bottom-color: #1E82FF; 
 			border-radius: .25em; 
		}
		.file_input label input {
		    position:absolute;
		    width:0;
		    height:0;
		    overflow:hidden;
		}
		.file_input input[type=text] {
		    vertical-align:middle;
		    display:inline-block;
		    width:200px;
		    height:26px;
		    line-height:28px;
		    font-size:15px;
/* 		    color:#fdfdfd; */
/* 		    padding:0; */
 		    border:0px; 
/* 		    border:1px solid #777; */
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
			<form action="sendMail" id="mail" method="post" enctype="multipart/form-data">
				보내는사람 : <br><input type="text" class="form-control" name="sender" style="width: 25%; display: inline-block;" />
				<select name="mailServer">
					<option value="Naver">네이버</option>
					<option value="Gmail">지메일</option>					
				</select>
				<!-- <div class="checks" style="margin-bottom: 18px; display:inline;">
					<input type="checkbox" id="agree-all" name="allcheck" /> 
					<label for="agree-all">기본계정사용여부</label>
				</div> -->
				<br><br>
				패스워드 : <input type="password" class="form-control" name="password" style="width: 25%;" /><br>
				받는사람 : <input type="text" class="form-control" name="to" value="${param.cons}" style="width: 25%;" readonly /><br> 
				제목 : <input type="text" class="form-control" name="title" style="width: 25%;" /><br> 
				내용 : <textarea cols="40" rows="15" class="form-control" name="context" style="width: 40%; height: 315px;"></textarea>
				<!-- <input type="button" value="메일보내기" class="glyphicon glyphicon-envelope" onclick="javascript:this.form.submit();" /> -->
				<div class="file_input">
					<label>
						<i class="fa fa-photo"></i>&nbsp;사진첨부 
						<input type="file" name="picture" onchange="javascript:document.getElementById('file_route').value=this.value">
					</label> 
					<input type="text" readonly="readonly" title="File Route" id="file_route">
				</div>
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