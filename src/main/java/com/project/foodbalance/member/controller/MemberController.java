package com.project.foodbalance.member.controller;

import java.io.IOException;import java.io.PrintWriter;import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.project.foodbalance.member.model.service.MemberService;
import com.project.foodbalance.member.model.vo.Member;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private String reId = "";
	private String rePwd = "";
	private String reName = "";
	private String reEmail = "";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그인 페이지로 이동
	@RequestMapping("loginPage.do")
	public String moveLoginPage(Model model) {
		model.addAttribute("reid", reId);
		model.addAttribute("repwd", rePwd);
		
		return "member/login";
	}
	
	
	//로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(HttpServletRequest request, Member member, HttpSession session, SessionStatus status, Model model) {	
		//DB 레코드 불러오기
		Member loginMember = memberService.selectLogin(request.getParameter("inputID"));
					
		String id = request.getParameter("inputID");
		String pwd = request.getParameter("inputPassword");
		String remember = request.getParameter("inputRemember");
		String viewName = null;
			
		if(remember == null) {
			remember = "";
		}
			
		if(remember.equals("Remember")) {
			reId = id;
			rePwd = pwd;
		}else{
			reId = "";
			rePwd = "";
		}
			
			
		System.out.println("아이디 : "+id);
		System.out.println("비밀번호 : "+pwd);

		try {
			//로그인 성공
//			//로그인 성공 암호화
			if(loginMember != null && bcryptPasswordEncoder.matches(pwd, loginMember.getUser_pwd()) && loginMember.getLogin_ok().equals("Y")) {
				//로그인 제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
					
				session.setAttribute("loginMember", loginMember);
				status.setComplete();
					
				viewName = "common/main";
			}
				//로그인 성공 비암호화 (로그인 하면 비밀번호 암호화로 변경 시켜놓게 해놓음)//				if(loginMember != null && loginMember.getUser_pwd().equals(pwd) && loginMember.getLogin_ok().equals("Y")) {
//					//패스워드 암호화 처리(주석으로 조절)
//					loginMember.setUser_pwd(bcryptPasswordEncoder.encode(loginMember.getUser_pwd()));
//				    memberService.updatePwdEncoding(loginMember);
//					//로그인 제한 스택 초기화
//				    loginMember.setLogin_stack(0);
//					memberService.updateLoginStack(loginMember);
//	
//					session.setAttribute("loginMember", loginMember);
//					viewName = "common/main";

//				}

			//비밀번호 입력 실패 로그인 제한
			else if(loginMember.getLogin_stack() >= 5 ) {
				//제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
				//로그인 제한 부여
				loginMember.setLogin_ok("N");
				memberService.updateLoginOk(loginMember);
					
				model.addAttribute("message2", "로그인 제한");
				model.addAttribute("message3", "관리자 이메일로 문의해주세요");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 제한자 로그인 시도시
			else if(loginMember.getLogin_ok().equals("N")) {
				model.addAttribute("message2", "로그인 제한");
				model.addAttribute("message3", "관리자 이메일로 문의해주세요");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 실패
			else {
				//제한 스택 부여
				System.out.println("로그인 아이디: "+loginMember.getUser_id());
				System.out.println("로그인 스택: "+loginMember.getLogin_stack());
				loginMember.setLogin_stack(loginMember.getLogin_stack()+1);
				memberService.updateLoginStack(loginMember);
		
				model.addAttribute("message", "비밀번호 불일치");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			}catch(Exception e){
				model.addAttribute("message", "등록되지 않은 아이디입니다.");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			
			return viewName;
		}
	
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		//로그인할 때 생성한 세션객체를 없앰
		HttpSession session = request.getSession(false);
		//세션 객체가 있으면, 리턴받음
		//세션 객체가 없으면, null 리턴됨
		if(session != null) {
			session.invalidate();  //해당 세션객체 없앰
			return "common/main";
		}else {
			model.addAttribute("sessionout", "로그인 세션 만료");
			return "common/commonview";
		}
	}
	
	
	//회원 가입페이지 이동
	@RequestMapping("registerPage.do")
	public String moveEnrollPage() {
		return "member/register";
	}
	
	
	// 회원 가입 처리
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String memberInsertMethod( HttpServletRequest request, Member member, Model model) {
		logger.info("enroll.do : " + member);
		      
		String address = request.getParameter("postcode") + " "+ request.getParameter("address1") + " " + request.getParameter("address2");

		//주소 합치기
		member.setAddress(address);
		//패스워드 암호화 처리
		member.setUser_pwd(member.getUser_pwd());
		if (memberService.insertMember(member) > 0) {
		    model.addAttribute("register", "회원 가입을 완료");
		    return "common/main";
		} else {
		    model.addAttribute("message", "회원 가입 실패");
		    return "common/register";
		  }
	}
		   
	//아이디 중복 확인 체크 ajax 통신 요청 처리용 
	//ajax 통신은 뷸리졸버로 뷰파일을 리턴하면 안됨 (뷰페이지가 바뀜)
	//요청한 클라이언트와 출력스트림을 만들어서 통신하는 방식으로 값을 리턴함
	@RequestMapping(value = "idchk.do", method = RequestMethod.POST)
	public void dupIdCheckMethod(@RequestParam("user_id") String user_id, HttpServletResponse response) throws IOException {

		int idcount = memberService.selectDupCheckId(user_id);
		      
		   String returnValue = null;
		   if(idcount == 0) {
		    returnValue = "ok";
		   }else {
		       returnValue = "dup";
		   }
		      
		   //response를 이용해서 클라이언트로 출력스트림 만들고 값 보내기
		   response.setContentType("text/html; charset=utf-8");
		   PrintWriter out = response.getWriter();
		   out.append(returnValue);
		   out.flush();
		   out.close();
	}
	//아이디 찾기 페이지로 이동
	@RequestMapping("findIdPage.do")
	public String moveFindIdMethod() {
		return "member/find_id";
	}

	//아이디 찾은 결과 페이지로 이동
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public String findidMethod(Member member, Model model) {
		String user_id = memberService.selectfindId(member);
		
		if(user_id != null) {
			model.addAttribute("user_id", user_id);
			return "member/find_id2";
			
		}else {
			model.addAttribute("message", member.getUser_name() + "로 검색된 정보가 없습니다.");
			return "common/error";
		}
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping("findPwdPage.do")
	public String moveFindPwdMethod() {
		return "member/find_pw";
	}
	/*
		//아이디 검색용 (찾기)
		@RequestMapping(value = "findID.do", method = RequestMethod.POST)
		public String findPwdMethod(@RequestParam("user_name") String user_name, @RequestParam("email") String email, 
				Model model) {
			String value = null;
			Member member = memberService.selectUser(user_name);
			System.out.println(member);
			try {
				if(member == null) {
					model.addAttribute("message", "존재하지 않는 이름입니다.");
					value = "member/find_id";
				}else if(member != null && member.getUser_name().equals(user_name) == false) {
					model.addAttribute("message", "잘못된 이름을 입력하였습니다.");
					value = "member/find_id";
				}else if(member != null && member.getUser_name().equals(user_name) && member.getEmail().equals(email) == false) {
					model.addAttribute("message", "잘못된 이메일을 입력하였습니다.");
					value = "member/find_id";
				}
					
				return "member/find_id";
				
			}catch(Exception e){
				model.addAttribute("message", "아이디 찾기 실패 관리자에게 문의하세요");
				return "member/find_id";
			}
			
		}  	*/
}



	
	
	
	
	
	
	
	
	

