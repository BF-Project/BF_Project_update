package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.NoticeVO;

public interface NoticeService {

	ArrayList<NoticeVO> noticeList(int page, String search) throws SQLException;
	
	String pageNumber(int page, String search, String currentPage) throws SQLException;
	
	void insertNotice(NoticeVO noticeVo) throws SQLException;
	
	NoticeVO noticeDetail(int noticeNum) throws SQLException;
	
	void noticeDelete(int noticeNum) throws SQLException;
	
	String noticeFileNameSearch(int noticeNum) throws SQLException;
	
	NoticeVO noticeUpdate(int noticeNum) throws SQLException;
	
	void noticeRealUpdate(NoticeVO noticeVo) throws SQLException;
}
