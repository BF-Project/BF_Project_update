package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.QnAVO;

public interface QnAService {

	public ArrayList<QnAVO> getQnaList(int tpage,String search) throws SQLException; // Q&A

	public QnAVO getQnaDetail(String qna_num) throws SQLException; // 상세보기

	public void insertQna(QnAVO qnaVO) throws SQLException;//등록

	public int updateQna(QnAVO qnaVO) throws SQLException; // 답글수정

	public void deleteQna(int qna_num)throws SQLException;//delete
	
	public int countQna(QnAVO qnaVO) throws SQLException; // 조회수

	public String pageNumber(int tpage,String search) throws SQLException;
	
	QnAVO SearchQnaVo(int qna_num) throws SQLException;//비밀글
 		
	public ArrayList<QnAVO> getQnaList(String mbr_id) throws SQLException;//리스트

	public QnAVO getQnaVO(int qna_num) throws SQLException;

	public ArrayList<QnAVO> listAllQna(int tpage,String search) throws SQLException; // Q&A ALL 리스트
	
	//파일다운로드 하기위한 Service에 메소드 추가
	String qnaFileNameSearch(int qna_num)throws SQLException;
}
