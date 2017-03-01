package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.bf.daoImpl.FreeDaoImpl;
import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.service.FreeService;

@Service
public class FreeServiceImpl implements FreeService {

	@Autowired
	FreeDaoImpl freeDaoImpl;

	public void setFreeDAO(FreeDaoImpl freeDaoImpl) {
		this.freeDaoImpl = freeDaoImpl;
	}

	static int view_rows = 10; // 페이지의 개수
	static int counts = 15; // 한 페이지에 나타낼 게시글 개수

	@Override
	public ArrayList<FreeVO> freeList(String mbr_id) throws SQLException {
		ArrayList<FreeVO> freeList = freeDaoImpl.freeList(mbr_id);
		return freeList;
	}

	@Override
	public ArrayList<FreeVO> getFreeList(int tpage) throws SQLException {
		ArrayList<FreeVO> freeList = freeDaoImpl.listAllFree(tpage);
		return freeList;
	}

	@Override
	public void insertFree(FreeVO freeVO) throws SQLException {
		freeDaoImpl.insertFree(freeVO);
	}

	@Override
	public FreeVO getFreeVO(int fre_num) throws SQLException {
		FreeVO freeVO = freeDaoImpl.getFree(fre_num);
		return freeVO;
	}

	@Override
	public FreeVO getFreeDetail(String fre_num) throws SQLException {
		FreeVO freeVO = freeDaoImpl.getFree(Integer.parseInt(fre_num));
		return freeVO;
	}

	@Override
	public int countFree(FreeVO freeVO) throws SQLException {
		return freeDaoImpl.countFree(freeVO);
	}

	@Override
	public String pageNumber(int tpage,String classify) throws SQLException {
		String str = "";
		int total_pages = 1;
		
		if(classify==null || classify.equals("")){
			total_pages = freeDaoImpl.totalFree();
		}else{
			total_pages = freeDaoImpl.freSearch(classify).size();
		}
		int page_count = total_pages / counts;

		if (total_pages % counts != 0) {
			page_count++;
		}
		
		/*int page = tpage;
		if(tpage % view_rows == 0) {
			page--;
		}*/
		
		if (tpage < 1) {
			tpage = 1;
		}

		int start_page = tpage - (tpage % view_rows) +1;
		int end_page = start_page + (counts - 1);

		if (end_page > page_count) {
			end_page = page_count;
		}

		if (start_page > view_rows) {
			str += "<a href='freeList?tpage=1'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='freeList?tpage=" + (start_page - 1);
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='freeList?tpage=" + i + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='freeList?tpage=" + (end_page + 1) + "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='freeList?tpage=" + page_count + "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}

		return str;
	}

	@Override
	public ArrayList<FreeVO> freSearch(String fre_title) throws SQLException {
		ArrayList<FreeVO> freTitle = freeDaoImpl.freSearch(fre_title);
		return freTitle;
	}

	@Override
	public String freeFileNameSearch(int fre_num) throws SQLException {
		String fileName=freeDaoImpl.freeFileNameSearch(fre_num);
		return fileName;
	}


	/////////////////////////////////////////////////////////////////////////////////////////// ADMIN
	static int counts2 = 15; // 한 페이지에 나타낼 게시글 개수
	static int view_rows2 = 5; // 페이지의 개수

	@Override
	public ArrayList<FreeVO> FreeList(int page, String search,	String selectCombo) throws SQLException {
		
		if(search.equals("")){ // 검색어가 없을경우
			search = "%";
		}
		
		int startRow = -1; 
		int endRow = -1; 
		int totalRecord = totalRecord(search, selectCombo); // 자유게시글 전체 개수 | selectCombo --> 선택한 것으로
		
		startRow = (page-1) * counts2; 
		endRow = startRow + counts2 - 1;  
		if(endRow > totalRecord)
			endRow = totalRecord;
				
		ArrayList<FreeVO> freeList = null;
		if(selectCombo.equals("first")){ // 초기값
			freeList = freeDaoImpl.freeListForFirst(search, startRow, counts2); // Title로 검색한다.
		}else if(selectCombo.equals("ID")){
			freeList = freeDaoImpl.freeListForIDIDID(search, startRow, counts2); // mbr_id로 검색한다.
		}
		
		return freeList;
	}
	
	public int totalRecord(String search, String selectCombo) throws SQLException{
		int total_pages = 0; // 개수 초기값
		if(selectCombo.equals("first")){ // first ==> 초기값 || title로 검색한다.
			total_pages = freeDaoImpl.totalFreeList(search); // 제목으로 찾으나..order by는 num으로 
		}else if(selectCombo.equals("ID")){
			total_pages = freeDaoImpl.freeListforID(search);
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
			str += "<a href='"+currentPage+"?page=1&search="+search+"&comboSelectFree="+selectCombo+"'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+(start_page-1)+"&search=" + search + "&comboSelectFree="+selectCombo+"'>&lt;</a>&nbsp;&nbsp;";			
		}
		
		for(int i = start_page; i<=end_page; i++){
			if(i==page){
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			}else{
				str += "<a href='"+currentPage+"?page="+i+"&search="+search+"&comboSelectFree="+selectCombo+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
		}
		if(page_count > end_page){
			str += "<a href='"+currentPage+"?page="+(end_page+1)+"&search=" + search + "&comboSelectFree="+selectCombo+"'>&gt;</a>&nbsp;&nbsp;";
			str += "<a href='"+currentPage+"?page="+page_count+"&search="+search+"&comboSelectFree="+selectCombo+"'>&gt;&gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}
}
