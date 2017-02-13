package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.FlowageDao;

public class FlowageDaoImpl implements FlowageDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public float totalFlowage(String dong) throws SQLException {
		float result = 0;
		if((String)client.queryForObject("flowageTotal",dong)!=null){			
			result = Float.parseFloat((String)client.queryForObject("flowageTotal",dong));
		}
		return result;
	}
	@Override
	public float count() throws SQLException {
		float result = Float.parseFloat((String)client.queryForObject("flowageCount"));
		return result;
	}
	@Override
	public List<String> flowageList() throws SQLException {
		List<String> flowageList = new ArrayList<String>();
		flowageList = client.queryForList("flowageList");
		return flowageList;
	}
	
}
