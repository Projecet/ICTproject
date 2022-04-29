package com.project.foodbalance.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.member.model.vo.Member;

public interface MemberService {

	Member selectLogin(String user_id);		//로그인
	int updateLoginStack(Member member);	//로그인시 스택 초기화
	int updateLoginOk(Member member);		//로그인 제한여부
	int updatePwdEncoding(Member member);	//비밀번호 암호화
	int insertMember(Member member);		//회원가입
	int selectDupCheckId(String user_id);	//회원가입시 아이디 중복 체크
	
	Member dupCheck(String email);			//네이버 로그인시 메일 체크
	Member selectUser(String user_email);	//네이버 메일등록
	
	// 이름, 이메일로 id 찾기


	String selectfindId(Member member);	
}
