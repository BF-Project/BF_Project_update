package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.CommunityDao;
import com.pro.bf.dao.QnADao;
import com.pro.bf.daoImpl.CommunityDaoImpl;
import com.pro.bf.daoImpl.QnADaoImpl;
import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.QnAVO;
import com.pro.bf.service.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	CommunityDaoImpl cmmtDAO;
	public void setCmmtDaoImpl(CommunityDaoImpl cmmtDAO) {
		this.cmmtDAO = cmmtDAO;
	}
	
	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 게시글 개수
	
	

	@Override
	public ArrayList<CommunityVO> getCmmtList(int tpage,String search) throws SQLException {
		ArrayList<CommunityVO> cmmtList=cmmtDAO.listAllCmmt(tpage,search);
		return cmmtList;
	}

		
	@Override
	public CommunityVO getCmmtDetail(String cmmt_num) throws SQLException {
		CommunityVO cmmtVO=cmmtDAO.getCmmt(Integer.parseInt(cmmt_num));
		
		return cmmtVO;
	}

	@Override
	public void insertCmmt(CommunityVO cmmtVO) throws SQLException {
		cmmtDAO.insertCmmt(cmmtVO);
	}

	@Override
	public int updateCmmt(CommunityVO cmmtVO) throws SQLException {
		int result=cmmtDAO.updateCmmt(cmmtVO);
		return result;
	}

	@Override
	public void countCmmt(int cmmt_num) throws SQLException {
		cmmtDAO.countCmmt(cmmt_num);
	}

	@Override
	public String pageNumber(int tpage,String search) throws SQLException {
		String str="";
		int page_count =0;
		int total_pages=cmmtDAO.totalCmmt(search);
		page_count = total_pages / counts + 1;
		
		if(total_pages % counts == 0) {
			page_count--;
		}
		
		if(tpage < 1) {
			tpage = 1;
		}
		
		int start_page = tpage - (tpage % view_rows) + 1;
		
		for(int i=page_count; i>=1; i--){
			if(tpage % 5 == 0){
				int a = tpage / 5;
				if(a==1){
					start_page = 1;
				}else{
					start_page = a + (4*(a-1));
				}
			}
		}
		
		int end_page = start_page + (view_rows - 1);
				
		if(end_page > page_count) {
			end_page = page_count;
		}
		
		//등록한글이 10개가 넘으면
		if(start_page > view_rows) {
			str += "<a href='cmmtList?tpage=1&search="+search+"'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='cmmtList?tpage="+(start_page-1)+"&search=" +search+ "'>&lt;</a>&nbsp;&nbsp;";
		}
		
		for(int i = start_page; i <= end_page; i++) {
			if(i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>"; 
			} else {
				str += "<a href='cmmtList?tpage=" +i+"&search="+search+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
		}
		
		if(page_count > end_page) {
			str += "<a href='cmmtList?tpage=" + (end_page + 1)
					+"&search="+search+"'> &gt;</a>&nbsp;&nbsp;";
			str += "<a href='cmmtList?tpage=" + page_count
					+"&search="+search+"'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		
		return str;
	}

	
	
	
	@Override
	public ArrayList<CommunityVO> getCmmtList(String mbr_id,String admin_id) throws SQLException {
		ArrayList<CommunityVO> cmmtList = null;
		try {
			cmmtList = cmmtDAO.getCmmtList(mbr_id,admin_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmmtList;
	}
	@Override
	public CommunityVO getCmmtVO(int cmmt_num) throws SQLException {
		CommunityVO cmmtVO = new CommunityVO();
		try {
			cmmtVO = cmmtDAO.getCmmtVO(cmmt_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmmtVO;
	}
	

	@Override
	public void deleteCmmt(int cmmt_num) throws SQLException {
		cmmtDAO.deleteCmmt(cmmt_num);
		
	}

	@Override
	public ArrayList<CommunityVO> listAllCmmt(int tpage, String search)
			throws SQLException {
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
	
		int startRow = -1;
		int endRow = -1;
		
		int totalRecord = cmmtDAO.totalCmmt(search);
		
		startRow = (tpage - 1) * counts ; //10
		endRow = startRow + counts - 1; // 19
		if (endRow > totalRecord) // 19>16
			endRow = totalRecord; // 16
		
		ArrayList<CommunityVO> cmmtList=cmmtDAO.listAllCmmt(tpage, search);
		return cmmtList;
		
		
	}

	//파일 다운로드
	@Override
	public String cmmtFileNameSearch(int cmmt_num) throws SQLException {
		String fileName=cmmtDAO.cmmtFileNameSearch(cmmt_num);
		return fileName;
	}

	///////////////////////////////////////////////////////////////////////////////////////////
	
	static int counts2 = 15; // 한 페이지에 나타낼 게시글 개수
	static int view_rows2 = 5; // 페이지의 개수
	
	@Override
	public ArrayList<CommunityVO> communityList(int page, String search, String selectCombo) throws SQLException {
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
		
		int startRow = -1; 
		int endRow = -1; 
		int totalRecord = totalRecord(search, selectCombo); // 커뮤니티게시글 전체 개수 | selectCombo --> 선택한 것으로
		
		startRow = (page-1) * counts2; 
		endRow = startRow + counts2 - 1;  
		if(endRow > totalRecord)
			endRow = totalRecord;
				
		ArrayList<CommunityVO> communityList = null;
		if(selectCombo.equals("first")){ // 초기값
			communityList = cmmtDAO.communityListForFirst(search, startRow, counts2); // Title로 검색한다.
		}else if(selectCombo.equals("ID")){
			communityList = cmmtDAO.communityListForIDIDID(search, startRow, counts2); // mbr_id로 검색한다.
		}
		
		return communityList;
	}

	public int totalRecord(String search, String selectCombo) throws SQLException{
		int total_pages = 0; // 개수 초기값
		if(selectCombo.equals("first")){ // first ==> 초기값
			total_pages = cmmtDAO.totalCommunityList(search); // 제목으로 찾으나..order by는 num으로 
		}else if(selectCombo.equals("ID")){
			total_pages = cmmtDAO.communityListforID(search);
		}
		return total_pages;
	}

	@Override
	public String pageNumber2(int page, String search, String currentPage, String selectCombo) throws SQLException {
		String str = "";
		int total_pages = totalRecord(search, selectCombo); // 커뮤니티 전체 개수
		int page_count = total_pages / counts2 + 1; // 페이지 개수
		
		if(total_pages % counts2 == 0){
			page_count--;
		}
		if(page < 1){
			page = 1;
		}
		int start_page = page - (page % view_rows2) + 1;
		for(int i=page_count; i>=1; i--){
			if(page % 5 == 0){
				int a = page / 5;
				if(a==1){
					start_page = 1;
				}else{
					start_page = a + (4*(a-1));
				}
			}
		}
		int end_page = start_page + (view_rows2 - 1);
		
		if(end_page > page_count){
			end_page = page_count;
		}
		
		if(start_page > view_rows2){
			str += "<a href='"+currentPage+"?page=1&search="+search+"&comboSelectCommunity="+selectCombo+"'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+(start_page-1)+"&search=" + search + "&comboSelectCommunity="+selectCombo+"'>&lt;</a>&nbsp;&nbsp;";			
		}
		
		for(int i = start_page; i<=end_page; i++){
			if(i==page){
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			}else{
				str += "<a href='"+currentPage+"?page="+i+"&search="+search+"&comboSelectCommunity="+selectCombo+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
		}
		if(page_count > end_page){
			str += "<a href='"+currentPage+"?page="+(end_page+1)+"&search=" + search + "&comboSelectCommunity="+selectCombo+"'>&gt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+page_count+"&search="+search+"&comboSelectCommunity="+selectCombo+"'>&gt;&gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	
	public void plusView(int cmmtNum) throws SQLException{
		cmmtDAO.plusView(cmmtNum);
	}		
}