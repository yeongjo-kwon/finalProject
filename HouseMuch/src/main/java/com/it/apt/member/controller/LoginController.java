package com.it.apt.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
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
			}//
			
			logger.info("authCode={}", authCode);
			session.setAttribute("authCodeMain", authCode);   
		
		//if
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
	   
   //이메일 인증-아이디 찾기  or 비밀번호 찾기
   @ResponseBody
   @RequestMapping("/findIdMail.do")
   public String mailCheckId(@RequestParam String memberName, @RequestParam String email, @RequestParam String or) {
	   logger.info("이메일 데이터 전송 중.. 보내는 email={}, memberName={}", email, memberName);
	   logger.info("FIND ID라면 1, PWD라면 2 ::::::::::: or = {}", or);
	   
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
		   
		   if(or.equals("1")) {
			   eVo.setSubject("HOUSEMUCH 아이디 찾기 이메일 인증번호 입니다.");			   
		   }else if(or.equals("2")) {
			   eVo.setSubject("HOUSEMUCH 비밀번호 찾기 이메일 인증번호 입니다.");	//제목			   
		   }
			
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
   
   @RequestMapping("/findPwdChkId.do")
   public String findPwdChkId(@RequestParam String id, Model model) {
	   logger.info("비밀번호 찾기! - ID존재 ? id={}", id);
	   
	   int check=memberService.checkDup(id);
	   logger.info("아이디 유무::::{}", check);
	   
	   if(check==MemberService.EXIST_ID) {	//아이디 있을때
		   
		   MemberVO mVo=memberService.selectMember(id);
		   String email = mVo.getEmail();
		   logger.info("해당 id의 email={}", email);
		   int gol = email.indexOf("@");
		   int dot = email.indexOf(".");
		   
		   logger.info("subString 결과 : {}", email.substring(2, gol));
		   String e1=email.replaceAll("(?<=.)[^@\n](?=[^@\n]*?[^@\n]@)|(?:(?<=@.)|(?!^)\\G(?=[^@\n]*$)).(?=.*[^@\n]\\.)","*");
		   logger.info("*표 처리화 e1={}", e1);

		   
		   model.addAttribute("email", e1);
		   model.addAttribute("realEmail", mVo.getEmail());
		   
		   return "login/findPwdEmail";
	   }else { //아이디 없을때
		   String msg="아이디가 존재하지 않습니다.";
		   String url="/login/findPwd.do";
		   
		   model.addAttribute("msg", msg);
		   model.addAttribute("url", url);
		   
		   return "common/message";
	   }
   }
   
   @RequestMapping(value="/findResetPwd.do", method = RequestMethod.GET)
   public String findRestPwd_get(@RequestParam String email, @RequestParam String memberName, Model model) {
      logger.info("비밀번호 재설정 화면 보여주기");
      logger.info("email :::::::: {} , memberName ::::::::::::: {}", email, memberName);
      
      if(email==null || email.isEmpty() || memberName==null || memberName.isEmpty()) {
    	  String msg="잘못된 url 경로 입니다.";
    	  String url="/login/login.do";
    	  
    	  model.addAttribute("msg", msg);
    	  model.addAttribute("url", url);
    	  
    	  return "common/message";
      }
      
      model.addAttribute("email", email);
      model.addAttribute("memberName", memberName);
      
      return "login/findResetPwd";
   }

   @RequestMapping(value="/findResetPwd.do", method = RequestMethod.POST)
   public String findRestPwd_post(@ModelAttribute MemberVO vo, Model model) {
	   logger.info("비밀번호 재설정 화면 보여주기222222222");
	   logger.info("email :::::::: {} , memberName ::::::::::::: {}", vo.getEmail(), vo.getMemberName());
	   logger.info("pwd 설정~ input Pwd={}", vo.getPwd());
	   
		String enPWd=passwordEncoder.encode(vo.getPwd());	//암호화 처리
		logger.info("암호화 처리 한 pwd={}", enPWd);
		
		boolean testbool = passwordEncoder.matches(vo.getPwd(), enPWd);
		logger.info("!!!!!!!!!!!!!!!!!!!!!!되냐???????????????????? testbool={}", testbool);

		vo.setPwd(enPWd);	   
		
		int cnt=memberService.updatePwd(vo);
		logger.info("::::::::update 처리 완료 ?? :::::::: {}", cnt);
		
		String msg="비밀번호 변경 실패..", url="/login/findResetPwd.do";
		if(cnt>0) {
			msg="비밀번호가 성공적으로 변경되었습니다.";
			url="/login/login.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
   }
	      
}