package com.fork.board.db;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentDTO {
	private String p_no;
	private int m_no;
	private int res_no;
	private int p_price;
	private String p_info;
	private int p_status;
	private Timestamp p_date;
	
	
}
