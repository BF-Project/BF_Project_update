package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.MotelDao;

public class MotelDaoImpl implements MotelDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public int totalMotel(String dong) throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("motelTotal",dong));
		return result;
	}
	@Override
	public int count() throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("motelCount"));
		return result;
	}
	@Override
	public int countAll() throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("motelCountAll"));
		return result;
	}
	
}
