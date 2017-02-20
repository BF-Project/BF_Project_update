package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 플렛폼(템플릿) 테이블
 */
@Alias("ptf")
@Data
public class PTFVO {

	private int ptf_num; // key, 일련번호
	private String ptf_nm; // 템플릿 이름
	private int ptf_dld_quty; // 템플릿 다운로드 횟수
	
	
}