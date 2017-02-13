package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.MbrVO;
import com.pro.bf.serviceImpl.MbrServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminMemberOperateController {

	@Autowired
	MbrServiceImpl mbrService;
	
	@RequestMapping("memberOperate")
	public String memberOperatePage(HttpServletRequest request, Model model, HttpSession session) throws NumberFormatException, SQLException{

		String url = "admin/member/main";
		
//		// 공지사항 삭제할때 받아오는 delete 파라메타
//		String delete = request.getParameter("del");
//		if(!(delete==null))
//			session.setAttribute("delete", delete); // 파라메타가 있을경우에만 세션에 저장
//		
		// 회원리스트 select한 것들을 삭제할때 받아오는 delete 파라메타
		String selectDeleteCount = request.getParameter("selectDelete");
		if(!(selectDeleteCount==null))
			session.setAttribute("selectDeleteCount", selectDeleteCount);
		
		// 회원리스트 select한 것들을 재사용할때 받아오는 reuse 파라메타
		String reuseMemberCount = request.getParameter("reuseMember");
		if(!(reuseMemberCount==null))
			session.setAttribute("reuseMemberCount", reuseMemberCount);
		
				//---------------- selectCombo ! 이것으로 어떤것을 검색해서 리스트를 받아올건지 결정함 | service에서 설정함
				String comboSelectMember = request.getParameter("comboSelectMember"); // 초기에 null
				String selectCombo = "";
				if(!(comboSelectMember == null)){
					if(comboSelectMember.equals("comboName")){
						selectCombo = "NAME";
					}else if(comboSelectMember.equals("comboId")){
						selectCombo = "ID";
					}else if(comboSelectMember.equals("comboPhone")){
						selectCombo = "PHONE";
					}
				}else if(comboSelectMember == null){
					selectCombo = "NAME";
				}				
				//----------------
		
		// 회원 리스트 or 검색
		String search = request.getParameter("search"); // 회원 검색, null 일경우 전체리스트 가져옴 | 초기값은 null 
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
		String currentPage = "memberOperate";
		ArrayList<MbrVO> memberList = null;
		memberList = mbrService.memberList(Integer.parseInt(page), search, selectCombo); // 회원 리스트(검색/검색안할때) | 기본 NAME 으로 검색
		paging = mbrService.pageNumber(Integer.parseInt(page), search, currentPage, selectCombo); // 페이징 | 기본은 Name 으로 검색함
				
				// main화면에서 useYN을 선택했을때  그 리스트만 보여주기 위함
				String choiceUseYNT = request.getParameter("choiceUseYNT"); // 초기값은 null
				if(!(choiceUseYNT==null)){
					if(choiceUseYNT.equals("Y")){
						ArrayList<MbrVO> memberListUse = mbrService.memberListForUseyn(choiceUseYNT);
						memberList = null;
						memberList = memberListUse;
					}else if(choiceUseYNT.equals("N")){
						ArrayList<MbrVO> memberListUse = mbrService.memberListForUseyn(choiceUseYNT);
						memberList = null;
						memberList = memberListUse;
					}else if(choiceUseYNT.equals("Total")){
						// 본래의 memberList를 사용하면 됨
					}
				}
				//
				
		int memberListSize = 0;
		if(!(memberList.size()==0))
			memberListSize = memberList.size();
		request.setAttribute("memberListSize", memberListSize); // 회원 수
		request.setAttribute("memberList", memberList);
		request.setAttribute("paging", paging);
		
		// 회원의 사용가능자(useYn='Y') 의 수를 알아보기
		String memberUseYCount = mbrService.memberListCount();
		request.setAttribute("memberUseYCount", memberUseYCount);
		return url;
	}
	
	
	@RequestMapping("SelectMemberDelete")
	@ResponseBody
	public String SelectMemberDelete(HttpServletRequest request) throws SQLException{
		String checkMemberKey = request.getParameter("checkMemberKey");
		int deleteMemberCount = 0;
		if(!(checkMemberKey==null)){
			String checkMemberKeyToken[] = new String[15]; // 한 페이지에 최대로 나올 수 있는 개수 15개(멤버)
			StringTokenizer Token = new StringTokenizer(checkMemberKey,",");
			for(int i=0; Token.hasMoreTokens(); i++){
				checkMemberKeyToken[i] = Token.nextToken();
				if(checkMemberKeyToken[i].contains("undefined")){
					checkMemberKeyToken[i] = checkMemberKeyToken[i].replace("undefined", "").trim();
				}
				// 여기서 delete
				mbrService.deleteMember(checkMemberKeyToken[i]);
				deleteMemberCount++;
			}
		}
		return deleteMemberCount+"";
	}
	
	@RequestMapping("SelectMemberReuse")
	@ResponseBody
	public String SelectMemberReuse(HttpServletRequest request) throws SQLException{
		String checkMemberReuse = request.getParameter("checkMemberReuse");
		int reUseMemberCount = 0;
		if(!(checkMemberReuse==null)){
			String checkMemberReuseToken[] = new String[15]; // 한 페이지에 최대로 선택할 수 있는 개수 15개
			StringTokenizer Token = new StringTokenizer(checkMemberReuse, ",");
			for(int i=0; Token.hasMoreTokens(); i++){
				checkMemberReuseToken[i] = Token.nextToken();
				if(checkMemberReuseToken[i].contains("undefined")){
					checkMemberReuseToken[i] = checkMemberReuseToken[i].replace("undefined", "").trim();
				}
				// 여기서 Reuse
				mbrService.reuseMember(checkMemberReuseToken[i]);
				reUseMemberCount++;
			}
		}
		return (reUseMemberCount+"").trim();
	}
	
	@RequestMapping("memberDetail")
	public String memberDetail(HttpServletRequest request) throws SQLException{
		String memberId = request.getParameter("member_select_Id");
		MbrVO memberVo = mbrService.MemberVoSearch(memberId);		
		//
		request.setAttribute("memberVo", memberVo); // Vo정보를 jsp에 넘겨준다.
		request.setAttribute("page", request.getParameter("page")); // 현재 page를 jsp에 넘겨준다.
		return "/admin/member/memberDetailView";
	}
	
	@RequestMapping("oneMemberDelete")
	@ResponseBody
	public String oneMemberDelete(HttpServletRequest request, HttpSession session) throws SQLException{
		String memberId = request.getParameter("memberid");
		mbrService.deleteMember(memberId);
		session.setAttribute("memberId", memberId);
		return null;
	}
	
	@RequestMapping("oneMemberReuse")
	@ResponseBody
	public String onMemberReuse(HttpServletRequest request, HttpSession session) throws SQLException{
		String memberId = request.getParameter("memberid");
		mbrService.reuseMember(memberId);
		session.setAttribute("memberReuseId", memberId);
		return null;
	}
	
	@RequestMapping("memberUpdateView")
	public String memberUpdate(HttpServletRequest request) throws SQLException {
		String memberid = request.getParameter("memberid");
		MbrVO memberVo = mbrService.MemberVoSearch(memberid);
		request.setAttribute("memberVo", memberVo);
		request.setAttribute("page", request.getParameter("page")); // page 번호를 계속 이어서 넘겨준다.
		return "/admin/member/memberUpdate";
	}
	
	@RequestMapping("memberUpdateGoGo")
	public String memberUpdateGoGo(HttpServletRequest request, MbrVO mbrvo, HttpSession session) throws SQLException{
		// 관리자가 수정할 수 있는 회원의 정보는  pw | name | phone | email | address  5개만  | id는 key값으로 사용
		// mbrvo 에 정보다 다 담아짐
		mbrService.memberUpdate(mbrvo);
		session.setAttribute("memberUpdateYY", mbrvo.getMbr_id());
		return "redirect:/admin/memberDetail?page="+request.getParameter("page")+"&member_select_Id="+mbrvo.getMbr_id();
	}
}