package com.it.apt.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.it.apt.member.model.MemberVO;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		
		logger.info("preHandle() 호출!, memVo={}", memVo);
		
		//로그인 X
		if(memVo==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 이용가능 합니다.');");			
			out.print("location.href='"+ request.getContextPath() +"/login/login.do';");
			out.print("</script>");
			
			return false;	//다음 컨트롤러를 수행하지 않음			
		}else{	//로그인 한 경우
			
		}
		
		return true;
	}
	
	
}
