package com.pro.bf.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pro.bf.daoImpl.FreeDaoImpl;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.serviceImpl.CmtServiceImpl;
import com.pro.bf.serviceImpl.FreeServiceImpl;

@Controller
@RequestMapping("/free")
public class FreeController {

	@Autowired
	FreeServiceImpl freeServiceImpl;

	@Autowired
	FreeDaoImpl freeDaoImpl;

	@Autowired
	CmtServiceImpl cmtServiceImpl;

	public void setFreeServiceImpl(FreeServiceImpl freeServiceImpl) {
		this.freeServiceImpl = freeServiceImpl;
	}

	public void setFreeDaoImpl(FreeDaoImpl freeDaoImpl) {
		this.freeDaoImpl = freeDaoImpl;
	}

	public void setCmtServiceImpl(CmtServiceImpl cmtServiceImpl) {
		this.cmtServiceImpl = cmtServiceImpl;
	}

	@RequestMapping("/freeList")
	public String freeList(HttpServletRequest request, Model model)
			throws ServletException, IOException, SQLException {

		String url = "free/freeList";
		String tpage = request.getParameter("tpage");
		String classify = null;

		if (tpage == null) {
			tpage = "1";
		} else if (tpage.equals("")) {
			tpage = "1";
		}

		model.addAttribute("tpage", tpage);

		ArrayList<FreeVO> freeList = null;
		String paging = null;

		freeList = freeServiceImpl.getFreeList(Integer.parseInt(tpage));
		paging = freeServiceImpl.pageNumber(Integer.parseInt(tpage), classify);

		model.addAttribute("freeList", freeList);
		int n = freeList.size();
		model.addAttribute("freeListSize", n);
		model.addAttribute("paging", paging);

		return url;
	}

	@RequestMapping("freeWrite")
	public String freeWrite(HttpSession session) throws ServletException,
			IOException {
		String url = "free/freeWrite";
		String loginUser = (String) session.getAttribute("loginUser");
		return url;
	}

	@RequestMapping(value = "/freeWriteForm", method = RequestMethod.POST)
	public String freeWriteForm(
			@RequestParam("fre_title") String fre_title,
			@RequestParam("fre_content") String fre_content, 
			@RequestParam(value="file",defaultValue="")
			MultipartFile filefile,
			HttpSession session,HttpServletRequest request)
			throws ServletException, IOException, SQLException {
		String url = "redirect:freeList";

		String loginUser = (String) session.getAttribute("loginUser");

		FreeVO freeVO = new FreeVO();
		freeVO.setFre_title(fre_title);
		freeVO.setFre_content(fre_content);
		freeVO.setMbr_id(loginUser);

		//fileupload
		session=request.getSession();
		String savePath="resources/upload";
		ServletContext context=session.getServletContext();
		String uploadFilePath=context.getRealPath(savePath);
		
		if(!filefile.isEmpty()){
			File file1=new File(uploadFilePath,System.currentTimeMillis()+filefile.getOriginalFilename());
			filefile.transferTo(file1);
			freeVO.setFre_pict_afat(file1.getName());
		}
			
		
		freeServiceImpl.insertFree(freeVO);

		return url;
	}

	@RequestMapping("/freeView")
	public String freeView(@RequestParam("fre_num") int fre_num, Model model)
			throws ServletException, IOException, SQLException {
		String url = "free/freeView";

		FreeVO freeVO = freeServiceImpl.getFreeVO(fre_num);

		freeDaoImpl.countFree(freeVO);
		freeVO.setFre_cnt(freeVO.getFre_cnt() + 1);

		model.addAttribute("freeVO", freeVO);
		return url;
	}

	@RequestMapping("/delete")
	public String deleteFree(@RequestParam("fre_num") int fre_num)
			throws ServletException, IOException, SQLException {
		String url = "redirect:freeList";

		freeDaoImpl.deleteFree(fre_num);

		return url;
	}

	@RequestMapping("/update")
	public String freeUpdate(HttpSession session, String fre_num, Model model)
			throws ServletException, IOException, SQLException {
		String url = "free/freeUpdate";

		FreeVO freeVO = freeServiceImpl.getFreeDetail(fre_num);

		model.addAttribute("freeVO", freeVO);
		model.addAttribute(fre_num);

		return url;
	}

	@RequestMapping(value = "/freeUpdateForm", method = RequestMethod.POST)
	public String freeUpdateForm(
			@RequestParam("fre_num") int fre_num,
			@RequestParam("file")MultipartFile file,
			@RequestParam("nofile")String nofile,
			@RequestParam(value="fre_pict_afat",defaultValue="")String fre_pict_afat,
			FreeVO freeVO, Model model,
			HttpServletRequest request
			) throws ServletException, IOException,
			SQLException {
		String url = "redirect:freeList";
		
		HttpSession session=request.getSession();
		
		//fileupload
		String savePath="resources/upload";
		ServletContext context=session.getServletContext();
		String uploadFilePath=context.getRealPath(savePath);
		
		if(!file.isEmpty()){
			File file1=new File(uploadFilePath,System.currentTimeMillis()+file.getOriginalFilename());
			file.transferTo(file1);
			
			freeVO.setFre_pict_afat(file1.getName());
		}else{
			freeVO.setFre_pict_afat(nofile);
		}
		
		freeDaoImpl.updateFree(freeVO);

		model.addAttribute(fre_num);

		return url;
	}

	@RequestMapping(value = "/freeSearch", method = RequestMethod.POST)
	public String cmtSearch(@RequestParam String keyWord, Model model,
			HttpServletRequest request) throws ServletException, IOException,
			SQLException {

		String url = "free/freeList";
		if (keyWord.equals("")) {
			freeList(request, model);
			return url;
		} else {
			String tpage = request.getParameter("tpage");
			String classify = keyWord;
			if (tpage == null) {
				tpage = "1";
			} else if (tpage.equals("")) {
				tpage = "1";
			}
			model.addAttribute("tpage", tpage);

			ArrayList<FreeVO> freeList = null;
			String paging = null;
			try {
				freeList = freeServiceImpl.freSearch(keyWord);
				paging = freeServiceImpl.pageNumber(Integer.parseInt(tpage),
						classify);
				model.addAttribute("freeList", freeList);
				model.addAttribute("paging", paging);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return url;
		}
	}

}
