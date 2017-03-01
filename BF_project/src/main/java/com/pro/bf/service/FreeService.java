package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.FreeVO;

public interface FreeService {

	public ArrayList<FreeVO> getFreeList(int tpage) throws SQLException;
	public ArrayList<FreeVO> freeList(String mbr_id) throws SQLException;
	public ArrayList<FreeVO> freSearch(String fre_title) throws SQLException;
	public void insertFree(FreeVO freeVO) throws SQLException;
	public FreeVO getFreeVO(int fre_num) throws SQLException;
	public FreeVO getFreeDetail(String fre_num) throws SQLException;
	public int countFree(FreeVO freeVO) throws SQLException;
	public String pageNumber(int tpage, String classify) throws SQLException;
	//파일다운로드 하기위한 service에 메소드 추가
	String freeFileNameSearch(int fre_num)throws SQLException;
	
	// ADMIN
	ArrayList<FreeVO> FreeList(int page, String search, String selectCombo) throws SQLException;
	String pageNumber2(int page, String search, String currentPage, String selectCombo) throws SQLException;
}
