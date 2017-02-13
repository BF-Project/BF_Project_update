package com.pro.bf.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pro.bf.dto.NoticeVO;
import com.pro.bf.serviceImpl.AdminServiceImpl;
import com.pro.bf.serviceImpl.NoticeServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminMainController {

	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	NoticeServiceImpl noticeService;
	
	@RequestMapping(value="start", method=RequestMethod.GET)
	public String goAdminPage(HttpServletRequest request, HttpSession session) throws SQLException{
		String url = "/admin/main";
		// 관리자 로그인한 아이디로 관리자 이름 가져오기
		String adminId = (String)session.getAttribute("loginAdmin");
		String adminName = adminService.adminName(adminId);
		session.setAttribute("adminName", adminName);
		return url;
	}
	
	@RequestMapping(value="exit")
	public String AdminPageOut(HttpSession session, HttpServletRequest request){
		session.removeAttribute("loginAdmin"); // 관리자 아이디로그인 정보 삭제
		session.removeAttribute("adminName");
		return "redirect:/start";
	}
	
	@RequestMapping("notice")
	public String noticeList(HttpServletRequest request, Model model, HttpSession session) throws UnsupportedEncodingException, SQLException{
		request.setCharacterEncoding("UTF-8");
		String url = "admin/notice/notice";
		
		// 공지사항 삭제할때 받아오는 delete 파라메타
		String delete = request.getParameter("del");
		if(!(delete==null))
			session.setAttribute("delete", delete); // 파라메타가 있을경우에만 세션에 저장
		
		// 공지사항 select한 것들을 삭제할때 받아오는 delete 파라메타
		String selectDeleteCount = request.getParameter("selectDelete");
		if(!(selectDeleteCount==null))
			session.setAttribute("selectDeleteCount", selectDeleteCount);
		
		// 공지사항 리스트 or 검색
		String search = request.getParameter("search"); // 공지사항 검색, null 일경우 전체리스트 가져옴 | 초기값은 null 
		if(search==null || search.equals(""))
			search="";
		request.setAttribute("search", search);
		
		// 현재 페이지
		String page = request.getParameter("page"); // 처음에는 page의 값이 null 
		if(page==null || page.equals(""))
			page="1";
		model.addAttribute("page",page);
		
		// 페이지 이동
		String paging = null; // 처음 접속했을땐 null
		
		
		// Service, dao, db
		String currentPage = "notice";
		ArrayList<NoticeVO> noticeList = null;
		noticeList = noticeService.noticeList(Integer.parseInt(page), search); // 공지사항 리스트(검색/검색안할때)
		paging = noticeService.pageNumber(Integer.parseInt(page), search, currentPage);
		
		int noticeListSize = 0;
		if(!(noticeList.size()==0))
			noticeListSize = noticeList.size();
		request.setAttribute("noticeListSize", noticeListSize); // 공지사항 개수
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("paging", paging);
		
		return url;
	}
	
	@RequestMapping("write")
	public String writeNotice(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		String url = "admin/notice/writeNotice";
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		return url;
	}
	
	@RequestMapping("InsertNotice")
	public String insertNotice(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam("fileUpload")MultipartFile multipartFile, Model model,
			@RequestParam(value="page", defaultValue="1")String page) throws SQLException, IOException{
		request.setCharacterEncoding("UTF-8");
		
		String url = "";
		
		request.setAttribute("page", page);
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String admin = (String)session.getAttribute("loginAdmin");
		
		// 공지사항은 null로 등록할 수 없다.
		if(!(noticeTitle==null) && !(noticeTitle.trim().equals(""))){
			
			NoticeVO noticeVo = new NoticeVO();
			noticeVo.setNotice_title(noticeTitle);
			noticeVo.setNotice_content(noticeContent);
			noticeVo.setAdmin_id(admin);
			
			PrintWriter out = response.getWriter();
			// 파일 업로드
			if(!multipartFile.isEmpty()){
				// 파일 업로드  OK
				String upload = request.getSession().getServletContext().getRealPath("resources/upload"); // 배포폴더
				File file = new File(upload, System.currentTimeMillis()+"$$"+multipartFile.getOriginalFilename());
				// uploadPath 경로에 | multipartFile를 저장 (System.currentTimeMillis()+"$$" 를 이름을 줘서 중복되는 명을 없앤다.)
				
				long fileSizeLimit = 1024*1024*10; // 10MB
				if(multipartFile.getSize() > fileSizeLimit){
					// 파일 용량이 10MB 이상일때
					response.setCharacterEncoding("UTF-8");
					out.println("<script>alert('파일 용량은 10MB 이하로만 등록 가능합니다.'); history.go(-1); </script>");
					return null;
				}
				
				multipartFile.transferTo(file); // 파일 저장
				model.addAttribute("fileName", file.getName()); // 파일 이름 
				model.addAttribute("uploadPath", file.getAbsolutePath()); // 파일 실제경로
				
				noticeVo.setNotice_pict_afat(file.getName());
			}else{
				noticeVo.setNotice_pict_afat(null);
			}
			noticeService.insertNotice(noticeVo);
			session.setAttribute("noticeInsertOK", "ok"); // 공지사항 등록여부
			url = "redirect:/admin/notice?page="+page;	
		}else{
			// 공지사항 등록 못함
			url = "redirect:/admin/write?page="+page;
			session.setAttribute("noticeINsertNO", "no");
		}
		return url;
	}
	
	@RequestMapping("noticeDetail")
	@ResponseBody
	public String noticeDetail(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, SQLException{		
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		NoticeVO noticeVo = new NoticeVO();		
		noticeVo = noticeService.noticeDetail(noticeNum); // 공지사항 번호로 공지사항 정보 받아오기 | 해당번째 공지사항 조회수 1 증가
		session.setAttribute("noticeVo", noticeVo);
		return null;
	}
	
	@RequestMapping("noticeDetailView")
	public String noticeDetailView(HttpServletRequest request, HttpSession session){
		NoticeVO noticeVo = (NoticeVO) session.getAttribute("noticeVo");
		request.setAttribute("noticeVo", noticeVo);
		session.removeAttribute("noticeVo");
		// session의 값을 request에 담고 session은 삭제
		request.setAttribute("page", request.getParameter("page"));
		return "/admin/notice/DetailView";
	}
	
	@RequestMapping("noticeDelete")
	@ResponseBody
	public String noticeDelete(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		String data = "";
		try {
			noticeService.noticeDelete(noticeNum);
			data = "yes";
		} catch (SQLException e) {
			data = "no";
		}
		return data;
	}
	
	@RequestMapping("noticeUpdate")
	@ResponseBody
	public String noticeUpdate(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, SQLException{
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		NoticeVO noticeVo = new NoticeVO();
		noticeVo = noticeService.noticeUpdate(noticeNum);
		session.setAttribute("noticeUpdateVo", noticeVo);
		return null;
	}
	
	@RequestMapping("noticeUpdateView")
	public String noticeUpdateView(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		NoticeVO noticeVo = (NoticeVO) session.getAttribute("noticeUpdateVo");
		request.setAttribute("noticeVo", noticeVo);
		session.removeAttribute("noticeUpdateVo");
		// session의 값을 request에 담고 session은 삭제
		request.setAttribute("page", request.getParameter("page"));
		// 페이지, request NoticeVo 넘겨줌
		return "/admin/notice/UpdateView";
	}
	
	@RequestMapping("updateNotice")
	public String updateNotice(@RequestParam("fileUpload")MultipartFile multipartFile, HttpServletRequest request,
			HttpSession session, HttpServletResponse response) throws SQLException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum")); // 공지사항 글 번호
		String admin = (String) session.getAttribute("loginAdmin"); // 현제 관리자 모드로 로그인한 관리자 아이디
		String noticeTitle = request.getParameter("noticeTitle"); // 제목
		String noticeContent = request.getParameter("noticeContent"); // 내용
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNotice_num(noticeNum);
		noticeVo.setAdmin_id(admin);
		noticeVo.setNotice_title(noticeTitle);
		noticeVo.setNotice_content(noticeContent);
		
		PrintWriter out = response.getWriter();
		
		if(!multipartFile.isEmpty()){
			String upload = request.getSession().getServletContext().getRealPath("resources/upload"); // 배포폴더
			File file = new File(upload, System.currentTimeMillis()+"$$"+multipartFile.getOriginalFilename());
			// uploadPath 경로에 | multipartFile를 저장 (System.currentTimeMillis()+"$$" 를 이름을 줘서 중복되는 명을 없앤다.)
				
			long fileSizeLimit = 1024*1024*10; // 10MB
			if(multipartFile.getSize() > fileSizeLimit){
				// 파일 용량이 10MB 이상일때
				response.setCharacterEncoding("UTF-8");
				out.println("<script>alert('파일 용량은 10MB 이하로만 등록 가능합니다.'); history.go(-1); </script>");
				return null;
			}
			multipartFile.transferTo(file); // 파일 저장
			noticeVo.setNotice_pict_afat(file.getName());
			//
		}else{
			String fileName=noticeService.noticeFileNameSearch(noticeNum);
			noticeVo.setNotice_pict_afat(fileName);
		}
		noticeService.noticeRealUpdate(noticeVo);
		session.setAttribute("noticeUpdateOK", "ok"); // 공지사항 등록여부
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("noticeNum",noticeNum);
		return "forward:/admin/noticeUpdateAferView";
	}
	
	@RequestMapping("noticeUpdateAferView")
	public String noticeUpdateAfterView(HttpServletRequest request) throws UnsupportedEncodingException, SQLException{
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		NoticeVO noticeVo = noticeService.noticeUpdate(noticeNum);
		request.setAttribute("noticeVo", noticeVo);
		request.setAttribute("page", request.getParameter("page"));
		return "/admin/notice/DetailView";
	}
	
	@RequestMapping("noticeUpdateCancel")
	public String noticeUpdateCandel(HttpServletRequest request) throws UnsupportedEncodingException, SQLException{
		request.setCharacterEncoding("UTF-8");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		request.setAttribute("page", request.getParameter("page"));
		NoticeVO noticeVo = noticeService.noticeUpdate(noticeNum);
		request.setAttribute("noticeVo", noticeVo);
		return "/admin/notice/DetailView";
	}
	
	@RequestMapping("noticeSelectDelete")
	@ResponseBody
	public String noticeSelectDelete(HttpServletRequest request) throws SQLException{
		String checkNoticeNumValue;
		int realDeleteCount = 0;
		try {
			checkNoticeNumValue = request.getParameter("checkNoticeNumValue");
			
			StringTokenizer strToken = new StringTokenizer(checkNoticeNumValue, ",");
			String noticeNumVal[] = new String[16]; // 최대 16개
			int deleteCount = 0; 
			if(!(checkNoticeNumValue==null)){
				for(int i=0; strToken.hasMoreTokens(); i++){
					noticeNumVal[i] = strToken.nextToken();
				}
				for(int i=0; i < noticeNumVal.length; i++){
					if(!(noticeNumVal[i]==null||noticeNumVal[i]=="")){
						if(noticeNumVal[i].contains("undefined")){
							noticeNumVal[i] = noticeNumVal[i].replace("undefined", "").trim();
						}
						if(!(noticeNumVal[i].contains("on"))){							
							deleteCount++;
							// noticeNumVal[i]로 공지사항 삭제하면 됨
							noticeService.noticeDelete(Integer.parseInt(noticeNumVal[i].trim()));
						}
					}
				}
			}
			realDeleteCount = deleteCount; // 삭제한 개수
		} catch (NullPointerException e) {
			System.out.println("NullPointerException");
		}
		return realDeleteCount+"";
	}
}