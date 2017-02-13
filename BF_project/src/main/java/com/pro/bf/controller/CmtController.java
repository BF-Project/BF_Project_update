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

import com.pro.bf.dto.CmtVO;
import com.pro.bf.serviceImpl.CmtServiceImpl;

@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	CmtServiceImpl CmtServiceImpl;

	@RequestMapping(value = "/cmtList", method = RequestMethod.POST)
	@ResponseBody
	public List<CmtVO> cmtList(@RequestBody Map<String, Object> jsonMap,
			Model model, HttpServletResponse response) {
		List<CmtVO> cmtList = new ArrayList<CmtVO>();
		String cmt_num = (String) jsonMap.get("fre_num");
		try {
			cmtList = CmtServiceImpl.cmtAllList(Integer.parseInt(cmt_num));
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
		return cmtList;
	}

	@RequestMapping(value = "cmtWrite", method = RequestMethod.POST)
	@ResponseBody
	public List<CmtVO> cmtWrite(@RequestBody CmtVO cmtVO, HttpSession session) {
		String mbr_id = (String) session.getAttribute("loginUser");
		cmtVO.setMbr_id(mbr_id);
		List<CmtVO> cmtList = new ArrayList<CmtVO>();
		try {
			CmtServiceImpl.insertCmt(cmtVO);
			cmtList = CmtServiceImpl.cmtAllList(cmtVO.getFre_num());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmtList;
	}
	
/*	@RequestMapping(value="/cmtDelete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> cmtDelete(Model model ,HttpServletRequest request){
		//result가져온다
		int cmtnum=Integer.parseInt(request.getParameter("result"));
		System.out.println(cmtnum);
		Map <String,Object> map1=new HashMap();
		
		List<CmtVO>listlist=null;
		
		try {
			listlist=CmtServiceImpl.cmtListAn(cmtnum);
			CmtServiceImpl.deleteCmt(cmtnum);
			map1.put("listlist", listlist);
			map1.put("cmtnum", cmtnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return map1;
	}*/

	@RequestMapping(value = "/cmtDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cmtDelete(Model model, HttpServletRequest request) {
		int cmtNum = Integer.parseInt(request.getParameter("result"));
		System.out.println(cmtNum);
		Map<String, Object> map = new HashMap();

		List<CmtVO> cmtList = null;

		try {
			cmtList = CmtServiceImpl.cmtAllList(cmtNum);
			CmtServiceImpl.deleteCmt(cmtNum);
			map.put("cmtList", cmtList);
			map.put("cmtNum", cmtNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/cmtWriteForm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cmtWriteForm(Model model, HttpServletRequest request) {
		int writeForm = Integer.parseInt(request.getParameter("result"));
		System.out.println(writeForm);
		
		Map<String, Object> map = new HashMap();
		List<CmtVO> cmtList = null;
		
		try {
			cmtList = CmtServiceImpl.cmtAllList(writeForm);
			map.put("cmtList", cmtList);
			map.put("writeForm", writeForm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/cmtUpdate", method = RequestMethod.POST)
	@ResponseBody
	public CmtVO cmtUpdate(Model model, CmtVO cmtVO, HttpServletRequest request) {
		
		int result = Integer.parseInt(request.getParameter("result"));
		String tt = request.getParameter("tt");
		
		List<CmtVO> cmtList = null;
		cmtVO.setCmt_num(result);
		cmtVO.setCmt_content(tt);
		
		try {
			cmtList = CmtServiceImpl.cmtAllList(result);
			CmtServiceImpl.updateCmt(cmtVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cmtVO;
	}

}
