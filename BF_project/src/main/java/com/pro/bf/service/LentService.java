package com.pro.bf.service;

import java.sql.SQLException;
import java.util.List;

public interface LentService {

	int totalLent(String dong) throws SQLException;
	double count() throws SQLException;
	List<String> lentList() throws SQLException;
	float score(String dong) throws SQLException;
}
