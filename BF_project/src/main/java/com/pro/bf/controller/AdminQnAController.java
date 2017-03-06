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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.daoImpl.QnADaoImpl;
import com.pro.bf.dto.QnAVO;
import com.pro.bf.serviceImpl.QnAServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminQnAController {

   @Autowired
   QnAServiceImpl qnaService;
   
   @Autowired
   QnADaoImpl qnaDao;
   
   @RequestMapping("QnAList")
   public String QnAList(HttpServletRequest request, Model model, HttpSession session) throws NumberFormatException, SQLException{
      //---------------- selectCombo ! 이것으로 어떤것을 검색해서 리스트를 받아올건지 결정함 | service에서 설정함
      String comboSelectQnA = request.getParameter("comboSelectQnA"); // 초기에 null
      String selectCombo = "";
      if(!(comboSelectQnA == null)&&!(comboSelectQnA.trim().equals(""))){
         if(comboSelectQnA.equals("comboTitle")||comboSelectQnA.equals("Title")){
            selectCombo = "Title";
         }else if(comboSelectQnA.equals("comboId")||comboSelectQnA.equals("ID")){
            selectCombo = "ID";
         }else if(comboSelectQnA.equals("NOMAL")){
            selectCombo = "NOMAL";
         }
      }else{
         selectCombo = "NOMAL";
      }            
      //----------------
      
      // QnA 리스트 or 검색
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
      String currentPage = "QnAList"; // 현재 PageUrl
      ArrayList<QnAVO> qnaList = null;
      qnaList = qnaService.QnAList(Integer.parseInt(page), search, selectCombo); // 회원 리스트(검색/검색안할때) | 기본 NAME 으로 검색
      paging = qnaService.pageNumber(Integer.parseInt(page), search, currentPage, selectCombo); // 페이징 | 기본은 Name 으로 검색함
      int qnaListSize = 0;
      if(!(qnaList.size()==0))
         qnaListSize = qnaList.size();
      request.setAttribute("qnaListSize", qnaListSize); // 회원 수
      request.setAttribute("qnaList", qnaList);
      request.setAttribute("paging", paging);
      
      return "/admin/qna/qnaList";
   }
   
   @RequestMapping("qnaDelete")
   @ResponseBody
   public String qnaDelete(String checkQnaNumValue, HttpSession session) throws NumberFormatException, SQLException{
      StringTokenizer strToken = new StringTokenizer(checkQnaNumValue,",");
      String[] qnaDelete = new String[15]; // 최대로 선택할 수 있는 개수 15개씩 삭제 가능
      int deleteCount = 0;
      for(int i=0; strToken.hasMoreTokens(); i++){
         qnaDelete[i] = strToken.nextToken();
         if(qnaDelete[i].contains("undefined")){
            qnaDelete[i] = qnaDelete[i].replace("undefined", "").trim();
         }
         // 이제 해당 qna의 num의 값만 출력됨 deleteQna[i] 로 삭제처리하면 됨 / 바로 dao 접근
         qnaDao.deleteQna(Integer.parseInt(qnaDelete[i]));
         deleteCount++;
      }
      session.setAttribute("deleteCount", deleteCount);
      return deleteCount+"";
   }
   
   /**
    * @param qnaNum : 해당 qna 번호(key)
    * @param page : 현재 page
    * @param comboSelectQnA : 선택한 콤보박스
    * @return
    * @throws SQLException 
    * @throws NumberFormatException 
    */
   @RequestMapping("detailQna")
   public String detailQna(String qnaNum, HttpServletRequest request) throws NumberFormatException, SQLException{ // String page, String comboSelectQnA
      // 정보가져오기
      QnAVO qnaVo = qnaDao.SearchQnaVo(Integer.parseInt(qnaNum));
      request.setAttribute("qnaVo", qnaVo);
      // 조회수 증가
      qnaDao.countQna(qnaVo);
      
      return "admin/qna/qnaDetailView"; // &qnaNum="+qnaNum+"&page="+page+"&comboSelectQnA="+comboSelectQnA
   }
   
   @RequestMapping("selectQnaDelete")
   public String selectQnaDelete(String page, String qnaNum, String comboSelectQnA, HttpServletRequest request) throws NumberFormatException, SQLException{
      // 삭제
      qnaDao.deleteQna(Integer.parseInt(qnaNum));
      request.getSession().setAttribute("selectQnADelete", "yes");
      return "redirect:/admin/QnAList?page="+page+"&comboSelectQnA="+comboSelectQnA;
   }
   
   @RequestMapping(value="QnaRespond", method=RequestMethod.POST)
   @ResponseBody
   public String QnaRespond(String qnaNumNum, String qnaRespond, HttpSession session) throws NumberFormatException, SQLException{
      System.out.println(qnaNumNum);
      System.out.println(qnaRespond);
      if(qnaRespond.equals("")||qnaRespond==null){
         return "no";
      }else{
         qnaService.qnaRespondUpdate(Integer.parseInt(qnaNumNum), qnaRespond);
         session.setAttribute("respondComplete", "yes");
         return "yes";
      }
   }
}