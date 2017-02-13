package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

public interface TouristDao {
	
	int count(String dong) throws SQLException;
	ArrayList<String> grade(String dong) throws SQLException;
	float avg() throws SQLException;
}
