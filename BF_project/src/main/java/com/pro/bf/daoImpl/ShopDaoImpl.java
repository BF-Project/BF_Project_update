package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.ShopDao;

public class ShopDaoImpl implements ShopDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public int totalShop(String dong) throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("shopTotal",dong));
		return result;
	}
	@Override
	public int count() throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("shopCount"));
		return result;
	}
	@Override
	public List<String> shopList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countAll() throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("shopCountAll"));
		return result;
	}
	
}
