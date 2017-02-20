package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현	<br>
 * Q & A 게시판 테이블
 */
@Alias("qna")
@Data
public class QnAVO {

	private int qna_num; // key, 게시글 일련번호
	private String qna_title; // 제목
	private String qna_content; // 내용
	private int qna_cnt; // 조회수
	private Date qna_date; // 게시글 게시날짜
	private String qna_pict_afat; // 파일첨부(사진이름)
	private String mbr_id; // 회원이름(FK)
	private String qna_secrit;//비밀글
	private String qna_respond_yn; // 답변여부(관리자)
	private String qna_respond_content; // 답변내용(관리자)
	
}