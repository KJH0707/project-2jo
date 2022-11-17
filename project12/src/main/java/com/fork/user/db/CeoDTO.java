package com.fork.user.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CeoDTO {
	
	private int c_no;
	private String c_id;
	private String c_name;
	private String c_email;
	private String c_nickName;
	private String c_pw;
	private String c_tel;
	private Timestamp c_regdate;
	
	
	
}
