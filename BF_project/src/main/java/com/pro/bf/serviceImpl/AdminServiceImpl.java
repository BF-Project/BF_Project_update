package com.pro.bf.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.AdminDaoImpl;
import com.pro.bf.dto.MbrVO;
import com.pro.bf.service.AdminService;

public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDaoImpl adminDao;
	public void setAdminDAO(AdminDaoImpl adminDao){
		this.adminDao = adminDao;
	}
	
	@Override
	public String adminLogin(MbrVO MbrVo) throws SQLException { // 관리자 로그인
		String adminLogin = adminDao.adminLogin(MbrVo);
		return adminLogin;
	}

	@Override
	public String adminidcheck(String userid) throws SQLException { // 관리자 id 중복확인
		String adminId = adminDao.adminidcheck(userid);
		return adminId;
	}

	@Override
	public String adminName(String adminId) throws SQLException { // 관리자 이름 찾기
		String adminName = adminDao.adminName(adminId);
		return adminName;
	}
}