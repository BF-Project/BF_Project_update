package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 관리자 테이블
 */
@Alias("admin")
@Data
public class AdminVO {

	private String admin_id; // key, 관리자 아이디
	private String admin_pwd; // 관리자 비밀번호
	private String admin_nm; // 관리자 이름
	private String admin_phone; // 관리자 번호
	private Date admin_date; // 관리자 아이디 생성날짜 (sysdate)
	
	
}