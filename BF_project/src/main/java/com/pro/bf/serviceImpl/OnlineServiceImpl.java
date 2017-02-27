package com.pro.bf.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.daoImpl.OnlineDaoImpl;
import com.pro.bf.dto.OnlineVO;
import com.pro.bf.service.OnlineService;

public class OnlineServiceImpl implements OnlineService{

	@Autowired
	private OnlineDaoImpl onlineDao;
	public void setOnlineDAO(OnlineDaoImpl onlineDao){
		this.onlineDao = onlineDao;
	}
	
	@Override
	public void insertData(String user, String asset, String marketing, String prodManage, 
			String sitemap, String prodDirect, String cooperation, String itemCreativity,
			String customerManage, String benefit, String salesAccount, String benefit2) throws SQLException {
		
		if(marketing.equals("yes")){
			marketing = "y";
		}else{
			marketing = "n";
		}
		
		if(prodManage.equals("yes")){
			prodManage = "y";
		}else{
			prodManage = "n";
		}
		
		if(sitemap.equals("yes")){
			sitemap = "y";
		}else{
			sitemap = "n";
		}
		
		if(prodDirect.equals("yes")){
			prodDirect = "y";
		}else{
			prodDirect = "n";
		}
		
		if(cooperation.equals("yes")){
			cooperation = "y";
		}else{
			cooperation = "n";
		}

		if(itemCreativity.equals("high")){
			itemCreativity = "h";
		}else if(itemCreativity.equals("mid")){
			itemCreativity = "m";
		}else{
			itemCreativity = "l";
		}
		
		if(customerManage.equals("yes")){
			customerManage = "y";
		}else{
			customerManage = "n";
		}
		
		OnlineVO onlineVO = new OnlineVO();
		onlineVO.setMbr_id(user);
		onlineVO.setOle_asst(asset);
		onlineVO.setOle_copt_cnc_sts(cooperation);
		onlineVO.setOle_cstm_ast_sts(customerManage);
		onlineVO.setOle_item_orgt_sts(itemCreativity);
		onlineVO.setOle_mkt_sts(marketing);
		onlineVO.setOle_pdt_prdt_sts(prodDirect);
		onlineVO.setOle_pdt_sts(prodManage);
		onlineVO.setOle_siteMap_sts(sitemap);
		onlineVO.setOle_pfbl_sts(benefit);
		onlineVO.setSales(salesAccount);
		onlineVO.setBenefit(benefit2);
		
		onlineDao.insertData(onlineVO);
		
	}

}
