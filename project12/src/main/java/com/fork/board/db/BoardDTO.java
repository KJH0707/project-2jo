package com.fork.board.db;

import java.io.File;
import java.sql.Date;

import com.fork.store.db.StoreDTO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardDTO extends StoreDTO {
	private int rev_no;
	private int s_no;
	private Date rev_date;
	private int rev_star;
	private int rev_category;
	private int m_no;
	private String qna_sort;
	private String rev_subject;
	private String rev_content;
	private String rev_file;
	private int rev_seq;
	private int rev_ref;
	private String s_addr;
	private String m_nickName;
	private String m_id;
	

	
	
	
}
