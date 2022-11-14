package com.fork.review.db;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewDTO {
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
	
	
}
