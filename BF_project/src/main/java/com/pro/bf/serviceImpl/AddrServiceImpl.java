package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.AddrDaoImpl;
import com.pro.bf.dto.AddrVO;
import com.pro.bf.service.AddrService;

public class AddrServiceImpl implements AddrService{
	
	@Autowired
	private AddrDaoImpl addrDao;
	public void setAddressDAO(AddrDaoImpl addrDao){
		this.addrDao = addrDao;
	}
	
	@Override
	public ArrayList<AddrVO> getFindZipNum(String dong) {
		ArrayList<AddrVO> addressList=null;
		if (dong != null && dong.trim().equals("") == false){
			try {
				addressList = addrDao.selectAddressByDong(dong.trim());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return addressList;
	}
}