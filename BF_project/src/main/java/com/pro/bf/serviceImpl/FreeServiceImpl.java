package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.FreeDaoImpl;
import com.pro.bf.dto.FreeVO;
import com.pro.bf.service.FreeService;

public class FreeServiceImpl implements FreeService {

	@Autowired
	FreeDaoImpl freeDaoImpl;

	public void setFreeDAO(FreeDaoImpl freeDaoImpl) {
		this.freeDaoImpl = freeDaoImpl;
	}

	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 게시글 개수

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
		int page_count = total_pages / counts + 1;

		if (total_pages % counts == 0) {
			page_count--;
		}

		if (tpage < 1) {
			tpage = 1;
		}

		int start_page = tpage - (tpage % view_rows) + 1;
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
				str += "<a href='freeList?tpage=" + i + "'>[" + i
						+ "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='freeList?tpage=" + (end_page + 1)
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='freeList?tpage=" + page_count
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}

		return str;
	}

	@Override
	public ArrayList<FreeVO> freSearch(String fre_title) throws SQLException {
		ArrayList<FreeVO> freTitle = freeDaoImpl.freSearch(fre_title);
		return freTitle;
	}


}
