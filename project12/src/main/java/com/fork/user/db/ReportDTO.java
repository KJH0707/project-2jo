package com.fork.user.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportDTO {
	
	private int rep_no;
	private int s_no;
	private int rep_howmany;
	private String rep_reason;
	private String rep_memo;

	
	
	
}
