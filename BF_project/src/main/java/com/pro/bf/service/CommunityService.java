package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.QnAVO;

public interface CommunityService {
	
	public ArrayList<CommunityVO> getCmmtList(int tpage,String search) throws SQLException; // Q&A

	public CommunityVO getCmmtDetail(String cmmt_num) throws SQLException; // 상세보기

	public void insertCmmt(CommunityVO cmmtVO) throws SQLException;

	public int updateCmmt(CommunityVO cmmtVO) throws SQLException; // 답글수정

	public void countCmmt(int cmmt_num) throws SQLException; 

	public void deleteCmmt(int cmmt_num) throws SQLException;
	
	public String pageNumber(int tpage,String search) throws SQLException;

	public ArrayList<CommunityVO> getCmmtList(String mbr_id, String admin_id)throws SQLException;

	public CommunityVO getCmmtVO(int cmmt_num) throws SQLException;

	public ArrayList<CommunityVO> listAllCmmt(int tpage,String search) throws SQLException;

	//파일다운로드 하기위한 service에 메소드 추가
	String cmmtFileNameSearch(int cmmt_num)throws SQLException;
}
