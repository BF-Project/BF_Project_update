package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.TouristDao;

public class TouristDaoImpl implements TouristDao{
	
	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public int count(String dong) throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("count",dong));
		return result;
	}

	@Override
	public ArrayList<String> grade(String dong) throws SQLException {
		List gradeList = new ArrayList<String>();
		gradeList = client.queryForList("grade",dong);
		return (ArrayList<String>) gradeList;
	}

	@Override
	public float avg() throws SQLException {
		float result = Float.parseFloat((String)client.queryForObject("average"));
		return result;
	}
}
