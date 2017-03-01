package com.pro.bf.service;

import java.sql.SQLException;
import java.util.List;

import com.pro.bf.dto.LentVO;

public interface LentService {

	int totalLent(String dong) throws SQLException;
	double count() throws SQLException;
	List<String> lentList() throws SQLException;
	float score(String dong) throws SQLException;
	List<LentVO> lentRecList(String asset, String addr) throws SQLException;
}
