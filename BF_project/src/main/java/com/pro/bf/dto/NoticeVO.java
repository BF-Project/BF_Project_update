package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 공지사항 테이블
 */
@Alias("notice")
@Data
public class NoticeVO {

	private int notice_num; // key, 공지사항 게시글 번호
	
	private String notice_title; // 제목
	
	private String notice_content; // 내용
	
	private int notice_cnt; // 조회수
	
	private Date notice_date; // 게시날짜
	
	private String notice_pict_afat; // 첨부파일(사진이름)
	
	private String admin_id; // 관리자 아이디(FK)
	
	
}