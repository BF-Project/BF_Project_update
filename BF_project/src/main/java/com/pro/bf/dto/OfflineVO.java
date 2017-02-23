package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 오프라인 창업 테이블 ( DB table 명 : OFFLINE_ )
 */
@Alias("offline")
@Data
public class OfflineVO {

	private int off_num; // key, 일련번호
	private String off_kind; // 창업종류
	private String off_asst; // 보유자산
	private String off_datailAddr; // 상세주소 입력
	private float pop_score; // 인구 일련번호(FK)
	private float tour_score; // 관광 일련번호(FK)
	private float shop_score; // 상가 일련번호(FK)
	private float lent_score; // 임대 일련번호(FK)
	private float flo_score; // 유동인구 일련번호(FK)
	private float mt_score; // 숙박 일련번호(FK)
	private String mbr_id; // 회원아이디(FK)
	private String sales;
	private String benefit;
	
	
}
