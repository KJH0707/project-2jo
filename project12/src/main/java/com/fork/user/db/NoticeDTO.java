package com.fork.user.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeDTO {
	
	private int n_no;
	private String n_title;
	private int n_readcount;
	private int n_isevent;
	private String n_img;
	private String n_content;
	private String n_eventSdate;
	private String n_eventEdate;
	private Timestamp n_date;
	
	
	
}
