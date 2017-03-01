package com.pro.bf.serviceImpl;

import com.pro.bf.service.CalculateScore;

public class CalculateScoreImpl implements CalculateScore {

	@Override
	public float calcScore(String kind, float score, String radio){
		
		float salesAccount = 0;
		if(radio.equals("offline")){
			if(kind.equals("chicken")){
				salesAccount += score*60*15000*3/100;
				//salesAccount += 15000*3; 
			}else if(kind.equals("cafe")){
				salesAccount += score*800000*3/100;
			}else if(kind.equals("restaurant")){
				salesAccount += score*900000*3/100;
			}else if(kind.equals("pension")){
				salesAccount += score*700000*3/100;
			}
			return salesAccount;
		}else{
			if(kind.equals("marketing")){
				salesAccount += 10000;
			}else if(kind.equals("prodManage")){
				salesAccount += 10000;
			}else if(kind.equals("benefit")){
				salesAccount += 10000;
			}else if(kind.equals("sitemap")){
				salesAccount += 10000;
			}else if(kind.equals("prodDirect")){
				salesAccount += 10000;
			}else if(kind.equals("cooperation")){
				salesAccount += 10000;
			}else if(kind.equals("itemCreativity")){
				salesAccount += 10000;
			}else if(kind.equals("customerManage")){
				salesAccount += 10000;
			}
		}
		return salesAccount;
		
	}
}
