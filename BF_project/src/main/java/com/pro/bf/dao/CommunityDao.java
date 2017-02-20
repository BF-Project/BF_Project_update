package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.QnAVO;

public interface CommunityDao {
	
	public ArrayList<CommunityVO> listCmmt(String mbr_id , String admin_id) throws SQLException; // Q&A 리스트
	//추가
	public ArrayList<CommunityVO> listAllCmmt(int tpage,String search) throws SQLException; // Q&A ALL 리스트

	public CommunityVO getCmmt(int cmmt_num) throws SQLException;

	public void insertCmmt(CommunityVO cmmtVO) throws SQLException; // 등록

	public int updateCmmt(CommunityVO cmmtVO) throws SQLException; // 수정
	
	public void countCmmt(int cmmt_num) throws SQLException; // 조회수
	
	//추가
	public int totalCmmt(String search) throws SQLException;

	public void deleteCmmt(int cmmt_num)throws SQLException;//delete
	

	public ArrayList<CommunityVO> getCmmtList(String mbr_id,String admin_id) throws SQLException;

	public CommunityVO getCmmtVO(int cmmt_num) throws SQLException;

	//파일다운로드 하기위한 String fileName 메소드 추가
	String cmmtFileNameSearch(int cmmt_num) throws SQLException;
	
}
