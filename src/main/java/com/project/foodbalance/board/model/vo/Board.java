package com.project.foodbalance.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {


	
	private static final long serialVersionUID = 1016365019432134656L;
	
	private int board_no;
	private String user_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_count;
	private String board_original_img;
	private String board_rename_img;
	private int board_ref;
	private int board_reply_ref;
	private int board_reply_lev;
	private int board_reply_seq;
	
	public Board() {
		super();
	}

	public Board(int board_no, String user_id, String board_title, String board_content, Date board_date,
			int board_count, String board_original_img, String board_rename_img, int board_ref, int board_reply_ref,
			int board_reply_lev, int board_reply_seq) {
		super();
		this.board_no = board_no;
		this.user_id = user_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_count = board_count;
		this.board_original_img = board_original_img;
		this.board_rename_img = board_rename_img;
		this.board_ref = board_ref;
		this.board_reply_ref = board_reply_ref;
		this.board_reply_lev = board_reply_lev;
		this.board_reply_seq = board_reply_seq;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public String getBoard_original_img() {
		return board_original_img;
	}

	public void setBoard_original_img(String board_original_img) {
		this.board_original_img = board_original_img;
	}

	public String getBoard_rename_img() {
		return board_rename_img;
	}

	public void setBoard_rename_img(String board_rename_img) {
		this.board_rename_img = board_rename_img;
	}

	public int getBoard_ref() {
		return board_ref;
	}

	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}

	public int getBoard_reply_ref() {
		return board_reply_ref;
	}

	public void setBoard_reply_ref(int board_reply_ref) {
		this.board_reply_ref = board_reply_ref;
	}

	public int getBoard_reply_lev() {
		return board_reply_lev;
	}

	public void setBoard_reply_lev(int board_reply_lev) {
		this.board_reply_lev = board_reply_lev;
	}

	public int getBoard_reply_seq() {
		return board_reply_seq;
	}

	public void setBoard_reply_seq(int board_reply_seq) {
		this.board_reply_seq = board_reply_seq;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", user_id=" + user_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_date=" + board_date + ", board_count=" + board_count
				+ ", board_original_img=" + board_original_img + ", board_rename_img=" + board_rename_img
				+ ", board_ref=" + board_ref + ", board_reply_ref=" + board_reply_ref + ", board_reply_lev="
				+ board_reply_lev + ", board_reply_seq=" + board_reply_seq + "]";
	}

	
}
