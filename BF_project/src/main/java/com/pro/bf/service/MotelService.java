package com.pro.bf.service;

import java.sql.SQLException;

public interface MotelService {

	int totalMotel(String dong) throws SQLException;
	int count() throws SQLException;
	int countAll() throws SQLException;
	
}

