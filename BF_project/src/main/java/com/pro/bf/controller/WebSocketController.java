package com.pro.bf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("chat")
	public String chattingPage(){
		return "/chatting/chat-ws";
	}
	
	@RequestMapping("admin/chat")
	public String adminChattingPage(){
		return "/admin/chatting/adminchat-ws";
	}
}
