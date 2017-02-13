package com.pro.bf.dto;

import java.sql.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

/**
 * @author 차승현<br>
 * 견적 테이블 
 */
@Alias("qtt")
@Data
public class QttVO {

	private int qtt_srl_num; // key, 견적 일련번호
	private Date qtt_dt; // 견적날짜(sysdate)
	private String qtt_rest_pict; // 견적결과 사진(파일이름)
	private int ole_num; // 온라인일련번호(FK)
	private int off_num; // 오프라인일련번호(FK)
	
	
}