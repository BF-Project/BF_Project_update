package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 유동인구 테이블
 */
@Alias("population")
@Data
public class PopulationVO {
	
	private int pplt_num; // key, 일련번호
	private String pplt_dong; // 읍면동
	private int pplt_man; // 내국인 남
	private int pplt_woman; // 내국인 여
	private int pplt_frn_man; // 외국인 남
	private int pplt_frn_woman; // 외국인 여
	
	
}