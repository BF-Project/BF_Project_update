package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 유동인구 테이블
 */
@Alias("flowage")
@Data
public class FlowageVO {

	private int flo_num; // key, 유동인구 일련번호
	private String flo_addr; // 주소
	private int flo_man10;
	private int flo_man20;
	private int flo_man30;
	private int flo_man40;
	private int flo_man50;
	private int flo_man60;
	private int flo_woman10;
	private int flo_woman20;
	private int flo_woman30;
	private int flo_woman40;
	private int flo_woman50;
	private int flo_woman60;
	

}