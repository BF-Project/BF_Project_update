package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.CmmtCmtVO;
import com.pro.bf.dto.CommunityVO;
import com.pro.bf.serviceImpl.CmmtCmtServiceImpl;
import com.pro.bf.serviceImpl.CommunityServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminCommunityController {
		
	//@Autowired설정
	@Autowired(required=false)
	CommunityServiceImpl cmmtService; // Service에 @Service 에너테이션을 사용함 / 따로 빈등록 안해도 사용 가능
	
	@Autowired
	CmmtCmtServiceImpl cmmtcmtService;
	
	@RequestMapping("CommunityList")
	public String CommunitiList(HttpServletRequest request, Model model) throws NumberFormatException, SQLException{
		
		// selectCombo 이것으로 어떤것을 검색해서 리스트를 받아올건지 결정함
		String comboSelectCommunity = request.getParameter("comboSelectCommunity"); // 초기에 null
		String selectCombo = "";
		if(!(comboSelectCommunity == null)&&!(comboSelectCommunity.trim().equals(""))){
			if(comboSelectCommunity.equals("first")){
				selectCombo = "first";
			}else if(comboSelectCommunity.equals("ID")){
				selectCombo = "ID";
			}
		}else{
			selectCombo = "first"; // 초기값 first // title로 검색한다.
		}
		
		// 커뮤니티 게시판 리스트 or 검색
		String search = request.getParameter("search"); // 커뮤니티 게시글 검색, null 일경우 전체리스트 가져옴 | 초기값은 null 
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
		String currentPage = "CommunityList"; // 현재 PageUrl
		ArrayList<CommunityVO> communityList = null;
		communityList = cmmtService.communityList(Integer.parseInt(page), search, selectCombo); // 커뮤니티 게시글 리스트(검색 | 검색안할때) | 기본은 ... 그냥 전체리스트
		paging = cmmtService.pageNumber2(Integer.parseInt(page), search, currentPage, selectCombo); // 페이징 | 기본은 Title 으로 검색함
		request.setAttribute("paging", paging);
		int CommunityListSize = 0;
		if(!(communityList.size()==0))
			CommunityListSize = communityList.size();	
		request.setAttribute("CommunityListSize", CommunityListSize); // 커뮤니티게시판 개수
		request.setAttribute("communityList", communityList);
		
		return "/admin/community/communityList";
	}
	
	@RequestMapping("cmmtSelectDelete")
	@ResponseBody
	public String cmmtSelectDelete(String checkCmmtNumValue, HttpSession session) throws NumberFormatException, SQLException{
		StringTokenizer strToken = new StringTokenizer(checkCmmtNumValue,",");
		String[] selectCmmtNum = new String[15]; // 최대 선택할 수 있는 개수 15개
		int deleteCount = 0; // 삭제한 개수 session에 넣을 값
		for(int i=0; strToken.hasMoreTokens(); i++){
			selectCmmtNum[i] = strToken.nextToken();
			if(selectCmmtNum[i].contains("undefined")){
				selectCmmtNum[i] = selectCmmtNum[i].replace("undefined", "").trim();
			}
			// 선택한 값 삭제하면 됨
			cmmtService.deleteCmmt(Integer.parseInt(selectCmmtNum[i])); 
			deleteCount++; // 넘길 값			
		}
		session.setAttribute("deleteCount", deleteCount);		
		return "yes";
	}
	
	@RequestMapping("communityDetail")
	public String communityDetail(String cmmtNum, Model model) throws NumberFormatException, SQLException{
		// VO정보를 가져옴
		CommunityVO cmmtVo = cmmtService.getCmmtVO(Integer.parseInt(cmmtNum));
		model.addAttribute("cmmtVo",cmmtVo);		
		
		// 조회수 증가
		cmmtService.plusView(Integer.parseInt(cmmtNum));
		
		return "/admin/community/communityDetail";
	}
	
	@RequestMapping("communityCommentList")
	@ResponseBody
	public List<CmmtCmtVO> communityCommentList(@RequestBody Map<String, Object> jsonMap, HttpServletRequest request) throws NumberFormatException, SQLException{
		ArrayList<CmmtCmtVO> cmmtcmtList = (ArrayList<CmmtCmtVO>) cmmtcmtService.cmmtcmtAllList(Integer.parseInt((String)jsonMap.get("cmmt_num")));
		return cmmtcmtList;
	}
	
	/**
	 * @param content
	 * @param cmmtNum
	 * @return Ajax
	 * @throws SQLException 
	 */
	@RequestMapping("AdminCommentInsertToCommunity")
	@ResponseBody
	public String AdminCommentInsertToCommunity(CmmtCmtVO cmmtcmtVo, HttpSession session) throws SQLException{
		String result = "yes"; // 확인하기 위한 변수
		cmmtcmtVo.setAdmin_id((String)session.getAttribute("loginAdmin"));
		
		if(cmmtcmtVo.getCmmtcmt_content()==null || cmmtcmtVo.getCmmtcmt_content().trim().equals("")){
			result = "no";
		}else{
			// service dao
			cmmtcmtService.intsertCmmtcmt(cmmtcmtVo);
			result = "yes";
		}
		return result;
	}
	
	@RequestMapping("cmmtcmtDelete")
	@ResponseBody
	public String cmmtcmtDelete(String result) throws NumberFormatException, SQLException{
		cmmtcmtService.deleteCmmtcmt(Integer.parseInt(result)); // 삭제한다.		
		return result;
	}
	
	@RequestMapping("communityOneDelete")
	@ResponseBody
	public String communityOneDelete(String cmt_num) throws NumberFormatException, SQLException{
		cmmtService.deleteCmmt(Integer.parseInt(cmt_num));
		return null;
	}
	
	@RequestMapping("communityCommentCancel")
	@ResponseBody
	public Map<String, String> communityCommentCancel(String result) throws NumberFormatException, SQLException{
		// 해당 키값의 content를 받아온다. 댓글
		String cmtContent = cmmtcmtService.searchContent(Integer.parseInt(result));
		Map<String, String> content = new HashMap<String, String>();
		content.put("content", cmtContent);
		return content;
	}
	
	@RequestMapping("communityCommentUpdate")
	@ResponseBody
	public Map<String, String> communityCommentUpdate(CmmtCmtVO cmmtcmtVo) throws SQLException{
		// 수정
		cmmtcmtService.cmmtCommentUpdate(cmmtcmtVo);
		Map<String, String> content = new HashMap<String, String>();
		content.put("content", cmmtcmtVo.getCmmtcmt_content());
		return content;
	}
}