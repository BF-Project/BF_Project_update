<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
#regist {
	margin-left: 41%;
}

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
</style>

<script>
$(function(){
	$("#deleteForm").on("submit",function(){
		$.ajax({
			url:$(this).attr("action"),
			data:$(this).serialize(),
			method:'post',
			dataType:'json',
			success:function(response){
				alert(JSON.stringify(response));
				if(response.success){ // 삭제 성공
					// 갱신된 properties 를 비동기 요청으로 받아옴
					$.ajax({
						url:"ConsManager",
						dataType:'json',
						success:function(response){
							var html = "";
							var index = 0;
							$.each(response, function(idx, entry){
								html+="<tr>";
								html+='<td>                                                                        ';
								html+='<div class="checks">                                                        ';
								html+='<input type="checkbox" id="'+(index)+'" name="check" value="'+idx+'">	   ';
								html+='<label for="'+(index++)+'"></label>                                         ';
								html+='</div>                                                                      ';
								html+='</td>                                                                       ';
								html+="<td>"+idx+"</td>";
								html+="<td>"+entry+"</td>";
								html+="</tr>";
							});
							$("#consListArea").html(html);
						}
					});
				}
				/* $('.initData').remove(); */
				
				/*var d = "";
				$.each(response,function(i){
					d = "<tr  class='initData'><td><div class='checks'>"
						+"<input type='checkbox' id='"+i+"' name='check' value='"+response.key+"'>"
						+"<label for='"+i+"'></label></div></td><td>2</td><td>3</td></tr>"
				});
				$('table').append(d);
				$('table').append("<tr  class='initData'><td><div class='checks'>"
						+"<input type='checkbox' id='${count.index}' name='check' value='${ent.key}'>"
				<label for="${count.index}"></label>
				</div></td><td>2</td><td>3</td></tr>") */
				
				
			},
		});
		return false;
	});	
});

</script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" style="text-align: center; height: 986px;">
			<div class="row">
				<br> <br>
				<h1>
					<b>전문가목록</b><br>
				</h1>
				<br> <br>
				<form action="${pageContext.request.contextPath}/admin/delete" id="deleteForm" >
					<spring:eval expression="@cons" var="cons"></spring:eval>
					<center>
						<table class="table table-hover"
							style="width: 800px; text-align: center;">
							<thead>
							<tr style="font-size: 20px">
								<td><b>삭제여부</b></td>
								<td><b>이름</b></td>
								<td><b>메일주소</b></td>
							</tr>
							</thead>
							<tbody id="consListArea">
							<c:forEach items="${cons}" var="ent" varStatus="count">
								<tr class="initData">
									<td>
										<div class="checks">
											<input type="checkbox" id="${count.index}" name="check" value="${ent.key}">
											<label for="${count.index}"></label>
										</div>
									</td>
									<td>${ent.value}</td>
									<td>${ent.key}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</center>
					<div>
						<button type="button" class="btn btn-warning" id="regist"
							onclick="location.href='regist'">등록</button>
						<button type="submit" class="btn btn-info" id="delete">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>