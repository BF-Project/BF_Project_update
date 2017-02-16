package com.pro.bf.chatting;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

/**
 *<pre>
 *  회원이 실시간 상담을 할 경우 고유번호를 지닌 채팅방이 생성된다.
 * </pre>
 * @author 차승현
 * @since 2017. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자                    수정내용
 * --------      --------    ----------------------
 * 2017. 2. 14.    차승현   	             최초작성
 * Copyright (c) 2017 by DDIT All right reserved
 * </pre>
 */

public class ChattingRoom {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>(); // 유저의 정보를 담는 map
	
	private String owner; // 방을 만든 회원, user 
	private String roomId; // 방의 고유 번호
	
	public String getRoomId() {
		return roomId;
	}
	
	public String getOwner() {
		return owner;
	}
	
	public Map<String, WebSocketSession> getUsers() {
		return users;
	}
	
	
	
	public ChattingRoom(String owner) {
		super();
		this.owner = owner;
		roomId = UUID.randomUUID().toString(); // 방의 고유번호를 입력해준다.
	}
	
	
	
	public void enterRoom(String loginUser, WebSocketSession session){ // 유저의 정보를 담는 map에  loginUser과 session을 담는다.
		users.put(loginUser, session);
	}
	
	public void removeRoom(String loginUser){ // 유저가 방을 나갔을 때 
		users.remove(loginUser);
	}
}
