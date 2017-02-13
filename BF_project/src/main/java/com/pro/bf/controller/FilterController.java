package com.pro.bf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FilterController {

	@RequestMapping("filter")
	public String FilterCont(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		return "/start";
	}
	
	@RequestMapping("filter2")
	public String filterChain(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		return null;
	}
	
	@RequestMapping("chatJoinBefore")
	@ResponseBody
	public String chatJoinBefore(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		return "yes";
	}
}
