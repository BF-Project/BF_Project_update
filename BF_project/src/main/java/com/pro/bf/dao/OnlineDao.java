package com.pro.bf.dao;

import java.sql.SQLException;

import com.pro.bf.dto.OnlineVO;

public interface OnlineDao {
	
	public void insertData(OnlineVO onlineVO) throws SQLException;
}
