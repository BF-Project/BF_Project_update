package com.pro.bf.service;

import java.sql.SQLException;

import com.pro.bf.dto.MbrVO;

public interface AdminService {

	String adminLogin(MbrVO MbrVo) throws SQLException;
	String adminidcheck(String userid) throws SQLException;
	String adminName(String adminId) throws SQLException;
}
