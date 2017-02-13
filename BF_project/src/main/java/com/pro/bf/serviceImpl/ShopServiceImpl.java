package com.pro.bf.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.ShopDaoImpl;
import com.pro.bf.service.ShopService;

public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDaoImpl shopDao;
	public void setShopDAO(ShopDaoImpl shopDao){
		this.shopDao = shopDao;
	}
	
	@Override
	public int totalShop(String dong) throws SQLException {
		int result = shopDao.totalShop(dong);
		return result;
	}
	@Override
	public int count() throws SQLException {
		int result = shopDao.count();
		return result;
	}
	
	public float score(String dong) throws SQLException{
		float avg = countAll()/count();
		float deviation = totalShop(dong) - avg;
		float score = 0;
		if(deviation<=0){
			score=100+((deviation/avg)*100);
		}else{
			score=100;
			System.out.println("shop score : "+score);
			return score;
		}
		if(score==0){
			score=20;
		}
		System.out.println("shop score : "+score);
		return score;
	}

	@Override
	public int countAll() throws SQLException {
		int result = shopDao.countAll();
		return result;
	}
	
	
	
	
	
}
