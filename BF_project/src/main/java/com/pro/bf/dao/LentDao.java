package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

import com.pro.bf.dto.LentVO;

public interface LentDao {
	
	int totalLent(String dong) throws SQLException;
	int count() throws SQLException;
	List<String> lentList() throws SQLException;
	List<LentVO> lentRecList(String asset, String addr) throws SQLException;
}
