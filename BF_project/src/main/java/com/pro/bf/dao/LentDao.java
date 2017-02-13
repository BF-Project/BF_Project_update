package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

public interface LentDao {
	
	int totalLent(String dong) throws SQLException;
	int count() throws SQLException;
	List<String> lentList() throws SQLException;
}
