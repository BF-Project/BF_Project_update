package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

public interface MotelDao {

	int totalMotel(String dong) throws SQLException;
	int count() throws SQLException;
	int countAll() throws SQLException;
}
