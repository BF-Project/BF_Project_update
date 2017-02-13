package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 플렛폼(템플릿) 다운로드 테이블
 */
@Alias("ptf_dld")
@Data
public class PTF_DldVO {

	private int ptf_dld_num; // key, 다운로드 번호(일련번호)
	private int ptf_num; // 플렛폼(템플릿) 일련번호(FK)
	private String mbr_id; // 회원아이디(다운로드한 회원)(FK)
	
	
}