package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.AddrDao;
import com.pro.bf.dto.AddrVO;

public class AddrDaoImpl implements AddrDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public ArrayList<AddrVO> selectAddressByDong(String dong) throws SQLException {
		ArrayList<AddrVO> addressList=(ArrayList<AddrVO>)client.queryForList("selectAddressByDong",dong);
		return addressList;
	}
}