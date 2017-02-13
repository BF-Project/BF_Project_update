package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 숙박업 테이블
 */
@Alias("msg")
@Data
public class MotelVO {

	private int mt_num; // key, 일련번호
	private String mt_nm; // 업소명
	private String mt_addr; // 주소
	
	
}