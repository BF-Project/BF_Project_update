package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.QnADao;
import com.pro.bf.daoImpl.QnADaoImpl;
import com.pro.bf.dto.MbrVO;
import com.pro.bf.dto.QnAVO;
import com.pro.bf.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	QnADaoImpl qnaDaoImpl;
		
	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 게시글 개수
	
	public void setQnaDaoImpl(QnADaoImpl qnaDaoImpl) {
		this.qnaDaoImpl = qnaDaoImpl;
	}

	@Override
	public ArrayList<QnAVO> getQnaList(int tpage,String search) throws SQLException {
		ArrayList<QnAVO> qnaList = qnaDaoImpl.listAllQna(tpage,search);
		return qnaList;
	}

	//조회수
	@Override
	public QnAVO getQnaDetail(String qna_num) throws SQLException {
		QnAVO qnaVO = qnaDaoImpl.getQna(Integer.parseInt(qna_num));
		return qnaVO;
	}

	//수정
	@Override
	public int updateQna(QnAVO qnaVO) throws SQLException {
		int result = qnaDaoImpl.updateQna(qnaVO);
		return result;
	}
	
	//등록
	@Override
	public void insertQna(QnAVO qnaVO) throws SQLException {
		qnaDaoImpl.insertQna(qnaVO);
	
	}

	//삭제
	@Override
	public void deleteQna(int qna_num) throws SQLException {		qnaDaoImpl.deleteQna(qna_num);		
	
	}
	
	@Override
	public int countQna(QnAVO qnaVO) throws SQLException {
		qnaDaoImpl.countQna(qnaVO);
		return 0;
	}
		
	@Override
	public ArrayList<QnAVO> listAllQna(int tpage,String search) throws SQLException {
				
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
		int startRow = -1;
		int endRow = -1;
		
		int totalRecord = qnaDaoImpl.totalQna(search);//qna전체개수
		
		startRow = (tpage - 1) * counts ;// 초기값 0 --> 현재 몇페이지인지에 대해 제일 먼저 시작하는 qna 글
		endRow = startRow + counts - 1; // 9 --> 현재 몇페이지인지에 대해 제일 끝에 있는 qna 글
		if (endRow > totalRecord)
			endRow = totalRecord;
		
		ArrayList<QnAVO> qnaList=qnaDaoImpl.listAllQna(tpage, search);
		return qnaList;
	}	
	//전체개수<검색어로>
	public int totalQna(String search) throws SQLException {
		int total_pages = 0; //qna전체개수
		total_pages = qnaDaoImpl.totalQna(search);
		return total_pages;
	}
	
	@Override
	public String pageNumber(int tpage,String search) throws SQLException {
		String str = "";
		int total_pages = qnaDaoImpl.totalQna(search);//qna전체개수
		int page_count = total_pages / counts + 1;//페이지개수
		
		if(total_pages % counts == 0) {
			page_count--;
		}
		
		if(tpage < 1) {
			tpage = 1;
		}
		
		int start_page = tpage - (tpage % view_rows) + 1;
		
		for(int i=page_count; i>=1; i--){
			if(tpage % 5 == 0){
				int a = tpage / 5;
				if(a==1){
					start_page = 1;
				}else{
					start_page = a + (4*(a-1));
				}
			}
		}
		
		int end_page = start_page + (counts - 1);
		
		if(end_page > page_count) {
			end_page = page_count;
		}
		
		if(start_page > view_rows) {
			str += "<a href='qnaList?tpage=1&search="+search+"'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='qnaList?tpage=" + (start_page - 1)+"&search=" +search+ "'>&lt;</a>&nbsp;&nbsp;";
		}
		
		for(int i = start_page; i <= end_page; i++) {
			if(i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>"; 
			} else {
				str += "<a href='qnaList?tpage=" + i +"&search="+search+"'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}
		
		if(page_count > end_page) {
			str += "<a href='qnaList?tpage=" + (end_page + 1)
					+"&search="+search+"'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='qnaList?tpage=" + page_count
					+"&search="+search+"'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		
		return str;
	}


	@Override
	public QnAVO SearchQnaVo(int qna_num) throws SQLException {
		QnAVO qnaVo = qnaDaoImpl.SearchQnaVo(qna_num);
		return qnaVo;
	}

	@Override
	public ArrayList<QnAVO> getQnaList(String mbr_id) throws SQLException {
		ArrayList<QnAVO> qnaList = null;
		try {
			qnaList = qnaDaoImpl.listQna(mbr_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnaList;
	}

	@Override
	public QnAVO getQnaVO(int qna_num) throws SQLException {
		QnAVO qnaVO = new QnAVO();
		try {
			qnaVO = qnaDaoImpl.getQna(qna_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnaVO;
	}

	@Override
	public ArrayList<QnAVO> QnAList(int page, String search, String selectCombo) throws SQLException { // 관리자 쪽 QnA 리스트 새로만든 메서드
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
		
		int startRow = -1; // 
		int endRow = -1; // 
		int totalRecord = totalRecord(search, selectCombo); // QnA 전체 개수
		
		startRow = (page-1) * counts2; // 초기값 0 --> 현재 몇페이지인지에 대해 제일 먼저 시작하는 공지사항 글
		endRow = startRow + counts2 - 1; // 9 --> 현재 몇페이지인지에 대해 제일 끝에 있는 공지사항 글
		if(endRow > totalRecord)
			endRow = totalRecord;
		
		// Admin 회원관리 페이지 콤보박스에서 Name, Id, Phone 선택한 것에 대한 memberList가 달라진다.
		ArrayList<QnAVO> qnaList = null;
		if(selectCombo.equals("Title")){
			qnaList = qnaDaoImpl.qnaListforTitle(search, startRow, counts2); // Title로 검색한다.
		}else if(selectCombo.equals("ID")){
			qnaList = qnaDaoImpl.qnaListforId(search, startRow, counts2); // ID로 검색한다.
		}else if(selectCombo.equals("NOMAL")){
			qnaList = qnaDaoImpl.qnaListforRespond(search, startRow, counts2); // 
		}
		
		return qnaList;
	}
	
	public int totalRecord(String search, String selectCombo) throws SQLException{ // Qna 전체 개수<검색어>
		int total_pages = 0; // 전체 개수 초기값
		if(selectCombo.equals("Title")){
			total_pages = qnaDaoImpl.totalRecordforTitle(search);
		}else if(selectCombo.equals("ID")){
			total_pages = qnaDaoImpl.totalRecordforID(search);
		}else if(selectCombo.equals("NOMAL")){
			total_pages = qnaDaoImpl.totalRecordforRespond(search);
		}
		
		return total_pages;
	}
	
	static int counts2 = 15; // 페이지 내의 회원리스트 개수
	static int view_rows2 = 5; // 페이지 개수
	@Override
	public String pageNumber(int page, String search, String currentPage, String selectCombo) throws SQLException { // 관리자쪽 새로 만든 메서드
		String str = "";
		int total_pages = totalRecord(search, selectCombo); // 회원 전체 개수
		int page_count = total_pages / counts2 + 1; // 페이지 개수
		
		if(total_pages % counts2 == 0){
			page_count--;
		}
		if(page < 1){
			page = 1;
		}
		int start_page = page - (page % view_rows2) + 1;
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
		int end_page = start_page + (view_rows2 - 1);
		
		if(end_page > page_count){
			end_page = page_count;
		}
		
		if(start_page > view_rows2){
			str += "<a href='"+currentPage+"?page=1&search="+search+"&comboSelectQnA="+selectCombo+"'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+(start_page-1)+"&search=" + search + "&comboSelectQnA="+selectCombo+"'>&lt;</a>&nbsp;&nbsp;";			
		}
		
		for(int i = start_page; i<=end_page; i++){
			if(i==page){
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			}else{
				str += "<a href='"+currentPage+"?page="+i+"&search="+search+"&comboSelectQnA="+selectCombo+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
		}
		if(page_count > end_page){
			str += "<a href='"+currentPage+"?page="+(end_page+1)+"&search=" + search + "&comboSelectQnA="+selectCombo+"'>&gt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+page_count+"&search="+search+"&comboSelectQnA="+selectCombo+"'>&gt;&gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	@Override
	public void qnaRespondUpdate(int qna_num, String qna_respond) throws SQLException {
		qnaDaoImpl.qnaRespondUpdate(qna_num, qna_respond);
	}
	
	//파일다운로드
	@Override
	public String qnaFileNameSearch(int qna_num) throws SQLException {
		String fileName=qnaDaoImpl.qnaFileNameSearch(qna_num);
		return fileName;
	}

	@Override
	public int countQnaRespond() throws SQLException {
		
		return qnaDaoImpl.countQnaRespond();
		
	}
}