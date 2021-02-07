package com.it.apt.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
   private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
   
   @Autowired private MemberService memberService;
   
   @RequestMapping(value="/login.do", method=RequestMethod.GET)
   public void login_get() {
      logger.info("로그인 화면 보여주기");
   }
   
   @RequestMapping(value="/login.do", method = RequestMethod.POST)
   public String login_post(@ModelAttribute MemberVO vo, @RequestParam(required = false)String chkSave, HttpServletRequest request,
		  HttpServletResponse response, Model model ) {
	   logger.info("로그인 처리! vo={}, chkSave={}", vo, chkSave);
	   
	   int result=memberService.loginCheck(vo.getId(), vo.getPwd());
	   logger.info("로그인 처리 결과 result={}", result);
	   
	   String msg="로그인 실패..", url="/login/login.do";
	   if(result==MemberService.LOGIN_OK) {	//로그인 성공
		   MemberVO memVo = memberService.selectMember(vo.getId());
		  
		   int aptNo = memberService.selectAptNo(vo.getId());
		   logger.info("해당 유저의 아파트 번호 조회, aptNo={}", aptNo);
		   
		   // session
		   HttpSession session=request.getSession();
		   session.setAttribute("memVo", memVo);
		   
		   // cookie
		   Cookie ck = new Cookie("ck_id", vo.getId());
		   ck.setPath("/");
		   if(chkSave!=null) {	//체크한 경우
			   ck.setMaxAge(1000*24*60*60);
		   }else {	//안한 경우
			   ck.setMaxAge(0);
		   }
		   response.addCookie(ck);
		   
		   msg=memVo.getMemberName()+"님 환영합니다!";
		   
		   //권한에 따라 각각의 메인뷰 설정
		   String authCode = memberService.selectAuth(memVo.getId());
		   
		   if(authCode.equals("RESIDENT")) {
			   url="/main/main.do";
		   }else if(authCode.equals("ADMIN")) {
			   url="/admin/adminMaster/adminMaster.do";
		   }else if(authCode.equals("OWNER")) {
			   url="/admin/adminOwner/adminOwnerMain.do";
		   }else if(authCode.equals("ACCOUNT_MNG")) {	//회계관리자
			   url="/admin/adminAllMain.do";
		   }else if(authCode.equals("FACILITY_MNG")) {	//시설관리자 - 수정해야함
			   url="/admin/adminAllMain.do";
		   }else if(authCode.equals("LIVING_MNG")) {
			   url="/admin/adminLiving/adminLiving.do";
		   }
		   
		   
		   //관리자 - 권한처리 해서 로그인하면 바로 각각의 관리자 뷰에 들어가게끔
		   
	   }else if(result==MemberService.PWD_DISAGREE) {	//비밀번호 불일치
		   msg="비밀번호가 일치하지 않습니다.";
	   }else if(result==MemberService.ID_NONE) {	//아이디 존재X
		   msg="해당 아이디가 존재하지 않습니다.";
	   }
	   
	   model.addAttribute("msg", msg);
	   model.addAttribute("url", url);
	   
	   return "common/message";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session, Model model) {
	   MemberVO memVo=(MemberVO) session.getAttribute("memVo");
	   
	   logger.info("로그아웃 처리, 파라미터 id={}", memVo.getId());
	   
	   session.removeAttribute("memVo");
	   
	   model.addAttribute("msg", "로그아웃 되었습니다");
	   model.addAttribute("url", "/main/index.do");
		
	   return "common/message";
   }
   
   
   @RequestMapping(value="/findId.do", method = RequestMethod.GET)
   public void findId_get() {
      logger.info("아이디 찾기 화면 보여주기");
   }

   @RequestMapping(value="/findPwd.do", method = RequestMethod.GET)
   public void findPwd_get() {
      logger.info("비밀번호 찾기 화면 보여주기");
   }
   
   @RequestMapping("/findIdAll.do")
   public void findIdAll() {
      logger.info("전체 아이디 출력");
   }
   
   @RequestMapping(value="/findResetPwd.do", method = RequestMethod.GET)
   public void findRestPwd_get() {
      logger.info("비밀번호 재설정 화면 보여주기");
   }
      
}