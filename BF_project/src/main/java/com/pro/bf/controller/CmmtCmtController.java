package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.CmmtCmtVO;
import com.pro.bf.dto.CmtVO;
import com.pro.bf.serviceImpl.CmmtCmtServiceImpl;
import com.pro.bf.serviceImpl.CmtServiceImpl;

@Controller
@RequestMapping("/cmmtcmt")
public class CmmtCmtController {
	
	@Autowired
	CmmtCmtServiceImpl cmmtcmtServiceImpl;
		
	@RequestMapping(value = "/cmmtcmtList")
	@ResponseBody
	public List<CmmtCmtVO> cmmtcmtList(@RequestBody Map<String, Object> jsonMap,
			Model model, HttpServletResponse response) {
		
		
		List<CmmtCmtVO> cmmtcmtList1 =  new ArrayList<CmmtCmtVO>();
		
		String cmmtcmtnum = (String) jsonMap.get("cmmt_num");
		
		
		try {
			cmmtcmtList1 = cmmtcmtServiceImpl.cmmtcmtAllList(Integer.parseInt(cmmtcmtnum));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * List<CmtVO> tempList=new ArrayList<CmtVO>(); CmtVO cmt=new CmtVO();
		 * cmt.setMbr_id("test"); cmt.setCmt_date(new Date(2017,2,3));
		 * cmt.setCmt_content("어쩌구 저쩌구"); tempList.add(cmt);
		 */
		return cmmtcmtList1;
	}

	//커뮤니티 게시판 댓글 작성
	@RequestMapping(value = "/cmmtcmtWrite", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CmmtCmtVO> cmmtcmtWrite(@RequestBody CmmtCmtVO cmmtcmtVO, HttpSession session) {
		String mbr_id = (String) session.getAttribute("loginUser");
		cmmtcmtVO.setMbr_id(mbr_id);
		List<CmmtCmtVO> cmmtcmtList = new ArrayList<CmmtCmtVO>();
		try {
			cmmtcmtServiceImpl.intsertCmmtcmt(cmmtcmtVO);
			cmmtcmtList = cmmtcmtServiceImpl.cmmtcmtAllList(cmmtcmtVO.getCmmt_num());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmmtcmtList;
	}
	
	
	@RequestMapping(value ="/cmmtcmtWriteForm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cmmtcmtWriteForm(Model model, HttpServletRequest request) {
		int writeForm = Integer.parseInt(request.getParameter("result"));
		System.out.println(writeForm);
		
		Map<String, Object> map = new HashMap();
		List<CmmtCmtVO> cmmtcmtList = null;
		
		try {
			cmmtcmtList = cmmtcmtServiceImpl.cmmtcmtAllList(writeForm);
			map.put("cmmtcmtList", cmmtcmtList);
			map.put("writeForm", writeForm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	
	@RequestMapping(value="/cmmtcmtDelete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> cmmtcmtDelete(Model model ,HttpServletRequest request){
		//result가져온다
		int cmmtcmtnum=Integer.parseInt(request.getParameter("result"));
		
		Map <String,Object> map1=new HashMap();
		
		List<CmmtCmtVO>listlist=null;
		
		try {
			listlist=cmmtcmtServiceImpl.cmmtcmtListAn(cmmtcmtnum);
			cmmtcmtServiceImpl.deleteCmmtcmt(cmmtcmtnum);
			map1.put("listlist", listlist);
			map1.put("cmmtcmtnum", cmmtcmtnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return map1;
	}
	
	//댓글수정
	@RequestMapping(value = "/cmmtcmtUpdate", method = RequestMethod.POST)
	@ResponseBody
	public CmmtCmtVO cmmtcmtUpdate(Model model, CmmtCmtVO cmmtcmtVO, HttpServletRequest request) {
		
		int result = Integer.parseInt(request.getParameter("result"));
		String tt = request.getParameter("tt");
		
		List<CmmtCmtVO> cmmtcmtList = null;
		cmmtcmtVO.setCmmtcmt_num(result);
		cmmtcmtVO.setCmmtcmt_content(tt);
		
		try {
			cmmtcmtList = cmmtcmtServiceImpl.cmmtcmtAllList(result);
			cmmtcmtServiceImpl.updateCmmtcmt(cmmtcmtVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cmmtcmtVO;
	}


}


