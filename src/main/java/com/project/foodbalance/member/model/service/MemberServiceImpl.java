package com.project.foodbalance.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.member.model.dao.MemberDao;
import com.project.foodbalance.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired  //자동 의존성주입 처리됨 (자동 객체생성됨)
	private MemberDao memberDao;
	
	//로그인
	@Override
	public Member selectLogin(String user_id) {
		return memberDao.selectLogin(user_id);
	}

	//로그인시 스택 초기화
	@Override
	public int updateLoginStack(Member member) {
		return memberDao.updateLoginStack(member);
	}
	
	//로그인 제한 여부
	@Override
	public int updateLoginOk(Member member) {
		return memberDao.updateLoginOk(member);
	}
	
	//비밀번호 암호화
	@Override
	public int updatePwdEncoding(Member member) {
		return memberDao.updatePwdEncoding(member);
	}
	
	//회원가입
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	
	//회원가입시 아이디 중복 체크
	@Override
	public int selectDupCheckId(String user_id) {
		return memberDao.selectDupCheckId(user_id);
	}
	
	//네이버 로그인시 메일 체크
	@Override
	public Member dupCheck(String email) {
		return memberDao.dupCheck(email);
	}
	
	//네이버  메일조회
	@Override
	public Member selectUser(String user_email) {
		return memberDao.selectUser(user_email);
	}
	@Override
	public String selectfindId(Member member) {
		return memberDao.selectfindId(member);
	}

	
	
	
	
}
