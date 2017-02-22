package com.pro.bf.daoImpl;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.OnlineDao;
import com.pro.bf.dto.OnlineVO;

public class OnlineDaoImpl implements OnlineDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public void insertData(OnlineVO onlineVO) throws SQLException {
		client.insert("insertOlData",onlineVO);
	}
	
}
