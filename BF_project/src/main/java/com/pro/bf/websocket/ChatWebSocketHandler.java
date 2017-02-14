package com.pro.bf.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.xml.ws.spi.http.HttpContext;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * @author 차승현<br>
 * 회원은 HandsShakeInterceptor를 거쳐 현재 클래스에 접속되기 때문에 무조껀 id값이 있다.<br>
 * 관리자는 바로 현재 클래스에 접속되기 때문에 id 값이 무조껀 null
 */
public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	// users
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	String id[] = new String[100000];

	// 접속시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		id[Integer.parseInt(session.getId())] = (String)map.get("ChatLogin");
		if(id[Integer.parseInt(session.getId())] == null){			
			id[Integer.parseInt(session.getId())] = "admin";
		}
		log("ID : "+id[Integer.parseInt(session.getId())]+" | IP : "+session.getRemoteAddress().getHostName()+" 연결 됨");		
		users.put(id[Integer.parseInt(session.getId())], session); // id와 session을 Map에 담는다
	}
	
	// 접속 해제시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log("ID : "+id[Integer.parseInt(session.getId())]+" | IP : "+session.getRemoteAddress().getHostName()+" 연결 종료됨");
		users.remove(id[Integer.parseInt(session.getId())]); // 담아놨던 id와 Map에서 삭제
	}
	
	// 메시지 발신 | 수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String currentMyId = id[Integer.parseInt(session.getId())]; // 현재 내 id

		// 관리자
		String admin = null;
		String adminNum = null;

		// 현재 채팅하는 회원
		String member = null;
		String memberNum = null;
		
		System.out.println("채팅 접속자 수 : " + users.values().size() + "명");
		
		for(WebSocketSession s : users.values()){
			if(id[Integer.parseInt(s.getId())] == "admin"){ // for문 s.getId() 에서 관리자 번호가 걸리면
				admin = id[Integer.parseInt(s.getId())]; // 관리자 ID
				adminNum = s.getId(); // 관리자 고유 번호
				System.out.println("관리자 id : "+admin +" || "+"관리자 고유 번호 : "+adminNum);
			}
		}
			
		for(WebSocketSession s : users.values()){
			if(id[Integer.parseInt(s.getId())] == currentMyId){ // 현재 내 아이디와 | 전체 s.getId()중 1개가 같을 경우
				if(!(currentMyId == "admin")){ // 현재 접속한 아이디와 내가 admin이라면 위에 admin과 adminNum을 사용하면 됨
					member = id[Integer.parseInt(s.getId())];
					memberNum = s.getId();
					System.out.println("현재 접속한 회원 id : " + member + " || "+"접속한 회원 고유 번호 : " + memberNum);
				}
			}
		}
		
		if(!(currentMyId=="admin")){ // 현재 컴퓨터의 접속자가 회원일때
			if(adminNum==null){
				// admin이 없고 회원만 접속해있을때...
				users.get(member).sendMessage(message); // 회원이 자신이 보낸 글을 자신이 볼 수 있어야 한다.
				// 그럼 여기서 admin에게 알림을 줘야하지! ☆★☆★☆★☆★☆★☆★☆
				// 접속한 회원 본인의 고유번호와 message를 넘겨줘야한다.
				
			}else{
				// admin이 접속해 있을때
				users.get(member).sendMessage(message);  
				users.get(admin).sendMessage(message); // 관리자와 자신 모두 보임				
			}	
			
		}else if(currentMyId=="admin"){ // 현재 컴퓨터의 접속자가 admin일때
			for(WebSocketSession s : users.values()){
				s.sendMessage(message);	
			}
		}
//			log(currentMyId+"이/가 || "+admin + "에게 발송 " + message.getPayload());
	}

	// 익셉션
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log("익셉션 발생 : " + exception.getMessage());
	}
	
	// 로그
	private void log(String logmsg){
		System.out.println(new Date() + " : " + logmsg);
	}
}