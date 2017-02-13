package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

public interface FlowageDao {
	
	float totalFlowage(String dong) throws SQLException;
	float count() throws SQLException;
	List<String> flowageList() throws SQLException;
}
