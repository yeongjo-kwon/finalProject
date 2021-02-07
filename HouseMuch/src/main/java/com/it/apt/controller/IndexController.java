package com.it.apt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.apt.apart.model.ApartService;
import com.it.apt.member.model.MemberVO;

@Controller
public class IndexController {

   private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

   @Autowired ApartService apartService;
   
   @RequestMapping("/user/chat/chat.do")
   public void chat() {
	   logger.info("chat 화면 띄우기..");
   }
   
   @RequestMapping(value = "/user/mydash/userDash.do", method = RequestMethod.GET)
   public void index() {
      logger.info("에러가 안나라 얍!!");
   }   
   
   @RequestMapping("/main/index.do")
   public void index_main() {
      logger.info("비회원 메인 화면 전체 보여주기");
   }   

   @RequestMapping("/main/main.do")
   public void main(HttpServletRequest req,Model model) {
      logger.info("메인 화면 보여주기");
      
      HttpSession session = req.getSession();
      MemberVO memVo = (MemberVO) session.getAttribute("memVo");
      String aptName = apartService.selectAptNameById(memVo.getId());
      
      logger.info("로그인 한 id={}, 해당 회원의 아파트 이름 aptName={}", memVo.getId(), aptName);
      
      model.addAttribute("aptName",aptName);
   }

}
