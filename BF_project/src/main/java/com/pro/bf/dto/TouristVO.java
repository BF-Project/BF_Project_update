package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 관광지 테이블
 */
@Alias("tourist")
@Data
public class TouristVO {

	private int trt_num; // key, 관광지 일련번호
	private String trt_nm; // 관광지명
	private String trt_addr; // 관광지 주소
	private int trt_grade; // 관광지 등급(1등급일수록 사람이 많음)
	
	
}