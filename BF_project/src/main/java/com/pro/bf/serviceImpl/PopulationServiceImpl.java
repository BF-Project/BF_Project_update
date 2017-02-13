package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.PopulationDaoImpl;
import com.pro.bf.service.PopulationService;

public class PopulationServiceImpl implements PopulationService{
	
	@Autowired
	private PopulationDaoImpl populationDao;
	public void setPopulationDAO(PopulationDaoImpl populationDao){
		this.populationDao = populationDao;
	}
	@Override
	public int totalPopulation(String dong) throws SQLException {
		int result = 0;
		if(populationDao.totalPopulation(dong)==0){
			return result;
		}else{			
			result = populationDao.totalPopulation(dong);
		}
		return result;
	}
	
	@Override
	public float count() throws SQLException {
		float result = populationDao.count();
		return result;
	}
	
	public float avg(){
		float result = 0;
		List<String> populationList = null;
		int sum = 0;
		try {
			populationList = populationList();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for(int i=0;i<populationList.size();i++){
			sum+=Integer.parseInt(populationList.get(i));
		}
		
		try {
			result = sum/count();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<String> populationList() throws SQLException {
		List<String> populationList = new ArrayList<String>();
		populationList = populationDao.populationList();
		return populationList;
	}
	
	@Override
	public float score(String dong) throws SQLException {
		float deviation = totalPopulation(dong)-avg();
		float score = 0;
		if(deviation>=0){
			score=100;
			System.out.println("population score : "+score);
			return score;
		}else{
			score=100+((deviation/avg())*100);
		}
		if(score==0){
			score=20;
		}
		System.out.println("population score : "+score);
		return score;
	}
	
	
}
