package com.pro.bf.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.MotelDaoImpl;
import com.pro.bf.service.MotelService;

public class MotelServiceImpl implements MotelService{

	@Autowired
	private MotelDaoImpl motelDao;
	public void setMotelDAO(MotelDaoImpl motelDao){
		this.motelDao = motelDao;
	}
	
	@Override
	public int totalMotel(String dong) throws SQLException {
		int result = motelDao.totalMotel(dong);
		return result;
	}
	@Override
	public int count() throws SQLException {
		int result = motelDao.count();
		return result;
	}
	@Override
	public int countAll() throws SQLException {
		int result = motelDao.countAll();
		return result;
	}
	
	public float score(String dong) throws SQLException{
		float avg = countAll()/count();
		float deviation = totalMotel(dong)-avg;
		float score = 0;
		if(deviation<=0){
			score=100+((deviation/avg)*100);
		}else{
			score=100;
			System.out.println("motel score : "+score);
			return score;
		}
		if(score==0){
			score=20;
		}
		System.out.println("motel score : "+score);
		return score;
	}
	
}
