package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.AddrVO;

public interface AddrDao {
	
	public ArrayList<AddrVO> selectAddressByDong(String dong) throws SQLException;
}
