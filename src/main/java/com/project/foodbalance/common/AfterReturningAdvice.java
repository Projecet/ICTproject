package com.project.foodbalance.common;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.project.foodbalance.member.model.vo.Member;

@Repository // dao �뿉 �쟻�슜�븯�뒗
@Aspect // aop 瑜� �쓽誘명븿
public class AfterReturningAdvice {
	// 濡쒓렇�씤 硫붿냼�뱶�뿉 ���븳 濡쒓렇 泥섎━瑜� 紐⑹쟻�쑝濡� �븯�뒗 �뼱�뱶諛붿씠�뒪

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Pointcut("execution(* com.test.first.member.model.dao.MemberDao.selectLogin(..))")
	public void loginPointcut() {	}

	// ��寃� 媛앹껜�쓽 硫붿냼�뱶媛� �떎�뻾 �썑 由ы꽩�맆 �븣 �옉�룞�릺�뒗 �뼱�뱶諛붿씠�뒪
	@AfterReturning(pointcut = "loginPointcut()", returning = "returnObj")
	public void loginLogging(JoinPoint jp, Object returnObj) {
		// 鍮꾩쫰�땲�뒪 硫붿냼�뱶媛� 由ы꽩�븷 寃곌낵 �뜲�씠�꽣瑜� �떎瑜� �슜�룄濡� 泥섎━�븷 �븣 �궗�슜�븷 �닔 �엳�쓬
		if (returnObj instanceof Member) {
			Member member = (Member) returnObj;
			logger.info(new Date() + "$" + member.getUser_id() + "$�떂�씠 �젒�냽�븯�뀲�뒿�땲�떎.");
		}
	}

}
