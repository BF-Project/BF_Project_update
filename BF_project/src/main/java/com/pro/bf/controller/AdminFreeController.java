package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.bf.daoImpl.FreeDaoImpl;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.serviceImpl.FreeServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminFreeController {

	@Autowired
	FreeServiceImpl freeServiceImpl;
	
	@Autowired
	FreeDaoImpl freeDaoImpl;
	
	@RequestMapping("FreeList")
	public String FreeList(HttpServletRequest request, Model model) throws NumberFormatException, SQLException {
		String url = "admin/free/freeList";
		
		ArrayList<FreeVO> freeList = null;
		
		model.addAttribute("freeList", freeList);
		
		return url;
	}
}
