package com.pro.bf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminConsController {

	@RequestMapping("ConsManager")
	public String ConsManager() {
		String url = "admin/consult/cons";
		
		return url;
	}
	
	@RequestMapping("regist")
	public String ConsRegist() {
		String url = "admin/consult/consRegist";
		return url;
	}
}
