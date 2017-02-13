package com.pro.bf.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// 파라메타에 attributes에 값을 저장하면 WebSocketSession에 전달된다.
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		HttpServletRequest req = ssreq.getServletRequest();
		String loginUser = (String)req.getSession().getAttribute("loginUser");
		attributes.put("ChatLogin", loginUser); // webSocketHandler session에서 값을 받아올 수 있도록
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
		super.afterHandshake(request, response, wsHandler, ex);
	}
}