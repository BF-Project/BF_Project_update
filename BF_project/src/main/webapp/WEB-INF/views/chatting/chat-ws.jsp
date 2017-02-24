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
	<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/admin/css/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script>
		var i=0
		window.document.onkeydown = protectKey;
		function protectKey(){
			//새로고침을 막는 스크립트.. F5 번키..
			if(event.keyCode == 116){
				event.keyCode = 0;
			    return false;
			}
			//CTRL + N 즉 새로 고침을 막는 스크립트....
			else if ((event.keyCode == 78) && (event.ctrlKey == true)){
		        event.keyCode = 0;
		        return false;
			}
		}
	</script>
	
	<script>
		var wsocket;
		var count = 0;
		
		// 1:1 상담창이 로드되자마자 실행됨 | 접속
		(function() {
			$(function(){
				$('#messageSend').hide();				
				connect();
			})
		}());
				
		// 접속
		function connect(){
			wsocket = new WebSocket(
					"ws:/"+document.domain+":8181${pageContext.request.contextPath}/chat-ws");  // 모든 사용자가 사용할때
// 					"ws:/localhost:8181${pageContext.request.contextPath}/chat-ws"); // 나만 사용할때
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
			
		}
		
		// 접속 시 바로 출력되는 메시지
		function onOpen(evt){
			var loginMember = $("input[name=loginName]").val();
			appendMessage("<b>"+loginMember+"님 반갑습니다.</b><br><b style='color:blue'><u>관리자 호출을 누르시고 관리자의 응답을 기다려주세요.</u></b>");
		}
		
		function appendMessage(msg){
			$('#chatMessageArea').append(msg+"<br>");
			var chatAreaHeight = $('#chatArea').height();
			var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
			$('#chatArea').scrollTop(maxScroll);
		}
		
		function onMessage(evt){ // 처음에는 dvt가 없음
			count = (count+1);
			
			if(count>=2){
				$('#message').attr("readonly", false); // readonly 해제
				$('#messageSend').attr('disabled',false); // 버튼 활성화 
			}
			
			var data = evt.data;
			var msgObj = JSON.parse(data);
			
			if(msgObj.message){
				appendMessage(msgObj.nickname+" : "+msgObj.message);
			}
		}
		
		function onClose(evt){ // 이벤트가 없으면 실행이 안되는 부분 ? 
			var loginMember = $("input[name=loginName]").val();
			appendMessage("<b>"+loginMember+"님이 연결을 끊었습니다.</b>");
			window.close();
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
			$('#adminCall').click(function(){send();}); // 메시지 보내기
			$('#messageSend').click(function(){send();}); // 메시지 보내기
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
			var msgObj = {};
			msgObj.message = msg;
			msgObj.nickname = nickname;
			var roomId = "${room.roomId}";
			msgObj.roomId = roomId;
			var msgJSON = JSON.stringify(msgObj);
			
			wsocket.send(msgJSON);
			$('#message').val("");
			
			// 관리자에게 pushMessage 알림을 해주기 위함
			var wsocket2 = new WebSocket(
			"ws:/192.168.202.147:8181${pageContext.request.contextPath}/pushMessage");
			wsocket2.onopen = function(){
				wsocket2.send("${room.roomId},${owner}"); // 현재 방번호와 방주인을 보내준다. admin_decorator의 function onMessage(evt)==> evt.data로 정보가 넘어감
			}
		}
		
		// 버튼 전환
		$(function(){
			$('#adminCall').on('click', function(){
				$('#adminCall').hide();
				$('#messageSend').show();
			})
		})
		
	</script>
	<style>
		#chatArea {width: 450px; height: 400px; overflow-y: auto; border: 1px solid black; margin:auto; font-size: 15px; padding:5px;}
	</style>
</head>
<body>
	<input type="hidden" id="nickname" name="loginName" value="${sessionScope.loginUserName}">
	
	<section class="breadcrumbs_block clearfix parallax" style="height:20px">
		<div class="container center" style="width:465px; padding:0 ">
			<img src="<%=request.getContextPath()%>/resources/images/logo/logo.jpg"	style="z-index: 0; width: 100px; height: 30px; position: absolute; left:7px; top:7px;">
			<div style="margin-top: -57px">
				<h2>
					<b>Advice</b>
				</h2>
				<p style="margin-top: -15px">'성공하는 사람들' 실시간 상담 페이지 입니다.</p>
			</div>
		</div>
	</section>
	
	<br>
    
    <!-- 채팅 글 보이는 영역 -->
    <div id="chatArea">
    	<div id="chatMessageArea"></div>
    </div>
    <!-- 채팅 글 보이는 영역 : end-->
    <br>
    <!-- 채팅 글 입력 영역 -->
	<input type="text" class="form-control" id="message" style="width:290px; height:30px; margin-left: 15px" readonly>
    <!-- 채팅 글 입력 영역 : end-->
    
    <button type="button" class="btn btn-info" style="padding:4px; margin-top: -47px; margin-left: 310px;" id="adminCall" >
		<b style="font-size:13px"><i class="fa fa-bell-o"></i>&nbsp;관리자 호출</b>
	</button>
	<button type="button" class="btn btn-success" style="padding:4px; margin-top: -47px; margin-left: 310px;" id="messageSend" disabled="disabled">
		<b style="font-size:13px"><i class="fa fa-send-o"></i>&nbsp;전송</b>
	</button>
	<button type="button" class="btn btn-danger" style="padding:4px; margin-top: -88px; margin-left: 415px;" id="exitBtn">
		<b style="font-size:13px"><i class="fa fa-close"></i>&nbsp;닫기</b>
	</button>
	
</body>
</html>