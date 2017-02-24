package com.pro.bf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.bf.serviceImpl.LentServiceImpl;

@Controller
@RequestMapping(value="consulting")
public class ConsultingController {
	
	@Autowired
	LentServiceImpl lentService;
	
	@RequestMapping(value="recommend")
	public String recommend(){
		String url = "consulting/recommend";
		return url;
	}
	
	@RequestMapping(value="execRecommend")
	public void execRecommend(){
		
	}
}
