package com.pro.bf.service;

import java.sql.SQLException;

public interface OnlineService {

	public void insertData(String user, String asset, String marketing, String prodManage, 
			String sitemap, String prodDirect, String cooperation, String itemCreativity,
			String customerManage, String benefit, String salesAccount, String benefit2) throws SQLException;
}
