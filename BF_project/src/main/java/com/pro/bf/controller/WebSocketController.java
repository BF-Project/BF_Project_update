package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.bf.chatting.ChattingRoom;
import com.pro.bf.daoImpl.MbrDaoImpl;

/**
 * <pre>
 * 채팅 jsp 연결
 * </pre>
 * @author 차승현
 * @since 2017. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자                    수정내용
 * --------      --------    ----------------------
 * 2017. 2. 14.    차승현                    최초작성
 * Copyright (c) 2017 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WebSocketController {
	
	@Resource(name="rooms") // websocket-config.xml 등록해 놓은 map의 id를 가져온다.	
	private Map<String, ChattingRoom> rooms;
	
	@Autowired
	private MbrDaoImpl mbrDao;

	public void setMbrDAO(MbrDaoImpl mbrDao) {
		this.mbrDao = mbrDao;
	}
	
	@RequestMapping("chat")
	public String chattingPage(HttpServletRequest req) throws SQLException{
		
		String loginUser = (String)req.getSession().getAttribute("loginUser");
		
		ChattingRoom chattingRoom = new ChattingRoom(loginUser); // 채팅방을 만든 사람은 loginUser ==> owner
		                                                         // 채팅방의 고유 번호가 생성된다 ==> roomId
		rooms.put(chattingRoom.getRoomId(), chattingRoom); // roomId를 키값으로 해당 chattingRoom의 정보를 value로 넣는다.		
		req.setAttribute("room", chattingRoom); // 이 채팅방의 정보를 jsp에 전달해주기 위해
		String userName = mbrDao.searchUserName(chattingRoom.getOwner());
		req.setAttribute("owner", userName); // 이름
		return "/chatting/chat-ws";
	}
	
	@RequestMapping("admin/chat")
	public String adminChattingPage(String roomId, Model model){
		model.addAttribute("room", rooms.get(roomId));
		return "/admin/chatting/adminchat-ws";
	}
}
