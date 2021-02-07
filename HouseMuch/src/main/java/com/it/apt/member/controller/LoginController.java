package com.it.apt.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.email.controller.EmailService;
import com.it.apt.email.model.EmailVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
   
	@Autowired private MemberService memberService;
	@Autowired private EmailService emailService;
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 화면 보여주기");
	}
   
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO vo, @RequestParam(required = false)String chkSave, HttpServletRequest request,
			HttpServletResponse response, Model model ) {
		logger.info("로그인 처리! vo={}, chkSave={}", vo, chkSave);
	   
		logger.info("@@@@@@@@@@@@@@@@@@@@@ pwd={}", vo.getPwd());
	   
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
				   url="/admin/adminAll/adminAllMain.do";
			   }else if(authCode.equals("FACILITY_MNG")) {	//시설관리자 - 수정해야함
				   url="/admin/adminAll/adminAllMain.do";
			   }else if(authCode.equals("LIVING_MNG")) {
				   url="/admin/adminLiving/adminLiving.do";
			   }
			   
			   
			   //관리자 - 권한처리 해서 로그인하면 바로 각각의 관리자 뷰에 들어가게끔
			   
		   }else if(result==MemberService.PWD_DISAGREE) {	//비밀번호 불일치
			   msg="비밀번호가 일치하지 않습니다.";
		   }else if(result==MemberService.ID_NONE) {	//아이디 존재X
			   msg="해당 아이디가 존재하지 않습니다.";
		   }//if
		   
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
   
	   @RequestMapping(value="/findIdAll.do", method = RequestMethod.POST)
	   public String findAllId_post(@RequestParam String memberName, @RequestParam String email, Model model) {
		   logger.info("전체 아이디 찾기! 가져온 name={}, email={}", memberName, email);
		   
		   if(memberName==null || memberName.isEmpty() || email==null || email.isEmpty()) {
			   String msg="잘못된 경로입니다.";
			   String url="/login/findId.do";
			   model.addAttribute("msg", msg);
			   model.addAttribute("url", url);
			   
			   return "common/message";
		   }
		   
		   MemberVO vo = new MemberVO();
		   vo.setMemberName(memberName);
		   vo.setEmail(email);
		   
		   String id=memberService.findId(vo);
		   
		   logger.info("찾은 id={}", id);
		   
		   model.addAttribute("id", id);
		   
		   return "login/findIdAll";
	   }
	   
	   //이메일 인증-아이디 찾기
	   @ResponseBody
	   @RequestMapping("/findIdMail.do")
	   public String mailCheckId(@RequestParam String memberName, @RequestParam String email) {
		   logger.info("이메일 데이터 전송 중.. 보내는 email={}, memberName={}", email, memberName);
	
		   MemberVO vo = new MemberVO();
		   vo.setEmail(email);
		   vo.setMemberName(memberName);
			
		   String code=RandomStringUtils.randomAlphanumeric(6);	//알파벳 + 숫자랜덤6자리 code
		   logger.info("@@@@@@@@@@@@@인증번호 6자리 전송한다면..@@@@@@@@@@@@@@@ code={}", code);
			
		   String id=memberService.findId(vo);
			
		   if(id!=null && !id.isEmpty()) {	//이름과 이메일을 잘 입력했다면 메일 전송 
			   EmailVO eVo = new EmailVO();
			   eVo.setSenderName("HOUSEMUCH");	//발신자 이름
			   eVo.setSenderMail("info@housemuch.com");	//발신자 이메일 주소
			   eVo.setReceiveMail(email);	//수신자 이메일 주소
			   eVo.setSubject("HOUSEMUCH 아이디 찾기 이메일 인증번호 입니다.");	//제목
				
				String msg="<hr><h1>이메일 인증번호</h1><br> ";
				msg+="<b>HOUSEMUCH 이용을 감사합니다. <br> 아래의 인증번호를 인증번호 입력창에 입력해 주세요.</b><br>";
				msg+="<h1>"+code+"</h1><br>";
				msg+="<span>HOUSEMUCH를 이용해 주셔서 감사합니다.<br>더욱 편리한 서비스를  제공하기 위해 항상 최선을 다하겠습니다.</span>";
				eVo.setMessage(msg);
				
				try {
					emailService.sendMail(eVo);
				}catch(Exception e) {
					logger.info("이메일 발송 실패..");
					e.printStackTrace();
				}			
			}//if
			
			return code;
			
	   }	
	   
	   @RequestMapping(value="/findPwd.do", method = RequestMethod.GET)
	   public void findPwd_get() {
	      logger.info("비밀번호 찾기 화면 보여주기");
	   }
	   
	   @RequestMapping(value="/findResetPwd.do", method = RequestMethod.GET)
	   public void findRestPwd_get() {
	      logger.info("비밀번호 재설정 화면 보여주기");
	   }
	      
}