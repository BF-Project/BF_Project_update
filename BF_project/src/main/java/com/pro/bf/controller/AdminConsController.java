package com.pro.bf.controller;

import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin")
public class AdminConsController {

	@Resource(name="cons") // root-context.xml 등록해 놓은 properties의 id를 가져온다.	
	private Properties cons;
	
	@RequestMapping(value="ConsManager", method=RequestMethod.GET)
	public String ConsManager() {
		String url = "admin/consult/cons";
		return url;
	}
	
	@RequestMapping(value="ConsManager", method=RequestMethod.POST)
	public String ConsManager2(String irum, String email) {
		cons.put(email, irum);
		String url = "admin/consult/cons";
		return url;
	}
	
	@RequestMapping("regist")
	public String ConsRegist() {
		String url = "admin/consult/consRegist";
		return url;
	}
}
