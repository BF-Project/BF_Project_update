package com.pro.bf.service;

import java.sql.SQLException;

public interface ShopService {

	int totalShop(String dong) throws SQLException;
	int count() throws SQLException;
	int countAll() throws SQLException;
}
