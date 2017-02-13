package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.TouristDaoImpl;
import com.pro.bf.service.TouristService;

public class TouristServiceImpl implements TouristService{

	@Autowired
	private TouristDaoImpl touristDao;
	public void setTouristDAO(TouristDaoImpl touristDao){
		this.touristDao = touristDao;
	}
	
	@Override
	public int count(String dong) throws SQLException {
		int result = touristDao.count(dong);
		return result;
	}

	@Override
	public ArrayList<String> grade(String dong) throws SQLException {
		List gradeList = new ArrayList<String>();
		gradeList = touristDao.grade(dong);
		for(int i=0;i<gradeList.size();i++){
			//System.out.println(gradeList.get(i));
		}
		return (ArrayList<String>)gradeList;
	}

	@Override
	public float avg() throws SQLException {
		float result = touristDao.avg();
		return result;
	}

	@Override
	public float score(String dong) throws SQLException {
		int sum = 0;
		float score = 0;
		float scoreAvg = 0;
		float deviation = 0;
		for(int i=0;i<grade(dong).size();i++){
			sum+=Integer.parseInt((String)grade(dong).get(i));
		}
		if(grade(dong).size()!=0){
			scoreAvg = sum/grade(dong).size();
		}else{
			score=20;
			System.out.println("tourist score : "+score);
			return score;
		}
		deviation = scoreAvg-avg();
		if(deviation<=0){
			score=100;
		}else{
			score=(1-(deviation/avg()))*100;
		}
		if(score==0){
			score=20;
		}
		System.out.println("tourist score : "+score);
		return score;
	}
	
	
}
