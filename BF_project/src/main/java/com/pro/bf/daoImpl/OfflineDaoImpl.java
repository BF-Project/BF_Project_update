package com.pro.bf.daoImpl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.OfflineDao;

public class OfflineDaoImpl implements OfflineDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
}
