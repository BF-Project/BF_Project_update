package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현 <br>
 * 주소 테이블
 */
@Alias("addr")
@Data
public class AddrVO {
	
	private String addr_zip_num; // 우편번호?
	private String addr_sd; // 시도
	private String addr_gugun; // 구군
	private String addr_dong; // 동
	private int addr_zip_code; // 각 지역에 매긴 번호 
	private String addr_bunji; // 번지
	
	
}