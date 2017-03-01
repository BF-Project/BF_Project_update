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

import com.pro.bf.daoImpl.FreeDaoImpl;
import com.pro.bf.dto.CmtVO;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.serviceImpl.CmtServiceImpl;
import com.pro.bf.serviceImpl.FreeServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminFreeBoardController {

	@Autowired
	FreeServiceImpl freeService;
	
	@Autowired
	FreeDaoImpl freeDao;
	
	@Autowired
	CmtServiceImpl cmtService;
	
	@RequestMapping("FreeList")
	public String freeBoardList(HttpServletRequest request, Model model) throws NumberFormatException, SQLException{
		
		// 콤보박스 선택 값
		String comboSelectFree = request.getParameter("comboSelectFree"); // 초기에 null
		String selectCombo = "";
		if(!(comboSelectFree == null)&&!(comboSelectFree.trim().equals(""))){
			if(comboSelectFree.equals("first")){
				selectCombo = "first";
			}else if(comboSelectFree.equals("ID")){
				selectCombo = "ID";
			}
		}else{
			selectCombo = "first"; // 초기값 first // title로 검색한다.
		}
		
		// 자유게시판 리스트 or 검색
		String search = request.getParameter("search"); // 자유게시판 검색, null일 경우 전체 리스트 가져옴 || 초기값은 null
		if(search==null || search.equals("")){
			search="";
		}
		request.setAttribute("search", search);
		
		// 현재 페이지
		String page = request.getParameter("page"); // 처음에는 page의 값이 null 
		if(page==null || page.equals(""))
			page="1";
		model.addAttribute("page",page);

		// 페이지 이동
		String paging = null; // 처음 접속했을땐 null
				
		// Service, dao, db
		String currentPage = "FreeList"; // 현재 PageUrl
		ArrayList<FreeVO> freeList = null;
		freeList = freeService.FreeList(Integer.parseInt(page), search, selectCombo);
		paging = freeService.pageNumber2(Integer.parseInt(page), search, currentPage, selectCombo); // 페이징 | 기본은 Title로 검색함
		request.setAttribute("paging", paging);
		
		int freeListSize = 0;
		if(!(freeList.size()==0))
			freeListSize = freeList.size();
		request.setAttribute("freeListSize", freeListSize); // 자유개피산 개수
		request.setAttribute("freeList", freeList); // 리스트
		
		return "/admin/free/freeBoardList";
	}
	
	@RequestMapping("freeboardDelete")
	@ResponseBody
	public String freeboardDelete(String selectFreeNum, HttpSession session) throws NumberFormatException, SQLException{
		StringTokenizer strToken = new StringTokenizer(selectFreeNum, ",");
		String[] freeNum = new String[15]; // 최대로 받아올 수 있는 개수는 15개
		int deleteCount = 0;
		for(int i=0; strToken.hasMoreTokens(); i++){
			freeNum[i] = strToken.nextToken();
			if(freeNum[i].contains("undefined")){
				freeNum[i]=freeNum[i].replace("undefined", "").trim();
			}
			// 이제 삭제하면 됨
			freeDao.deleteFree(Integer.parseInt(freeNum[i]));
			deleteCount++;
		}
		session.setAttribute("deleteCount", deleteCount);
		return "yes";
	}
	
	@RequestMapping("freeDetail")
	public String freeDetail(String freeNum, Model model) throws NumberFormatException, SQLException{
		// jsp에서 전달해주는 page와 comboSelectFree 값은 url주소창의 파라메타로 넘기기 때문에 해당 jsp에서 계속 param.xxxx로 사용하면 된다.		
		// VO의 정보를 받아와 넘겨준다.
		FreeVO freeVo = freeDao.getFree(Integer.parseInt(freeNum));
		model.addAttribute("freeVo",freeVo);
		
		// 조회수 증가
		freeDao.viewCountUp(Integer.parseInt(freeNum));
		
		return "/admin/free/freeBoardDetail";
	}
	
	@RequestMapping("FreeCommentList")
	@ResponseBody
	public List<CmtVO> freeCommentList(@RequestBody Map<String, Object> jsonMap, HttpServletRequest request) throws NumberFormatException, SQLException{
		ArrayList<CmtVO> cmtList = (ArrayList<CmtVO>) cmtService.cmtAllList(Integer.parseInt((String)jsonMap.get("free_num")));
		return cmtList;
	}
	
	@RequestMapping("AdminCommentInsertToFree")
	@ResponseBody
	public String adminCommentInsertToCommunity(CmtVO cmtvo, HttpSession session) throws SQLException{
		String result = "yes"; // 확인하기 위한 변수
		cmtvo.setAdmin_id((String)session.getAttribute("loginAdmin"));
		if(cmtvo.getCmt_content().trim().equals("")||cmtvo.getCmt_content()==null){
			result="no";					
		}else{
			// 여기서 댓글 등록하면 됨
			cmtService.insertCmt(cmtvo);
		}		
		return result;
	}
	
	@RequestMapping("adminFreeCommentDelete")
	@ResponseBody
	public String adminFreeCommentDelete(String result) throws NumberFormatException, SQLException{
		// 삭제
		cmtService.deleteCmt(Integer.parseInt(result));
		return result;
	}
	
	@RequestMapping("deleteFreeBoard")
	@ResponseBody
	public String deleteFreeBoard(String fre_num) throws NumberFormatException, SQLException{
		freeDao.deleteFree(Integer.parseInt(fre_num));
		return null;
	}
	
	@RequestMapping("freeCommentCancel")
	@ResponseBody
	public Map<String, String> freeCommentCancel(Model model, String result) throws NumberFormatException, SQLException{
		String cmtContent= cmtService.searchContent(Integer.parseInt(result));
		Map<String, String> cmtContentt = new HashMap<String, String>();
		cmtContentt.put("cmtContent", cmtContent);
		return cmtContentt;
	}
	
	@RequestMapping("freeCommentUpdate")
	@ResponseBody
	public Map<String, String> freeCommentUpdate(CmtVO cmtVo) throws SQLException{
		System.out.println(cmtVo);
		// update
		cmtService.cmtContentUpdate(cmtVo);
		Map<String, String> content = new HashMap<String, String>();
		content.put("content", cmtVo.getCmt_content());
		return content;
	}
}