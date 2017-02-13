package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현 <br>
 * 결제 테이블
 */
@Alias("payment")
@Data
public class PaymentVO {

	private int payment_num; // key, 일련번호
	private char payment_rfd; // 환불여부(default : N)
	private String payment_money; // 결제금액
	private int payment_quty; // 잔여사용횟수
	private Date payment_date; // 결제날짜
	private char c_phone_payment; // 핸드폰결제 여부
	private char card_payment; // 카드결제 여부
	private char npb_payment; // 무통장결제 여부
	private String mbr_id; // 회원아이디(FK)
	
	
}