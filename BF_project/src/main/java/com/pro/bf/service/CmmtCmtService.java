package com.pro.bf.service;

import java.sql.SQLException;
import java.util.List;

import com.pro.bf.dto.CmmtCmtVO;

public interface CmmtCmtService {

	
	public List<CmmtCmtVO> cmmtcmtAllList(int cmmtcmt_num) throws SQLException;
	//댓글추가
	public void intsertCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException;
	//댓글삭제
	public int deleteCmmtcmt(int cmmtcmt_num) throws SQLException;
	//댓글리스트
	public List<CmmtCmtVO> cmmtcmtListAn(int cmmtcmt_num) throws SQLException;
	//댓글수정
	public void updateCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException;
}
