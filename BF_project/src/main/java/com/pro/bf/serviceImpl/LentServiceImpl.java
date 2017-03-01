package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.LentDaoImpl;
import com.pro.bf.dto.LentVO;
import com.pro.bf.service.LentService;

public class LentServiceImpl implements LentService{

	@Autowired
	private LentDaoImpl lentDao;
	public void setLentDAO(LentDaoImpl lentDao){
		this.lentDao = lentDao;
	}
	
	@Override
	public int totalLent(String dong) throws SQLException {
		int result = lentDao.totalLent(dong);
		return result;
	}
	@Override
	public double count() throws SQLException {
		int result = lentDao.count();
		return result;
	}
	@Override
	public List<String> lentList() throws SQLException {
		List<String> lentList = new ArrayList<String>();
		lentList = lentDao.lentList();
		return lentList;
	}
	@Override
	public float score(String dong) throws SQLException {
		double sum = 0;
		/*for(int i=0;i<lentList().size();i++){
			sum += Integer.parseInt(lentList().get(i));
		}*/
		float avg = 58797487;
		float deviation = totalLent(dong)-avg;
		float score = 0;
		if(deviation<=0){
			score=80+((deviation/avg)*80);
		}else{
			score=80;
			System.out.println("lent score : "+score);
			return score;
		}
		if(score==0){
			score=20;
		}
		System.out.println("lent score : "+score);
		return score;
	}

	@Override
	public List<LentVO> lentRecList(String asset) throws SQLException {
		List<LentVO> lentRecList = new ArrayList<LentVO>();
		lentRecList = lentDao.lentRecList(asset);
		return lentRecList;	
	}
	
	
}
