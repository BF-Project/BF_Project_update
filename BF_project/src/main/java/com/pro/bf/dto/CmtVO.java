package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 댓글 테이블
 */
@Alias("cmt")
@Data
public class CmtVO {

	private int cmt_num; // key, 댓글 일련번호
	private String cmt_content; // 댓글 내용
	private Date cmt_date; // 댓글생성날짜
	private String admin_id; // 관리자 아이디(FK)
	private int fre_num; // 자유게시판 일련번호(FK)
	private int cmmt_num; // 커뮤니티게시판 일련번호(FK)
	private String mbr_id; // 회원 아이디(FK)
	
	
}