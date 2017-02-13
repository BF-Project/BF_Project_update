package com.pro.bf.dto;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


/**
 * @author 차승현<br>
 * 이메일을 보내기위해 정보를 담는 VO클래스
 */
@Alias("email")
@Data
public class EmailVO {

	private String sender; // 보내는 사람 / 운영자
	private String to; // 받는 사람
	private String context; // 내용
	private String title; // 제목
	

}