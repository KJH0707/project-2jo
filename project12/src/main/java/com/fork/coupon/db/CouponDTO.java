package com.fork.coupon.db;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDTO {

	private String c_code;
	private int m_no;
	private int isUse;
	private String c_name;
	private Timestamp c_issue_date; // 발행일
	private Timestamp c_issue_end;  // 쿠폰만료일
	private Timestamp c_startDate;	// 배포시작일
	private Timestamp c_endDate;    // 배포종료일
	private int c_quantity; // 수량
	
	
}
