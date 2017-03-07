package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.bf.dao.CommunityDao;
import com.pro.bf.dao.MbrDao;
import com.pro.bf.dao.QnADao;
import com.pro.bf.daoImpl.MbrDaoImpl;
import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.MbrVO;
import com.pro.bf.dto.NoticeVO;
import com.pro.bf.dto.QnAVO;
import com.pro.bf.service.MbrService;

@Service
public class MbrServiceImpl implements MbrService {

   @Autowired
   private MbrDaoImpl mbrDao;

   public void setMbrDAO(MbrDaoImpl mbrDao) {
      this.mbrDao = mbrDao;
   }

   @Autowired
   private QnADao qnaDAO;

   public void setQnaDAO(QnADao qnaDAO) {
      this.qnaDAO = qnaDAO;
   }

   @Autowired
   private CommunityDao cmmtDAO;
   
   public void setCmmtDAO(CommunityDao cmmtDAO) {
      this.cmmtDAO = cmmtDAO;
   }

   @Override
   public void insertMember(MbrVO mbrVo) throws SQLException { // 회원가입
      mbrDao.insertMember(mbrVo);
   }

   @Override
   public String idCheck(String idcheck) throws SQLException { // 아이디 중복확인
      String data = mbrDao.idCheck(idcheck);
      System.out.println("3 리턴받은 아이디 값(Service) " + data);
      return data;
   }

   @Override
   public String login(MbrVO mbrVo) throws SQLException { // 로그인
      String login = mbrDao.login(mbrVo);
      return login;
   }

   @Override
   public String searchUserName(String login) throws SQLException { // 로그인한 유저 / 이름 찾기
                                                      
      String loginUserName = mbrDao.searchUserName(login);
      return loginUserName;
   }

   @Override
   public String searchUserId(MbrVO mbrVo) throws SQLException { // 아이디 찾기
      String id = mbrDao.searchUserId(mbrVo);
      return id;
   }

   @Override
   public Map searchUserPwd(MbrVO mbrVo) throws SQLException { // 비밀번호 찾기 /
                                                // 이메일도 같이 찾아야함
      MbrVO result = mbrDao.searchUserPwd(mbrVo);
      Map<String, Object> searchMap = new HashMap<String, Object>();
      try {
         String pwd = result.getMbr_pwd();
         String email = result.getMbr_eml();
         searchMap.put("pwd", pwd);
         searchMap.put("email", email);
      } catch (NullPointerException e) {
         searchMap.put("pwd", "not Information");
      }
      return searchMap;
   }

   @Override
   public ArrayList<QnAVO> getQnaList(String mbr_id) throws SQLException {
      ArrayList<QnAVO> qnaList = null;
      try {
         qnaList = qnaDAO.listQna(mbr_id);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return qnaList;
   }

   @Override
   public QnAVO getQnaVO(int qna_num) throws SQLException {
      QnAVO qnaVO = new QnAVO();
      try {
         qnaVO = qnaDAO.getQna(qna_num);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return qnaVO;
   }

   @Override
   public void insertQna(QnAVO qnaVO) throws SQLException {
      try {
         qnaDAO.insertQna(qnaVO);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   
   static int counts = 15; // 페이지 내의 회원리스트 개수
   static int view_rows = 5; // 페이지 개수
   @Override
   public ArrayList<MbrVO> memberList(int page, String search, String selectCombo)   throws SQLException { // 회원 리스트
      if(search.equals("")){ // 검색어가 없을경우
         search = "%";
      }
      int startRow = -1; // 
      int endRow = -1; // 
      int totalRecord = totalRecord(search, selectCombo); // 공지사항 전체 개수
      
      startRow = (page-1) * counts; // 초기값 0 --> 현재 몇페이지인지에 대해 제일 먼저 시작하는 공지사항 글
      endRow = startRow + counts - 1; // 9 --> 현재 몇페이지인지에 대해 제일 끝에 있는 공지사항 글
      if(endRow > totalRecord)
         endRow = totalRecord;
      
      // Admin 회원관리 페이지 콤보박스에서 Name, Id, Phone 선택한 것에 대한 memberList가 달라진다.
      ArrayList<MbrVO> memberList = null;
      if(selectCombo.equals("ID")){
         memberList = mbrDao.memberListforId(search, startRow, counts); // ID로 검색한다.
      }else if(selectCombo.equals("PHONE")){
         memberList = mbrDao.memberListforPhone(search, startRow, counts); // 핸드폰번호로 검색한다.
      }else if(selectCombo.equals("NAME")){
         memberList = mbrDao.memberList(search, startRow, counts); // 기본으로 Name으로 검색한다.
      }
      return memberList;
   }
   
   // 회원 전체 개수<검색어로>
   public int totalRecord(String search, String selectCombo) throws SQLException{
      int total_pages = 0; // 회원 전체 개수
      if(selectCombo.equals("ID")){
         total_pages = mbrDao.totalRecordforId(search);
      }else if(selectCombo.equals("PHONE")){
         total_pages = mbrDao.totalRecordforPhone(search);
      }else if(selectCombo.endsWith("NAME")){
         total_pages = mbrDao.totalRecord(search); // 기본적으로 NAME으로 검색한다.
      }
      return total_pages;
   }

   @Override
   public String pageNumber(int page, String search, String currentPage, String selectCombo) throws SQLException {
      String str = "";
      int total_pages = totalRecord(search, selectCombo); // 회원 전체 개수
      int page_count = total_pages / counts + 1; // 페이지 개수
      
      if(total_pages % counts == 0){
         page_count--;
      }
      if(page < 1){
         page = 1;
      }
      int start_page = page - (page % view_rows) + 1;
      for(int i=page_count; i>=1; i--){
         if(page % 5 == 0){
            int a = page / 5;
            if(a==1){
               start_page = 1;
            }else{
               start_page = a + (4*(a-1));
            }
         }
      }
      int end_page = start_page + (view_rows - 1);
      
      if(end_page > page_count){
         end_page = page_count;
      }
      
      if(start_page > view_rows){
         str += "<a href='"+currentPage+"?page=1&search="+search+"&comboSelectMember="+selectCombo+"'>&lt;&lt;</a>&nbsp;&nbsp;";
         str += "<a href='"+currentPage+"?page="+(start_page-1)+"&search=" + search + "&comboSelectMember="+selectCombo+"'>&lt;</a>&nbsp;&nbsp;";         
      }
      
      for(int i = start_page; i<=end_page; i++){
         if(i==page){
            str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
         }else{
            str += "<a href='"+currentPage+"?page="+i+"&search="+search+"&comboSelectMember="+selectCombo+"'>["+i+"]</a>&nbsp;&nbsp;";
         }
      }
      
      if(page_count > end_page){
         str += "<a href='"+currentPage+"?page="+(end_page+1)+"&search=" + search + "&comboSelectMember="+selectCombo+"'>&gt;</a>&nbsp;&nbsp;";
         str += "<a href='"+currentPage+"?page="+page_count+"&search="+search+"&comboSelectMember="+selectCombo+"'>&gt;&gt; </a>&nbsp;&nbsp;";
      }

      return str;
   }

   @Override
   public void deleteMember(String mbr_id) throws SQLException { // 회원 삭제하기
      mbrDao.deleteMember(mbr_id);
   }

   @Override
   public String loginUseYNCheck(String login) throws SQLException {
//      로그인 한 아이디의 use_yn을 확인하고 n일경우 String login의 값을 null 처리한다.
      String loginIdUseynChek = mbrDao.loginIdUseYnCheck(login);       
      return loginIdUseynChek;
   }

   @Override
   public void reuseMember(String memberId) throws SQLException { // 회원 다시 사용가능으로 만들기
      mbrDao.reuseMember(memberId);
   }

   @Override
   public ArrayList<MbrVO> memberListForUseyn(String choiceUseYNT)   throws SQLException { // UseYN 으로 회원리스트 받아오기
      ArrayList<MbrVO> memberListUse = mbrDao.memberListForUseyn(choiceUseYNT);
      return memberListUse;
   }

   @Override
   public MbrVO MemberVoSearch(String memberId) throws SQLException { // 아이디로 회원정보 가져오기 | 상세보기
      MbrVO memberVo = mbrDao.MemberVoSearch(memberId);
      return memberVo;
   }

   @Override
   public void memberUpdate(MbrVO mbrvo) throws SQLException { // 관리자가 회원정보 수정하기
      // 관리자가 수정할 수 있는 회원의 정보는  pw | name | phone | email | address  5개만  | id는 key값으로 사용
      mbrDao.memberUpdate(mbrvo);
   }

   @Override
   public String memberListCount() throws SQLException {
      String memberUseYCount = mbrDao.memberListCount();
      return memberUseYCount;
   }

@Override
public int totalMbr(String search) throws SQLException {
	return mbrDao.totalRecord(search);
}

@Override
public int countForDate(Date date) throws SQLException {
	String dd = (date.getYear()-100)+"/"+(date.getMonth()+1)+"/"+date.getDate();
	return mbrDao.countForDate(dd);
}
   
}