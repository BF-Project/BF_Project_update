package com.pro.bf.daoImpl;


import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.CommunityDao;
import com.pro.bf.dto.CommunityVO;

public class CommunityDaoImpl implements CommunityDao{

	private SqlMapClient client;
	
	static int vire_rows=10;//페이지의 개수
	
	static int counts=10;//한페이지에 나타낼 게시글 개수
	
	
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public ArrayList<CommunityVO> listCmmt(String mbr_id, String admin_id)
			throws SQLException {
		ArrayList<CommunityVO>cmmtList=new ArrayList<CommunityVO>();
		cmmtList=(ArrayList<CommunityVO>)client.queryForObject("listCmmt", mbr_id, admin_id);
		return cmmtList;
	}
	@Override
	public ArrayList<CommunityVO> listAllCmmt(int tpage,String search) throws SQLException {
		
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
	
		int startRow = -1;
		int endRow = -1;
		
		int totalRecord = totalCmmt(search);
		
		startRow = (tpage - 1) * counts ; //10
		endRow = startRow + counts - 1; // 19
		if (endRow > totalRecord) // 19>16
			endRow = totalRecord; // 16
		
		ArrayList<CommunityVO> cmmtList = (ArrayList<CommunityVO>)client.queryForList("listAllCmmt", search, startRow, counts);
		
		return cmmtList;
	}
	@Override
	public CommunityVO getCmmt(int cmmt_num) throws SQLException {
		CommunityVO cmmtVO = (CommunityVO) client.queryForObject("getCmmt", cmmt_num);
		return cmmtVO;
	}
	@Override
	public void insertCmmt(CommunityVO cmmtVO) throws SQLException {
	
		client.insert("insertCmmt", cmmtVO);
	}
	@Override
	public int updateCmmt(CommunityVO cmmtVO) throws SQLException {
		int result = client.update("updateCmmt", cmmtVO);
		return result;
	
	}
	@Override
	public void countCmmt(int cmmt_num) throws SQLException { // 조회수 맞어?
		client.update("countCmmt", cmmt_num);
	}
	@Override
	public int totalCmmt(String search) throws SQLException {
		int total_pages = 0;
		total_pages =(Integer) client.queryForObject("totalCmmt", search);
		return total_pages;

	}
	@Override
	public void deleteCmmt(int cmmt_num) throws SQLException {
		client.delete("deleteCmmt",cmmt_num);		
		
	}

	@Override
	public ArrayList<CommunityVO> getCmmtList(String mbr_id, String admin_id)
			throws SQLException {
		ArrayList<CommunityVO> cmmtList = null;
		cmmtList = (ArrayList<CommunityVO>) client.queryForList(mbr_id, admin_id);
		return cmmtList;
	}

	@Override
	public CommunityVO getCmmtVO(int cmmt_num) throws SQLException {
		CommunityVO cmmtVO = new CommunityVO();
		cmmtVO = (CommunityVO) client.queryForObject("getCmmt",cmmt_num);
		return cmmtVO;
	}

	@Override
	public String cmmtFileNameSearch(int cmmt_num) throws SQLException {
		String fileName=(String) client.queryForObject("cmmtFileNameSearch", cmmt_num);
		return fileName;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public int totalCommunityList(String search) throws SQLException {
		int total_pages = (int) client.queryForObject("TotalCommunityList", search);
		return total_pages;
	}

	@Override
	public ArrayList<CommunityVO> communityListForFirst(String search, int startRow, int counts2) throws SQLException {
		ArrayList<CommunityVO> communityList = (ArrayList<CommunityVO>) client.queryForList("communityListForTitle", search, startRow, counts2);
		return communityList;
	}

	@Override
	public int communityListforID(String search) throws SQLException {
		int total_pages = (int) client.queryForObject("communityListforID", search);
		return total_pages;
	}

	@Override
	public ArrayList<CommunityVO> communityListForIDIDID(String search,	int startRow, int counts2) throws SQLException {
		ArrayList<CommunityVO> communityList = (ArrayList<CommunityVO>) client.queryForList("communityListForIDIDID", search, startRow, counts2);
		return communityList;
	}

	
	
}
