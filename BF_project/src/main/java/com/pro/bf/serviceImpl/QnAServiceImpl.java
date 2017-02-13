package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.QnADao;
import com.pro.bf.daoImpl.QnADaoImpl;
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
}
