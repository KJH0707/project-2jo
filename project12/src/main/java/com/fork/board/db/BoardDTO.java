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

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

	public int getRev_star() {
		return rev_star;
	}

	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}

	public int getRev_category() {
		return rev_category;
	}

	public void setRev_category(int rev_category) {
		this.rev_category = rev_category;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getQna_sort() {
		return qna_sort;
	}

	public void setQna_sort(String qna_sort) {
		this.qna_sort = qna_sort;
	}

	public String getRev_subject() {
		return rev_subject;
	}

	public void setRev_subject(String rev_subject) {
		this.rev_subject = rev_subject;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRev_file() {
		return rev_file;
	}

	public void setRev_file(String rev_file) {
		this.rev_file = rev_file;
	}

	public String getS_addr() {
		return s_addr;
	}

	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}

	@Override
	public String toString() {
		return "BoardDTO [rev_no=" + rev_no + ", s_no=" + s_no + ", rev_date=" + rev_date + ", rev_star=" + rev_star
				+ ", rev_category=" + rev_category + ", m_no=" + m_no + ", qna_sort=" + qna_sort + ", rev_subject="
				+ rev_subject + ", rev_content=" + rev_content + ", rev_file=" + rev_file + ", s_addr=" + s_addr + "]";
	}
	
	
}
