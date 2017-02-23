package com.pro.bf.websocket;

import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PushMessageHandler extends TextWebSocketHandler{
	
	private String adminId;
	private WebSocketSession adminSession;
	
	public void gotowork(String adminId){
		this.adminId = adminId;
	}
	
	public void goout(){
		this.adminId = null;
	}

	public WebSocketSession getAdminSession() {
		return adminSession;
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		if(adminId!=null && adminSession != null){
//			System.out.println("message = "+message);
			adminSession.sendMessage(message);
		}
		super.handleTextMessage(session, message);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		Map<String, Object> map = session.getAttributes();
		String loginUser =  (String)map.get("ChatLogin");
		if(loginUser.equals(adminId)){
			adminSession = session;
		}
		super.afterConnectionEstablished(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String loginUser =  (String)map.get("ChatLogin");
		if(loginUser.equals(adminId)){
			adminSession = null;
		}
		super.afterConnectionClosed(session, status);
	}
}