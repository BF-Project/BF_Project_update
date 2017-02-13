package com.pro.bf.daoImpl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.QttDao;

public class QttDaoImpl implements QttDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
}
