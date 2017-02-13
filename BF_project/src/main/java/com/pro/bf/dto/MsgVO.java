package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 메시지 테이블
 */
@Alias("motel")
@Data
public class MsgVO {

	private int msg_num; // key, 일련번호
	private Date msg_sendDate; // 메시지 보낸날짜
	private char msg_check; // 메시지 확인여부(Y / N)
	private String msg_trm_content; // 발신 메시지 내용
	private String msg_rcv_content; // 수신 메시지 내용
	private String msg_trmt; // 발신자
	private String msg_rcvr; // 수신자
	private String mbr_id; // 회원아이디(PK)
	private String admin_id; // 관리자아이디(PK)
	
	
}