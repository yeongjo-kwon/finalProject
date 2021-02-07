package com.it.apt.userDash.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userDash")
public class UserDashMainController {
	private static final Logger logger
	   =LoggerFactory.getLogger(UserDashMainController.class);
	   
   @RequestMapping("/userDashMain.do")
   public void userDashMain() {
      logger.info("입주민 대시보드 메인화면 보여주기 - userDashMain");
   }
}
