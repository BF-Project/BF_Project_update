package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.FreeDao;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.dto.QnAVO;

public class FreeDaoImpl implements FreeDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 게시글 개수
	
	@Override
	public ArrayList<FreeVO> listAllFree(int tpage) throws SQLException {
		
		int startRow = -1;
		int endRow = -1;
		int totalRecord = totalFree();
		
		startRow = (tpage - 1) * counts ;
		endRow = startRow + counts - 1;
		if (endRow > totalRecord)
			endRow = totalRecord;

		ArrayList<FreeVO> freeVO = (ArrayList<FreeVO>) client.queryForList("listAllFree", null, startRow, counts);
		
		return freeVO;
	}
	@Override
	public ArrayList<FreeVO> freeList(String mbr_id) throws SQLException {
		ArrayList<FreeVO> freeList = (ArrayList<FreeVO>) client.queryForList("freeList", mbr_id);		
		return freeList;
	}
	@Override
	public void insertFree(FreeVO freeVO) throws SQLException {
		client.insert("insertFree", freeVO);
		
	}
	@Override
	public FreeVO getFree(int fre_num) throws SQLException {
		FreeVO freeVO = (FreeVO) client.queryForObject("getFree", fre_num);
		return freeVO;
	}
	@Override
	public void deleteFree(int fre_num) throws SQLException {
		client.delete("deleteFree", fre_num);
	}
	@Override
	public int updateFree(FreeVO freeVO) throws SQLException {
		int result = client.update("updateFree", freeVO);
		return result;
	}
	@Override
	public int countFree(FreeVO freeVO) throws SQLException {
		return client.update("countFree", freeVO);
		
	}
	@Override
	public int totalFree() throws SQLException {
		int total_pages = 0;
		total_pages = (Integer) client.queryForObject("totalFree", null);
		return total_pages;
	}
	@Override
	public ArrayList<FreeVO> freSearch(String fre_title) throws SQLException {
		ArrayList<FreeVO> freTitle = (ArrayList<FreeVO>)client.queryForList("fre_title", fre_title);
		return freTitle;
	}
	
}
