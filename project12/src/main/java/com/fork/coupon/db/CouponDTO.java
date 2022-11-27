package com.fork.coupon.db;

import lombok.Data;

@Data
public class CouponDTO {

	private String c_code;
	private int m_no;
	private int isUse;
	private String c_name;
	private String c_sdate;	// 배포시작일
	private String c_edate;    // 배포종료일
	private int c_quantity; // 수량
	private String c_place;
	private String deleted;
	private String message;
	
}
