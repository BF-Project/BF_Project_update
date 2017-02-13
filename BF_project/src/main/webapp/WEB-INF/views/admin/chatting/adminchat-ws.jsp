<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.11.0.min.js"></script>
	<script>
		var wsocket;
		
		// 1:1 상담창이 로드되자마자 실행됨 | 접속
		(function() {
			$(function(){
				connect();
			})
		}());
		
		// 접속
		function connect(){
			wsocket = new WebSocket(
					"ws:/192.168.202.147:8181${pageContext.request.contextPath}/adminchat-ws");  // 모든 사용자가 사용할때
// 					"ws:/localhost:8181${pageContext.request.contextPath}/chat-ws"); // 나만 사용할때
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
		}
		
		// 접속 시 바로 출력되는 메시지
		function onOpen(evt){
			var loginMember = $("input[name=loginName]").val();
			appendMessage(loginMember+"님 반갑습니다.");
		}
		
		function appendMessage(msg){
			$('#chatMessageArea').append(msg+"<br>");
			var chatAreaHeight = $('#chatArea').height();
			var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
			$('#chatArea').scrollTop(maxScroll);
		}
		
		function onMessage(evt){ // 초기에는 "msg:" 라는 단어가 포함되어 있지 않아서 메시지 출력이 안된다.
			var data = evt.data;
			if(data.substring(0, 4) == "msg:"){
				appendMessage(data.substring(4));
			}
		}
		
		function onClose(evt){ // 이벤트가 없으면 실행이 안되는 부분 ? 
			var loginMember = $("input[name=loginName]").val();
			appendMessage(loginMember+"님이 연결을 끊었습니다.");
		}
		
		///////
		
		// 버튼 이벤트
		$(function(){
			$('#message').keypress(function(event){
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if(keycode == '13'){ // 엔터키 key code == 13
					send();
				}
				event.stopPropagation();
			});
			$('#sendBtn').click(function(){send();}); // 메시지 보내기
			$('#exitBtn').click(function(){disconnect();}); // 닫기 
		});
		
		// 닫기
		function disconnect(){
			wsocket.close();
		}
		
		// 메시지 보내기
		function send(){
			var nickname = $('#nickname').val();
			var msg = $('#message').val();
			wsocket.send("msg:" + nickname + " : " + msg);
			$('#message').val("");
		}
	</script>
	<style>
		#chatArea {width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;}
	</style>
</head>
<body>
	<input type="hidden" id="nickname" name="loginName" value="${sessionScope.loginAdmin}">
	
	<input type="button" id="exitBtn" value="닫기">
    
    <h1>대화 영역(Admin)</h1>
    <!-- 채팅 글 보이는 영역 -->
    <div id="chatArea">
    	<div id="chatMessageArea"></div>
    </div>
    <br>
    <!-- 채팅 글 입력 영역 -->
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>