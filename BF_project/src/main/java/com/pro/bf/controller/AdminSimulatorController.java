package com.pro.bf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminSimulatorController {
	
	@RequestMapping("simulator")
	public String manage(){
		String url = "/admin/simulator/manage";
		return url;
	}
}
