package com.pro.bf.daoImpl;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.OfflineDao;
import com.pro.bf.dto.OfflineVO;

public class OfflineDaoImpl implements OfflineDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public void insertData(OfflineVO offlineVO) throws SQLException {
		client.insert("insertOffData",offlineVO);
	}
	
}
