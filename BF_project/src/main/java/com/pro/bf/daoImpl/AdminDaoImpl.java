package com.pro.bf.daoImpl;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.AdminDao;
import com.pro.bf.dto.MbrVO;

public class AdminDaoImpl implements AdminDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	
	@Override
	public String adminLogin(MbrVO MbrVo) throws SQLException { // 관리자 로그인
		String adminLogin = (String)client.queryForObject("AdminLogin", MbrVo);
		return adminLogin;
	}

	@Override
	public String adminidcheck(String userid) throws SQLException { // 관리자 id 중복확인
		String adminId = (String)client.queryForObject("AdminIdCheck", userid);
		return adminId;
	}

	@Override
	public String adminName(String adminId) throws SQLException { // 관리자 이름 찾기
		String adminName = (String) client.queryForObject("AdminNameCheck", adminId);
		return adminName;
	}
}