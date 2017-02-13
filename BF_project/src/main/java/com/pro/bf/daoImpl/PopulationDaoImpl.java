package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.PopulationDao;

public class PopulationDaoImpl implements PopulationDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public int totalPopulation(String dong) throws SQLException {
		int result = 0;
		if(client.queryForObject("total",dong)==null){
			return result;
		}else{
			result = Integer.parseInt((String)client.queryForObject("total",dong));
		}
		return result;
	}

	@Override
	public float count() throws SQLException {
		float result = Float.parseFloat((String)client.queryForObject("cnt"));
		return result;
	}

	@Override
	public List<String> populationList() throws SQLException {
		List<String> populationList = new ArrayList<String>();
		populationList = client.queryForList("populationList");
		
		return populationList;
	}
	          
}
