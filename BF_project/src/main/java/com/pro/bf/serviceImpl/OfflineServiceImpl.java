package com.pro.bf.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.OfflineDaoImpl;
import com.pro.bf.dto.OfflineVO;
import com.pro.bf.service.OfflineService;

public class OfflineServiceImpl implements OfflineService{

	@Autowired
	private OfflineDaoImpl offlineDao;
	public void setOfflineDAO(OfflineDaoImpl offlineDao){
		this.offlineDao = offlineDao;
	}
	
	@Override
	public void insertData(String user, String addr, String addrDetail, String asset, String kind,
			float populationScore, float touristScore, float shopScore, 
			float lentScore, float flowageScore, String sales, String benefit) throws SQLException {
		
			String address = addr+" "+addrDetail;
			OfflineVO offlineVO = new OfflineVO();
			offlineVO.setOff_datailAddr(address);
			offlineVO.setOff_asst(asset);
			offlineVO.setOff_kind(kind);
			offlineVO.setFlo_score(flowageScore);
			offlineVO.setLent_score(lentScore);
			offlineVO.setPop_score(populationScore);
			offlineVO.setShop_score(shopScore);
			offlineVO.setTour_score(touristScore);
			offlineVO.setMbr_id(user);
			offlineVO.setSales(sales);
			offlineVO.setBenefit(benefit);
			
			offlineDao.insertData(offlineVO);
		
	}

}
