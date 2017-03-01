package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pro.bf.dto.CmtVO;

public interface CmtService {

	public List<CmtVO> cmtAllList(int cmt_num) throws SQLException;

	public void insertCmt(CmtVO cmtVO) throws SQLException;
	
	public void updateCmt(CmtVO cmtVO) throws SQLException;

	//댓글삭제
	public int deleteCmt(int cmt_num) throws SQLException;
	public List<CmtVO> cmtListAn(int cmt_num) throws SQLException;
	String searchContent(int result) throws SQLException;
}

