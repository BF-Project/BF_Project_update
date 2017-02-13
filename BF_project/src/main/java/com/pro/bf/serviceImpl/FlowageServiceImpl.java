package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.FlowageDaoImpl;
import com.pro.bf.service.FlowageService;

public class FlowageServiceImpl implements FlowageService{

	@Autowired
	private FlowageDaoImpl flowageDao;
	public void setFlowageDAO(FlowageDaoImpl flowageDao){
		this.flowageDao = flowageDao;
	}
	
	@Override
	public float totalFlowage(String dong) throws SQLException {
		float result = flowageDao.totalFlowage(dong);
		return result;
	}
	@Override
	public float count() throws SQLException {
		float result = flowageDao.count();
		return result;
	}
	@Override
	public List<String> flowageList() throws SQLException {
		List<String> flowageList = new ArrayList<String>();
		flowageList = flowageDao.flowageList();
		return flowageList;
	}
	
	/*private float avg(){
		float avg = 0;
		float sum = 0;
		List<String> flowageList = new ArrayList<String>();
		try {
			flowageList = flowageList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0;i<flowageList.size();i++){
			sum += Float.parseFloat(flowageList.get(i));
		}
		try {
			avg = sum/count();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return avg;
	}
*/
	@Override
	public float score(String dong) throws SQLException {
		float score = 0;
		float avg = (float) 9.5;
		float deviation = totalFlowage(dong) - avg;
		if(deviation>=0){
			score=100;
			System.out.println("flowage score : "+score);
			return score;
		}else{
			score=100+((deviation/avg)*100);
		}
		if(score==0){
			score=20;
		}
		System.out.println("flowage score : "+score);
		return score;
	}
	
}
