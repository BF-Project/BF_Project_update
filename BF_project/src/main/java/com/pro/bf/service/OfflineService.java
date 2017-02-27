package com.pro.bf.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

@Service
public interface OfflineService {

	public void insertData(String user, String addr, String addrDetail, String asset, String kind,
			float populationScore, float touristScore, float shopScore, 
			float lentScore, float flowageScore, String sales, String benefit) throws SQLException;
}
