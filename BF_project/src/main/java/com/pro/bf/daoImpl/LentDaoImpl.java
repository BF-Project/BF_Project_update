package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.LentDao;
import com.pro.bf.dto.LentVO;

public class LentDaoImpl implements LentDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public int totalLent(String dong) throws SQLException {
		int result = 0;
		if((String)client.queryForObject("lentTotal",dong)==null){
			return result;
		}else{
			result = Integer.parseInt((String)client.queryForObject("lentTotal",dong));
		}
		return result;
	}
	@Override
	public int count() throws SQLException {
		int result = Integer.parseInt((String)client.queryForObject("lentCount"));
		return result;
	}
	
	@Override
	public List<String> lentList() throws SQLException {
		List<String> lentList = new ArrayList<String>();
		lentList = client.queryForList("lentList");
		return lentList;
	}

	@Override
	public List<LentVO> lentRecList(String asset, String addr) throws SQLException {
		List<LentVO> lentRecList = new ArrayList<LentVO>();
		Map<String, String> data = new HashMap<String,String>();
		data.put("asset",asset);
		data.put("addr",addr);
		lentRecList = client.queryForList("lentRecList",data);
		return lentRecList;
	}
	
}
