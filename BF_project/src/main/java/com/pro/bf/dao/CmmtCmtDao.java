package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

import com.pro.bf.dto.CmmtCmtVO;


public interface CmmtCmtDao {

	public List<CmmtCmtVO> cmmtcmtAllList(int cmmtcmt_num) throws SQLException;
	public void intsertCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException;
	
	//댓글 삭제
	public int deleteCmmtcmt(int cmmtcmt_num)throws SQLException;
	//댓글 리스트 (게시글번호)
	public List<CmmtCmtVO> cmmtcmtListAn(int cmmtcmt_num)throws SQLException;
	//댓글 수정
	public void updateCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException;
}
