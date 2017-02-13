package com.pro.bf.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.NoticeVO;
import com.pro.bf.serviceImpl.NoticeServiceImpl;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	NoticeServiceImpl noticeService;
	
	@RequestMapping(value="main") // method=RequestMethod.GET | POST
	public String noticeMain(HttpServletRequest request, Model model, HttpSession session) throws NumberFormatException, SQLException{
		
		// 공지사항 리스트 or 검색
		String search = request.getParameter("search"); // 공지사항 검색, null 일 경우 전체 리스트 가져옴, 초기값 null
		if(search==null || search.equals(""))
			search="";
		request.setAttribute("search", search);
		
		// 현재 페이지
		String page = request.getParameter("page"); // 처음에는 page 값 null
		if(page==null || page.equals(""))
			page="1";
		model.addAttribute("page",page);
		
		// 페이지 이동
		String paging = null; // 처음 접속할땐 null
		
		// Service, dao, db
		String currentPage = "main";
		ArrayList<NoticeVO> noticeList=null;
		noticeList = noticeService.noticeList(Integer.parseInt(page), search); // 공지사항 리스트(검색/검색안할때)
		System.out.println(noticeList);
		paging = noticeService.pageNumber(Integer.parseInt(page), search, currentPage); // 
		System.out.println("paging:"+paging);
		int noticeListSize = 0;
		if(!(noticeList.size()==0))
			noticeListSize = noticeList.size();
		request.setAttribute("noticeListSize", noticeListSize); // 공지사항 개수
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("paging", paging);
		return "/notice/main";
	}
	
	@RequestMapping(value="detailNotice", method=RequestMethod.POST)
	@ResponseBody
	public String detailNotice(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, SQLException{		
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		NoticeVO noticeVo = noticeService.noticeDetail(noticeNum); // 공지사항 정보 받아오기 + 조회수 증가
		session.setAttribute("noticeVo", noticeVo);
		return null;
	}
	
	@RequestMapping("detailNoticeView")
	public String detailNoticeView(HttpServletRequest request, HttpSession session){
		NoticeVO noticeVo = (NoticeVO)session.getAttribute("noticeVo");
		request.setAttribute("noticeVo", noticeVo);
		session.removeAttribute("noticeVo");
		request.setAttribute("page", request.getParameter("page"));
		// session의 값을 request에 담고 session 삭제
		return "/notice/noticeDetailView";
	}
}
