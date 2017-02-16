package com.pro.bf.websocket;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.apache.poi.util.StringUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pro.bf.chatting.ChattingRoom;

/**
 * @author 차승현<br>
 * 회원은 HandsShakeInterceptor를 거쳐 현재 클래스에 접속되기 때문에 무조껀 id값이 있다.<br>
 * 관리자는 바로 현재 클래스에 접속되기 때문에 id 값이 무조껀 null
 */
public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	@Resource(name="rooms")
	private Map<String, ChattingRoom> rooms;

	// 접속시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// ChatLogin와 roomId를 받아올 수 있다. [ HandsShakeInterceptor를 통해 session 으로 ]
		
		Map<String, Object> map = session.getAttributes();		
		String loginUser = (String)map.get("ChatLogin"); // 채팅방에 접속한 사람, 회원이든 관리자든 값이 들어온다.		
		for(Entry<String, ChattingRoom> entry :rooms.entrySet()){ 
			if(entry.getValue().getOwner().equals(loginUser)){
				entry.getValue().enterRoom(loginUser, session);	// rooms의 모든 정보를 찾아 방을 개설한 owner과 현재 로그인한 loginUser와 같은 방을 user로 등록한다. ==> 내가 개설한 방
			}
		}
		
		String roomId = (String)map.get("roomId"); // 채팅방의 roomId
		if(!StringUtils.isEmpty(roomId)){
			ChattingRoom room = rooms.get(roomId);
			if(room!=null)
				room.enterRoom(loginUser, session); // 해당 채팅방의 roomId가 없을경우 관리자라는 것
		}
		log("log >>> ID : "+loginUser+" | roomId : "+roomId+" [연결 됨]");	
	}
	
	// 접속 해제시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {	
		Map<String, Object> map = session.getAttributes();
		String loginUser = (String)map.get("ChatLogin");
		if(!loginUser.equals("admin")){
			String roomId = null;
			for(Entry<String, ChattingRoom> entry :rooms.entrySet()){ 
				if(entry.getValue().getOwner().equals(loginUser)){
					roomId = entry.getKey(); 
				}
			}
			ChattingRoom chattingRoom = new ChattingRoom(loginUser);
			chattingRoom.removeRoom(loginUser); // 유저 삭제
			rooms.remove(roomId); // 방 삭제
		}
	}
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class ChatMessage{
		private String message;
		private String nickname;
		private String roomId;
	}
	
	// 메시지 발신 | 수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map = session.getAttributes();		
		
		String msgJSON = message.getPayload();
		ObjectMapper mapper = new ObjectMapper();
		ChatMessage chatMsg = mapper.readValue(msgJSON, ChatMessage.class);
		chatMsg.getMessage();
		chatMsg.getNickname();
		String roomId = chatMsg.getRoomId();
		ChattingRoom room = rooms.get(roomId);
		String currentMyId = (String)map.get("ChatLogin"); // 채팅방에 접속한 사람, 회원이든 관리자든 값이 들어온다.	
		
		if(room != null){
			 Map<String, WebSocketSession> chatUsers = room.getUsers(); // 메시지 보내기
			 for(Entry<String, WebSocketSession> entry:chatUsers.entrySet()){
//				 if(!entry.getKey().equals(currentMyId)){
					 entry.getValue().sendMessage(message);
//				 }
			 }
		}
		log(currentMyId+"이/가 발송 " + chatMsg.getMessage());
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