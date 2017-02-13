package com.pro.bf.daoImpl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.PTFDao;

public class PTFDaoImpl implements PTFDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
}
