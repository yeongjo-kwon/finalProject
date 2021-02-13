package com.it.apt.userDash.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.suggestBoard.model.SuggestBoardVO;

@Controller
@RequestMapping("/userDash")
public class UserDashMainController {
	private static final Logger logger
	   =LoggerFactory.getLogger(UserDashMainController.class);
	
	@Autowired SuggestBoardService suggService;
	@Autowired MemberService memService;
	   
   @RequestMapping("/userDashMain.do")
   public void userDashMain(@ModelAttribute SuggestBoardVO suggVo
		   ,HttpSession session
		   ,Model model) {
      logger.info("입주민 대시보드 메인화면 보여주기 - userDashMain");
      
      MemberVO memVo=(MemberVO) session.getAttribute("memVo");
      logger.info("로그인한 회원정보 memVo={}",memVo);
      
      String id=memVo.getId();
      int aptNo=memService.selectAptNo(id);
      suggVo.setAptNo(aptNo); //로그인한 회원의 아파트번호 세팅
      suggVo.setMemberNo(memVo.getMemberNo()); //로그인한 회원의 회원번호 세팅
      logger.info("세팅된 아파트번호, 회원번호 aptNo={}, memberNo={}",aptNo, suggVo.getMemberNo());
      
      /* 내 건의글 최신 5건 조회 */
      List<Map<String, Object>> list
      	=suggService.selectSuggBoardOnlyFive(suggVo);
      logger.info("내 건의글 목록 최신 5건만 조회 결과, list.size={}",list.size());
      
      /* 시간 출력 */
      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
      String today=sdf.format(date);
      logger.info("현재 날짜 조회 결과, today={}",today);
      
      model.addAttribute("memVo", memVo);
      model.addAttribute("fList", list);
      model.addAttribute("today", today);
      
   }
   
   
}
