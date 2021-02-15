package com.it.apt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.apt.adminLiving.notice.model.NoticeBoardVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
public class IndexController {

   private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

   @Autowired ApartService apartService;
   @Autowired MemberService memberService;
   
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
   
   @RequestMapping("/main/mainNotice.do")
   public void mainNotice(HttpServletRequest req,Model model) {
	   logger.info("메인화면에 보여줄 최근 Notice");
	   
	   HttpSession session = req.getSession();
	   MemberVO memVo = (MemberVO) session.getAttribute("memVo");
	   
	   int aptNo=memberService.selectAptNo(memVo.getId());
	   logger.info("aptNo={}", aptNo);

	   List<Map<String, Object>> noticeList=apartService.selectMainNotice(aptNo);
	   logger.info("noticeList.size()={}", noticeList.size());
	   
	   model.addAttribute("noticeList", noticeList);
   }
   
   @RequestMapping("/main/mainScheduler.do")
   public void mainScheduler() {
	   logger.info("메인에 보여줄 스케쥴러");
   }
}
