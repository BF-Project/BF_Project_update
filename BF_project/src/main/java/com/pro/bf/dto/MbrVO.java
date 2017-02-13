package com.pro.bf.dto;

import java.util.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



/**
 * @author 차승현<br>
 * 회원 테이블
 */
@Alias("mbr")
@Data
public class MbrVO {

	private String mbr_id; // key, 회원아이디
	private String mbr_pwd; // 패스워드
	private String mbr_nm; // 이름
	private String mbr_eml; // 이메일
	private String mbr_phone; // 전화번호
	private String mbr_addr; // 주소
	private Date mbr_brt; // 생년월일
	private String mbr_gnd; // 성별
	private Date mbr_date; // 아이디 생성날짜
	private String mbr_eml_yn; // 이메일 수신 여부 (default 'Y')
	private String mbr_use_yn; // 사용여부(default:Y)
	
	
}