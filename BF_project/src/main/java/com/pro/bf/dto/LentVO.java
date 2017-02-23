package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 임대가격 테이블
 */
@Alias("lent")
@Data
public class LentVO {
	
	private int lent_num; // key, 일련번호
	private String lent_dong; // 동
	private int lent_firstzip; // 본번
	private int secondzip; // 부번
	private String lent_price; // 공시가격
	
	
}