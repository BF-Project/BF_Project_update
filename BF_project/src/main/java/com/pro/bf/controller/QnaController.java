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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pro.bf.dao.QnADao;
import com.pro.bf.daoImpl.QnADaoImpl;
import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.QnAVO;
import com.pro.bf.serviceImpl.MbrServiceImpl;
import com.pro.bf.serviceImpl.QnAServiceImpl;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {
	
	@Autowired(required = false)
	QnAServiceImpl qnaServiceImpl;

	public void setQnaServiceImpl(QnAServiceImpl qnaServiceImpl) {
		this.qnaServiceImpl = qnaServiceImpl;
	}

	
	@RequestMapping("/qnaList")
	public String qnaList(HttpServletRequest request, HttpSession session,Model model) throws ServletException, IOException {

		String url = "qna/qnaList";
		
		String tpage = request.getParameter("tpage");
		String search=request.getParameter("search");
		
		if(search==null || search.equals(""))
			search="";
		if (tpage == null) {
			tpage = "1";
		} else if (tpage.equals("")) {
			tpage = "1";
		}
		
		model.addAttribute("tpage", tpage);

		ArrayList<QnAVO> qnaList = null;
		String paging = null;
		
		try {
			qnaList = qnaServiceImpl.getQnaList(Integer.parseInt(tpage),search);
			paging = qnaServiceImpl.pageNumber(Integer.parseInt(tpage),search);
		
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	
		model.addAttribute("qnaList", qnaList);
		int n = qnaList.size();
		model.addAttribute("qnaListSize", n);
		model.addAttribute("paging", paging);

		return url;
	}

	@RequestMapping("/delete")
	public String deleteQna(@RequestParam("qna_num") int qna_num)throws ServletException, IOException {

		String url = "redirect:qnaList";

		try {
			qnaServiceImpl.deleteQna(qna_num);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/qnaView")
	public String qnaView(@RequestParam("qna_num") int qna_num,	HttpSession session, Model model) throws ServletException,IOException, SQLException {

		String url = "qna/qnaView";

		QnAVO qnaVO = qnaServiceImpl.getQnaVO(qna_num);
		model.addAttribute("qnaVO", qnaVO);

		return url;
	}

	@RequestMapping("/qnaWrite")
	public String qnaWriteForm(HttpSession session) throws ServletException, IOException {
		
		String url = "qna/qnaWrite";
		
		String loginUser = (String) session.getAttribute("loginUser");
		
		return url;
	}
	
	@RequestMapping(value = "/qnaWriteForm", method = RequestMethod.POST)
	public String qnaWrite(
			 @RequestParam("qna_title") String qna_title,	
			 @RequestParam("qna_content") String qna_content, 
			 HttpSession session,
			 @RequestParam(value="file",defaultValue="")MultipartFile filefile,
			 HttpServletRequest request)throws ServletException, IOException, SQLException {

		String url = "redirect:qnaList";

		String loginUser = (String) session.getAttribute("loginUser");
		
		//jsp에서 value값 파라미터에추가
		String qnasecrit = request.getParameter("qnasecrit");
		
		QnAVO qnaVO = new QnAVO();
		qnaVO.setQna_title(qna_title);
		qnaVO.setQna_content(qna_content);
		qnaVO.setMbr_id(loginUser);
		
		//비밀글
		if(!(qnasecrit==null)){
			qnaVO.setQna_secrit(qnasecrit);
			
		}else{
			qnaVO.setQna_secrit("N");
		};
		
		//fileupload
		session=request.getSession();
		String savePath="resources/upload";
		ServletContext context=session.getServletContext();
		String uploadFilePath=context.getRealPath(savePath);
		
		if(!filefile.isEmpty()){
			File file1=new File(uploadFilePath,System.currentTimeMillis()+filefile.getOriginalFilename());
			filefile.transferTo(file1);
			qnaVO.setQna_pict_afat(file1.getName());
		}
		
		qnaServiceImpl.insertQna(qnaVO);
		
		return url;
	}

	@RequestMapping("/update")
	public String qnaUpdate(HttpSession session, String qna_num, Model model)throws ServletException, IOException, SQLException {

		String url = "qna/qnaUpdate";

		QnAVO qnaVO = qnaServiceImpl.getQnaDetail(qna_num);

		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute(qna_num);

		return url;
	}

	@RequestMapping(value = "/qnaUpdateForm", method = RequestMethod.POST)
	public String qnaUpdateForm(
			@RequestParam("qna_num") int qna_num,
			@RequestParam("qna_title") String qna_title,
			@RequestParam("qna_content") String qna_content, Model model
			,
			HttpServletRequest request,
			@RequestParam("file")MultipartFile file,
			@RequestParam("nofile")String nofile,
			@RequestParam(value="qna_pict_afat",defaultValue="")String qna_pict_afat
			)throws ServletException, IOException, SQLException {
				
		String url = "redirect:qnaList";

		QnAVO qnaVO = new QnAVO();

		qnaVO.setQna_title(qna_title);
		qnaVO.setQna_content(qna_content);
		qnaVO.setQna_num(qna_num);

		model.addAttribute(qna_num);

		HttpSession session = request.getSession();

		//file upload
		String savePath="resources/upload";
		ServletContext context=session.getServletContext();
		String uploadFilePath=context.getRealPath(savePath);
		
		if(!file.isEmpty()){
			File file1=new File(uploadFilePath,System.currentTimeMillis()+file.getOriginalFilename());
			file.transferTo(file1);
			
			qnaVO.setQna_pict_afat(file1.getName());
		}else{
			qnaVO.setQna_pict_afat(nofile);
		}
		
		qnaServiceImpl.updateQna(qnaVO);
				
		return url;
	}

	
	//추가
	@RequestMapping(value="/search",method=RequestMethod.POST) // method=RequestMethod.GET | POST
	public String qnaSearch(
			HttpServletRequest request, 
			Model model,
			HttpSession session) throws NumberFormatException, SQLException{
								
	// 커뮤니티 리스트 or 검색
			String search = request.getParameter("search"); // 커뮤니티 검색, null 일 경우 전체 리스트 가져옴, 초기값 null
			if(search==null || search.equals(""))
			search="";
			request.setAttribute("search", search);
				
	// 현재 페이지
			String tpage = request.getParameter("tpage"); // 처음에는 page 값 null
			if(tpage==null || tpage.equals(""))
			tpage="1";
			model.addAttribute("tpage",tpage);
				
	// 페이지 이동
			String paging = null; // 처음 접속할땐 null
		
			ArrayList<QnAVO> qnaList=null;
			qnaList = qnaServiceImpl.listAllQna(Integer.parseInt(tpage), search); // 공지사항 리스트(검색/검색안할때)
			paging = qnaServiceImpl.pageNumber(Integer.parseInt(tpage), search); 
				
			int qnaListSize = 0;
			if(!(qnaList.size()==0))
			qnaListSize = qnaList.size();
			request.setAttribute("qnaListSize", qnaListSize); 
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("paging", paging);
			return "/qna/qnaList";
		}
		
	@RequestMapping("qnaViewBeforYN")
	@ResponseBody // ~~~~~~~~~~~~~~~~~~~~~~
	public String qnaViewBeforYN(HttpServletRequest request, HttpSession session) throws NumberFormatException, SQLException{
			String qna_num = request.getParameter("qna_num");
			QnAVO qnaVo = qnaServiceImpl.SearchQnaVo(Integer.parseInt(qna_num));

			String secritYN = qnaVo.getQna_secrit(); // 해당글의 비밀글 여부 
			String writer = qnaVo.getMbr_id(); // 해당 글의 작성자
			
			String readYN = "yes";
			if(!(secritYN.equals("N"))){
			//	System.out.println("비밀글이 Y가 맞나? : " + secritYN);
				if(writer.equals(session.getAttribute("loginUser"))){
					// 비밀글인데 작성자가 동일해
					readYN = "yes";
				}else{
					readYN = "no";
				}
			}
			return readYN;
		}
	
}