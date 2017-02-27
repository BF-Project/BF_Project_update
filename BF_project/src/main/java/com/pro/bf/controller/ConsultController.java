package com.pro.bf.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/consult")
public class ConsultController {

	@RequestMapping("consult")
	public String Consult(HttpServletRequest request, Model model) {
		String url = "consult/consulting";
		
		
		
		return url;
	}
}
