package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 자유게시판 테이블
 */
@Alias("free")
@Data
public class FreeVO {
	
	private int fre_num; // key, 자유게시판 게시글 번호
	private String fre_title; // 제목
	private String fre_content; // 내용
	private Date fre_date; // 게시글 생성날짜(sysdate)
	private int fre_cnt; // 조회수
	private String fre_pict_afat; // 사진첨부(파일이름)
	private String admin_id; // 관리자 아이디(FK)
	private String mbr_id; // 회원 아이디(FK)
	

}