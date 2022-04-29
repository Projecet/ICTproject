package com.project.foodbalance.common;

import java.sql.Date;

public class Paging{
	
	private int startRow;
	private int endRow;
	private String keyword;
	private Date begin;
	private Date end;
	
	public Paging() {}

	public Paging(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	public Paging(int startRow, int endRow, String keyword) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.keyword = keyword;
	}
	
	public Paging(int startRow, int endRow, Date begin, Date end) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.begin = begin;
		this.end = end;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getkeyword() {
		return keyword;
	}

	public void setkeyword(String keyword) {
		this.keyword = keyword;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + ", keyword=" + keyword + ", begin=" + begin
				+ ", end=" + end + "]";
	}

	
	
}
