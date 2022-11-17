package com.fork.user.db;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservDTO {
	private int res_no;
	private int s_no;
	private int m_no;
	private int res_num;
	private int res_time;
	private String res_date;
	private String res_name;
	private String res_msg;
	private int res_status;
}
