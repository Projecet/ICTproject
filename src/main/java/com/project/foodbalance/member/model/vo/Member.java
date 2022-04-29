package com.project.foodbalance.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	private static final long serialVersionUID = -4500832579558534798L;

	private String user_id;		//유저 아이디
	private String user_pwd; 	// 비번
	private String user_name; 	// 유저 이름
	private Date user_fnum; 	//생년월일
	private int user_enum;		//주민 뒷자리
	private String phone; 			//폰번호
	private String email; 		//이메일
	private String postcode; 	//우편번호
	private String address; 	//전체주소
	private String address1; 	//주소
	private String address2; 	//상세주소
	private String keyword; 	//키워드
	private String admin_ok;	//관리자 권한
	private String login_ok;	//로그인 권한
	private int login_stack;	//로그인 스택
	
	public Member() {
		super();
	}

	public Member(String user_id, String user_pwd, String user_name, Date user_fnum, int user_enum, String phone,
			String email, String postcode, String address, String address1, String address2, String keyword,
			String admin_ok, String login_ok, int login_stack) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_fnum = user_fnum;
		this.user_enum = user_enum;
		this.phone = phone;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.keyword = keyword;
		this.admin_ok = admin_ok;
		this.login_ok = login_ok;
		this.login_stack = login_stack;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUser_fnum() {
		return user_fnum;
	}

	public void setUser_fnum(Date user_fnum) {
		this.user_fnum = user_fnum;
	}

	public int getUser_enum() {
		return user_enum;
	}

	public void setUser_enum(int user_enum) {
		this.user_enum = user_enum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getAdmin_ok() {
		return admin_ok;
	}

	public void setAdmin_ok(String admin_ok) {
		this.admin_ok = admin_ok;
	}

	public String getLogin_ok() {
		return login_ok;
	}

	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}

	public int getLogin_stack() {
		return login_stack;
	}

	public void setLogin_stack(int login_stack) {
		this.login_stack = login_stack;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_fnum="
				+ user_fnum + ", user_enum=" + user_enum + ", phone=" + phone + ", email=" + email + ", postcode="
				+ postcode + ", address=" + address + ", address1=" + address1 + ", address2=" + address2 + ", keyword="
				+ keyword + ", admin_ok=" + admin_ok + ", login_ok=" + login_ok + ", login_stack=" + login_stack + "]";
	}
	
}

