package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.pro.bf.dto.FreeVO;

public interface FreeDao {

	public ArrayList<FreeVO> listAllFree(int tpage) throws SQLException;
	public ArrayList<FreeVO> freeList(String mbr_id) throws SQLException;
	public ArrayList<FreeVO> freSearch(String fre_title) throws SQLException;
	public FreeVO getFree(int fre_num) throws SQLException;
	public void insertFree(FreeVO freeVO) throws SQLException;
	public void deleteFree(int fre_num) throws SQLException;
	public int updateFree(FreeVO freeVO) throws SQLException;
	public int countFree(FreeVO freeVO) throws SQLException;
	public int totalFree() throws SQLException;
	//파일다운로드 하기위한 String fileName 메소드 추가
	String freeFileNameSearch(int fre_num) throws SQLException;

	// ADMIN
	int totalFreeList(String search) throws SQLException;
	int freeListforID(String search) throws SQLException;
	ArrayList<FreeVO> freeListForFirst(String search, int startRow, int counts2) throws SQLException;
	ArrayList<FreeVO> freeListForIDIDID(String search, int startRow, int counts2) throws SQLException;
	public int countForDate(String date) throws SQLException;
}
