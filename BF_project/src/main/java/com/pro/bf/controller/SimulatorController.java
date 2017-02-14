package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.serviceImpl.CalculateScoreImpl;
import com.pro.bf.serviceImpl.FlowageServiceImpl;
import com.pro.bf.serviceImpl.LentServiceImpl;
import com.pro.bf.serviceImpl.MotelServiceImpl;
import com.pro.bf.serviceImpl.PopulationServiceImpl;
import com.pro.bf.serviceImpl.ShopServiceImpl;
import com.pro.bf.serviceImpl.TouristServiceImpl;

@Controller
@RequestMapping(value = "simulator")
public class SimulatorController {

	@Autowired
	LentServiceImpl lentService;
	@Autowired
	MotelServiceImpl motelService;
	@Autowired
	FlowageServiceImpl flowageService;
	@Autowired
	PopulationServiceImpl populationService;
	@Autowired
	TouristServiceImpl touristService;
	@Autowired
	ShopServiceImpl shopService;
	@Autowired
	CalculateScoreImpl calcService;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String mainGet() {
		String url = "simulator/main";
		return url;
	}

	@RequestMapping(value = "control")
	public String control(String juso) {
		String url = "simulator/control";
		System.out.println(juso);
		return url;
	}

	@ResponseBody
	@RequestMapping(value = "start", method = RequestMethod.POST)
	public List<String> start(String radio, String kind, String addr,
			String addrDetail, String startPeriod, String endPeriod,
			String marketing, String prodManage, String sitemap,
			String prodDirect, String cooperation, String itemCreativity,
			String customerManage) {

		
		List<String> data = new ArrayList<String>();
		if (radio.equals("offline")) {
			float[][] matrix = {
					{ 1, (float) 0.666, (float) 1.666, (float) 0.333,
							(float) 1.333 },
					{ (float) 1.5, 1, (float) 2.5, (float) 0.5, 2 },
					{ (float) 0.6, (float) 0.4, 1, (float) 0.2, (float) 0.8 },
					{ 3, 2, 5, 1, 4 },
					{ (float) 0.75, (float) 0.5, (float) 1.25, (float) 0.25, 1 } };
			float one = 0;
			float two = 0;
			float three = 0;
			float four = 0;
			float five = 0;
			for (int i = 0; i < 5; i++) {
				for (int j = 0; j < 5; j++) {
					if (i == 0) {
						one += matrix[j][i];
					}
					if (i == 1) {
						two += matrix[j][i];
					}
					if (i == 2) {
						three += matrix[j][i];
					}
					if (i == 3) {
						four += matrix[j][i];
					}
					if (i == 4) {
						five += matrix[j][i];
					}
				}
			}

			float[][] resultMatrix = new float[5][6];

			for (int i = 0; i < 5; i++) {
				for (int j = 0; j < 5; j++) {
					if (i == 0) {
						resultMatrix[j][i] = matrix[j][i] / one;
					}
					if (i == 1) {
						resultMatrix[j][i] = matrix[j][i] / two;
					}
					if (i == 2) {
						resultMatrix[j][i] = matrix[j][i] / three;
					}
					if (i == 3) {
						resultMatrix[j][i] = matrix[j][i] / four;
					}
					if (i == 4) {
						resultMatrix[j][i] = matrix[j][i] / five;
					}
				}
			}

			/* 요소별 가중치 구하기 */
			for (int i = 0; i < 5; i++) {
				float sum = 0;
				for (int j = 0; j < 5; j++) {
					sum += resultMatrix[i][j];
				}
				resultMatrix[i][5] = sum / 5;
				// System.out.println(resultMatrix[i][5]);
			}

			/* C.I 구하기 */
			float[] a = new float[5];
			float[] x = new float[5];
			for (int i = 0; i < 5; i++) {
				x[i] = resultMatrix[i][5];
			}

			for (int i = 0; i < 5; i++) {
				for (int j = 0; j < 5; j++) {
					a[i] += matrix[i][j] * x[j];
				}
			}

			float[] coin = new float[5];
			for (int i = 0; i < 5; i++) {
				coin[i] = a[i] / x[i];
			}

			/*
			 * try { lentService.score(addr); } catch (SQLException e) { // TODO
			 * Auto-generated catch block e.printStackTrace(); }
			 */

			float totalScore = 0;

			for (int i = 0; i < 5; i++) {
				try {
					String address = addr + " " + addrDetail;
					if (i == 0) {
						float populationScore = populationService.score(addr);
						totalScore += populationScore * resultMatrix[i][5];
						data.add(populationScore + "");
					} else if (i == 1) {
						float touristScore = touristService.score(addr);
						totalScore += touristScore * resultMatrix[i][5];
						data.add(touristScore + "");
					} else if (i == 2) {
						float shopScore = 0;
						float motelScore = 0;
						if (kind.equals("pension")) {
							motelScore = motelService.score(addr);
							totalScore += motelScore * resultMatrix[i][5];
							data.add(motelScore + "");
						} else {
							shopScore = shopService.score(addr);
							totalScore += shopScore * resultMatrix[i][5];
							data.add(shopScore + "");
						}
					} else if (i == 3) {
						float lentScore = lentService.score(address);
						totalScore += lentScore * resultMatrix[i][5];
						data.add(lentScore + "");
					} else if (i == 4) {
						float flowageScore = flowageService.score(address);
						totalScore += flowageScore * resultMatrix[i][5];
						data.add(flowageScore + "");
					}
					System.out.println("Total Score " + (i + 1) + ": "
							+ totalScore);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			int period = Integer.parseInt(endPeriod)
					- Integer.parseInt(startPeriod);
			int salesAccount = 0;
			if (Math.random() * 100 <= totalScore) {
				salesAccount = (int) calcService.calcScore(kind, totalScore, radio);
			}
			System.out.println("3일 매출 : " + salesAccount);
			data.add(salesAccount + "");

			return data;
		}else{
			int totalScore = 20;
			int salesAccount = 1000000;
			if(marketing.equals("yes")){
				totalScore += 20;
			}
			if(prodManage.equals("yes")){
				totalScore += 10;
			}
			if(sitemap.equals("yes")){
				totalScore += 10;
			}
			if(prodDirect.equals("yes")){
				totalScore += 10;
			}
			if(cooperation.equals("yes")){
				totalScore += 10;
			}
			if(customerManage.equals("yes")){
				totalScore += 10;
			}
			if(itemCreativity.equals("high")){
				totalScore += 20;
			}else if(itemCreativity.equals("mid")){
				totalScore += 10;
			}
			
			if(totalScore>85){
				totalScore = 85;
			}
			System.out.println("totalScore : "+totalScore);
			salesAccount = salesAccount*totalScore/100;
			data.add(salesAccount+"");
		}
		
		return data;
	}

}
