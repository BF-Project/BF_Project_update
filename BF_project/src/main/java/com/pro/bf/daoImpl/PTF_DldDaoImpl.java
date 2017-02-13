package com.pro.bf.daoImpl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.PTF_DldDao;

public class PTF_DldDaoImpl implements PTF_DldDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
}
