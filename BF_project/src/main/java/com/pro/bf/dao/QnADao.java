package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.QnAVO;

public interface QnADao {

	public ArrayList<QnAVO> listQna(String mbr_id) throws SQLException; // Q&A 리스트

	public ArrayList<QnAVO> listAllQna(int tpage,String search) throws SQLException; // Q&A ALL 리스트

	public QnAVO getQna(int qna_num) throws SQLException;

	public void insertQna(QnAVO qnaVO) throws SQLException; // 등록

	public int updateQna(QnAVO qnaVO) throws SQLException; // 수정
	
	public int countQna(QnAVO qnaVO) throws SQLException; // 조회수

	public int totalQna(String search) throws SQLException;//검색

	public void deleteQna(int qna_num)throws SQLException;//delete

	QnAVO SearchQnaVo(int qna_num) throws SQLException;//비밀글
}
