package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.CmmtCmtDao;
import com.pro.bf.dto.CmmtCmtVO;

public class CmmtCmtDaoImpl implements CmmtCmtDao  {

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public List<CmmtCmtVO> cmmtcmtAllList(int cmmtcmt_num) throws SQLException {
		List<CmmtCmtVO> cmmtcmtAllList=client.queryForList("cmmtcmtAllList", cmmtcmt_num);
		return cmmtcmtAllList;
	}
	
	//댓글추가
	@Override
	public void intsertCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException {
		client.insert("intsertCmmtcmt", cmmtcmtVO);
	}
	
	//댓글삭제
	@Override
	public int deleteCmmtcmt(int cmmtcmt_num) throws SQLException {
		int result=client.delete("deleteCmmtcmt", cmmtcmt_num);
		return result;
	}

	//댓글리스트
	@Override
	public List<CmmtCmtVO> cmmtcmtListAn(int cmmtcmt_num) throws SQLException {
			List<CmmtCmtVO> cmmtcmtList1=client.queryForList("cmmtcmtListAn", cmmtcmt_num);
		return cmmtcmtList1;
	}

	//댓글수정
	@Override
	public void updateCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException {
//		public void updateCmmtcmt(int cmmtcmt_num) throws SQLException {
		client.update("updateCmmtcmt", cmmtcmtVO);
		//client.update("updateCmmtcmt", cmmtcmt_num);
	}

	@Override
	public void insertCmmtcmtAdmin(CmmtCmtVO cmmtcmtVO) throws SQLException { /// 관리자 댓글 등록
		client.insert("insertCmmtcmtAdmin", cmmtcmtVO);
	}

}
