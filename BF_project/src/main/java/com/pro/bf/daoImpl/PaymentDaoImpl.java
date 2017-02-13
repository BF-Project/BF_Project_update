package com.pro.bf.daoImpl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.PaymentDao;

public class PaymentDaoImpl implements PaymentDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
}
