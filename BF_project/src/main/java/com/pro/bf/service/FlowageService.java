package com.pro.bf.service;

import java.sql.SQLException;
import java.util.List;

public interface FlowageService {

	float totalFlowage(String dong) throws SQLException;
	float count() throws SQLException;
	List<String> flowageList() throws SQLException;
	float score(String dong) throws SQLException;
}
