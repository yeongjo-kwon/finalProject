package com.it.apt.userDash.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/userDash")
public class UserDashMainController {
	private static final Logger logger
	   =LoggerFactory.getLogger(UserDashMainController.class);
	   
   @RequestMapping("/userDashMain.do")
   public void userDashMain(HttpSession session,Model model) {
      logger.info("입주민 대시보드 메인화면 보여주기 - userDashMain");
      
      MemberVO memVo=(MemberVO) session.getAttribute("memVo");
      logger.info("로그인한 회원정보 memVo={}",memVo);
      
      model.addAttribute("memVo", memVo);
      
   }
   
   
}
