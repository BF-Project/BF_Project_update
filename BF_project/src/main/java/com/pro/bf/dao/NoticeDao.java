package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.NoticeVO;

public interface NoticeDao {

	ArrayList<NoticeVO> noticeList(String search, int startRow, int counts) throws SQLException;
	
	int totalRecord(String search) throws SQLException;
	
	void insertNotice(NoticeVO noticeVo) throws SQLException;
	
	NoticeVO noticeDetail(int noticeNum) throws SQLException;
	
	void noticeCountPlus(int noticeNum) throws SQLException;
	
	void noticeDelete(int noticeNum) throws SQLException;
	
	String noticeFileNameSearch(int noticeNum) throws SQLException;
	
	void noticeRealUpdate(NoticeVO noticeVo) throws SQLException;
}
