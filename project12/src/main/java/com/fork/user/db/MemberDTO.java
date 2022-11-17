package com.fork.user.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	
	private int m_no;
	private String m_id;
	private String m_name;
	private String m_email;
	private String m_nickName;
	private String m_pw;
	private String m_birth;
	private String m_gender;
	private String m_tel;
	private Timestamp m_regdate;
	
	
	
}
