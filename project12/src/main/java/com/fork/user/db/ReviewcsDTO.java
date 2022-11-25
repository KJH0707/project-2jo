package com.fork.user.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ReviewcsDTO {
	private int rev_no;
	private int s_no;
	private Timestamp rev_date;
	private int rev_star;
	private String rev_subject;
	private int rev_category;
	private int m_no;
	private String qna_sort;
	private String rev_content;
	private String rev_file;
	private int rev_ref;
	private int rev_seq;
	private String rev_c_re;
	private Timestamp rev_c_date;
	private String s_name;
	private String m_nickname;
	private String date;
	
}
