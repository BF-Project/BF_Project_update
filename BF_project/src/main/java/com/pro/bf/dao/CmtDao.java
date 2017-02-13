package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pro.bf.dto.CmtVO;

public interface CmtDao {

	public List<CmtVO> cmtAllList(int cmt_num) throws SQLException;

	public void intsertCmt(CmtVO cmtVO) throws SQLException;

	
	public void updateCmt(CmtVO cmtVO) throws SQLException;
	
	
	//댓글삭제
	public int deleteCmt(int cmt_num)throws SQLException;
	//댓글 리스트 (게시글번호)
	public List<CmtVO> cmtListAn(int cmt_num)throws SQLException;
}
