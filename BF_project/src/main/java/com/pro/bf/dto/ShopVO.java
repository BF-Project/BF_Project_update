package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 상가업소 테이블
 */
@Alias("shop")
@Data
public class ShopVO {

	private int shop_num; // key, 상가 일련번호
	private String shop_dong_addr; // 행정동 명
	private String shop_nm; // 상호명
	private String shop_cmc_L; // 상가 상권업종_대
	private String shop_cmc_M; // 상가 상권업종_중
	private String shop_addr; // 상가지번주소
	
	
}