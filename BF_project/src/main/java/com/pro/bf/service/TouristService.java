package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;

public interface TouristService {
	
	int count(String dong) throws SQLException;
	ArrayList<String> grade(String dong) throws SQLException;
	float avg() throws SQLException;
	float score(String dong) throws SQLException;
}
