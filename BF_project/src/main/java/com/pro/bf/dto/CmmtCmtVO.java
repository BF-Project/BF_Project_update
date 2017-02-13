package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Alias("cmmtcmt")
@Data
public class CmmtCmtVO {

	private int cmmtcmt_num; //커뮤니티 게시판 댓글 번호
	private String cmmtcmt_content;//커뮤니티 게시판 댓글 내용
	private Date cmmtcmt_date;//커뮤니티 게시판 날짜
	private String admin_id;//관리자 아이디
	private int cmmt_num;//커뮤니티 게시판 일련번호
	private String mbr_id;//회원아이디
	
	
	
}
