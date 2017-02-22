package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 온라인 창업 테이블 ( DB table 명 : ONLINE_ )
 */
@Alias("online")
@Data
public class OnlineVO {

	private int ole_num; // key, 일련번호
	private String ole_trd_sts; // 사업여부
	private String ole_mkt_sts; // 마케팅여부
	private String ole_pdt_sts; // 상품관리여부
	private String ole_psl_pdt_sts; // 물리적상품관리여부
	private String ole_dgt_pdt_sts; // 디지털상품여부
	private String ole_pfbl_sts; // 수익성분석여부
	private String ole_siteMap_sts; // 사이트맵여부
	private String ole_pdt_prdt_sts; // 상품직접성산여부
	private String ole_copt_cnc_sts; // 제조협력업체여부
	private String ole_item_orgt_sts; // 아이템독창성여부
	private String ole_cstm_ast_sts; // 고객관리계획여부
	private String ole_asst; // 보유자산
	private String mbr_id; // 회원 아이디(FK)
	private String sales;
	private String benefit;
	
	
}