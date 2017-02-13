package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 커뮤니티 게시판 테이블
 */
@Alias("cmmt")
@Data
public class CommunityVO {

	private int cmmt_num; // key, 커뮤니티 게시판 게시글 번호
	private String cmmt_title; // 게시판 제목
	private String cmmt_content; // 게시판 내용
	private int cmmt_cnt; // 게시판 조회수
	private Date cmmt_date; // 게시판 게시날짜(sysdate)
	private String cmmt_pict_afat; // 사진첨부(파일이름)
	private String admin_id; // 관리자 아이디(FK)
	private String mbr_id; // 회원 아이디(FK)
	
	
}