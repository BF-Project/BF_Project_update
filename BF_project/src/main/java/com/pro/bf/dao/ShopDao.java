package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

public interface ShopDao {

	int totalShop(String dong) throws SQLException;
	int count() throws SQLException;
	List<String> shopList() throws SQLException;
	int countAll() throws SQLException;
	
}
