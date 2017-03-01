package com.pro.bf.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.EmailVO;
import com.pro.bf.dto.LentVO;
import com.pro.bf.serviceImpl.LentServiceImpl;

@Controller
@RequestMapping(value="consulting")
public class ConsultingController {
	
	@Autowired
	LentServiceImpl lentService;
	
	@Resource(name="mailSender")
	private MailSender mailSender;
	
	@RequestMapping(value="recommend")
	public String recommend(){
		String url = "consulting/recommend";
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="recommend", method = RequestMethod.POST)
	public Map<String,List> execRecommend(String asset){
		List<LentVO> lentRecList = new ArrayList<LentVO>();
		try {
			System.out.println(asset+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			lentRecList = lentService.lentRecList(asset+"0000");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String,List> data = new HashMap<String,List>();
		
		for(int i=0;i<5;i++){
			data.put("recList", lentRecList);
			/*data.put("price", lentRecList.get(i).getLent_price2());
			data.put("addr", lentRecList.get(i).getLent_dong()+" "+lentRecList.get(i).getLent_firstzip()+"-"+lentRecList.get(i).getSecondzip());*/
					
			System.out.println(lentRecList.get(i).getLent_price2());
			System.out.println(lentRecList.get(i).getLent_dong()+" "+lentRecList.get(i).getLent_firstzip()+"-"+lentRecList.get(i).getSecondzip());
		}
		
		return data;
	}
	
	//메일보내기
	@RequestMapping("consult")
	public String Consult() {
		String url = "consulting/consult";
		return url;
	}
	
	@RequestMapping(value="/sendMail", method=RequestMethod.GET)
	public String sendMail(HttpServletRequest request) {
		String url = "consulting/sendMail";
		return url;
	}
	
	@RequestMapping(value="/sendMail", method=RequestMethod.POST)
	public String mailSender(EmailVO emailVO) {
		String url = "consulting/consult";
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject(emailVO.getTitle());
		message.setFrom(emailVO.getSender());
		message.setTo(emailVO.getTo());
		message.setText(emailVO.getContext());
		
		try {
			mailSender.send(message);
			
		} catch (MailException e) {
			e.printStackTrace();
		}
		
		return url;
		
	}
	
	
	
	/*@RequestMapping(value="execRecommend",method = RequestMethod.POST)
	public List<String> execRecommend(String asset){
		
		List<String> recommendList = new ArrayList<String>();
		try {
			recommendList = lentService.lentRecList(asset);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return recommendList;
	}*/
}
