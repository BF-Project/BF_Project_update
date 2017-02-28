package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.CmtDao;
import com.pro.bf.dto.CmtVO;

public class CmtDaoImpl implements CmtDao {

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<CmtVO> cmtAllList(int cmt_num) throws SQLException {
		List<CmtVO> cmtAllList = client.queryForList("cmtAllList", cmt_num);
		return cmtAllList;
	}

	@Override
	public void intsertCmt(CmtVO cmtVO) throws SQLException {
		client.insert("insertCmt", cmtVO);
	}
	
	public void adminInsertCmt(CmtVO cmtVO) throws SQLException{
		client.insert("insertCmtAdmin", cmtVO);
	}
	
	@Override
	public void updateCmt(CmtVO cmtVO) throws SQLException {
		client.update("updateCmt", cmtVO);
	}

	//댓글 삭제
	@Override
	public int deleteCmt(int cmt_num) throws SQLException {
		int result=client.delete("deleteCmt", cmt_num);
		return result;
	}

	//댓글 리스트
	@Override
	public List<CmtVO> cmtListAn(int cmt_num) throws SQLException {
		List<CmtVO> cmtList = client.queryForList("cmtListAn", cmt_num);
		return cmtList;
	}

	@Override
	public String cmtContentSearch(int result) throws SQLException {
		String cmtContent = (String) client.queryForObject("cmtContentSearch", result);
		return cmtContent;
	}
	
	public void cmtContentUpdate(CmtVO cmtVo) throws SQLException{
		client.update("cmtContentUpdate", cmtVo);
	}
}