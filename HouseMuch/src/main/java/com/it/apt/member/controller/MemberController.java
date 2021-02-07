package com.it.apt.member.controller;

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

import com.it.apt.adminMaster.model.ApartmentToSuperVO;
import com.it.apt.adminMaster.model.MasterService;
import com.it.apt.email.controller.EmailService;
import com.it.apt.email.model.EmailVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MasterService masterService;
	@Autowired private MemberService memberService;
	@Autowired private EmailService emailService;
	@Autowired private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value="/register/registerApt.do", method = RequestMethod.GET)
	public void adminRegister_get() {
		logger.info("APT신청하기 View!!");
	}
		
	@RequestMapping(value="/register/registerApt.do", method = RequestMethod.POST)
	public String adminRegister_post(ApartmentToSuperVO msgVo, Model model) {
		logger.info("Apt 신청하기 진행! msgVo={}", msgVo);
		
		int cnt=masterService.insertMsg(msgVo);
		logger.info("등록 성공 여부 cnt={}", cnt);
		
		String msg="등록 실패!..", url="/register/registerApt.do";
		if(cnt>0) {
			msg="신청 확인 후 연락 드리겠습니다.(주말 제외, 최대 3일 소요)";
			url="/main/index.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/register/registerChkKey.do", method=RequestMethod.GET)
	public void registerKey_get() {
		logger.info("세대코드 입력 View!!");
	}

	@RequestMapping(value="/register/registerChkCodeKey.do", method=RequestMethod.GET)
	public String registerKey_post(@RequestParam(defaultValue="0")String key, Model model) {
		logger.info("세대코드 입력 ! 세대코드={}", key);
		
		String msg="세대코드를 입력해주세요.", url="/register/registerChkKey.do";
		if(!key.equals("0")) {
			int result=memberService.chkCodeKey(key);
			
			if(result==0) {
				msg="유효하지 않은 세대코드 입니다.";
			}else {
				msg="세대코드 확인 되었습니다.";
				url="/register/registerAgree.do?householdCode="+key;
			}			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";			
		
	}

	@RequestMapping(value="/register/registerMember.do", method=RequestMethod.GET)
	public void register_get() {
		logger.info("회원가입 View!!");
	}

	@RequestMapping(value="/register/registerMember.do", method=RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVO mVo, Model model) {
		logger.info("회원가입! mVo={}", mVo);
		
		String hp1=mVo.getHp1();
		String hp2=mVo.getHp2();
		String hp3=mVo.getHp3();
		
		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}
		mVo.setHp1(hp1);
		mVo.setHp2(hp2);
		mVo.setHp3(hp3);
		
		//암호화
		String inPwd=mVo.getPwd();	//사용자가 입력한 패스워드
		String enPWd=passwordEncoder.encode(inPwd);	//암호화 처리
		logger.info("암호화 처리 한 pwd={}", enPWd);
		
		boolean testbool = passwordEncoder.matches(inPwd, enPWd);
		logger.info("!!!!!!!!!!!!!!!!!!!!!!되냐???????????????????? testbool={}", testbool);

		mVo.setPwd(enPWd);
		
		int cnt=memberService.insertMember(mVo);
		logger.info("회원 가입 결과, cnt={}", cnt);
		
		String msg="회원가입 실패..", url="/register/registerMember.do";
		if(cnt>0) {
			msg="회원가입 되었습니다.";
			url="/login/login.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
	}

	@RequestMapping("/register/registerAgree.do")
	public String registerAgree_get(@RequestParam String householdCode, Model model) {
		logger.info("회원약관 View!!");
		
		if(householdCode==null || householdCode.isEmpty()) {
			String msg="잘못된 url 입니다.";
			String url="/main/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
		return "register/registerAgree";
	}
	
	@ResponseBody
	@RequestMapping("/register/ajaxCheckId.do")
	public boolean ajaxCheckId(@RequestParam String id) {
		logger.info("ajax 이용 - 아이디 중복 확인, userid={}", id);
		
		boolean bool=false;
		int result=memberService.checkDup(id);
		
		logger.info("아이디 중복 확인 결과, result={}",result);
		
		if(result==MemberService.EXIST_ID) {
			bool=true;
		}
		
		return bool;
	}	

	@ResponseBody
	@RequestMapping("/register/ajaxChkMail.do")
	public boolean ajaxChkMail(@RequestParam String email) {
		logger.info("ajax 이용 - 이메일 중복 확인, email={}", email);
		
		boolean bool=false;
		int result=memberService.checkDupEmail(email);
		
		logger.info("이메일 중복 확인 결과, result={}",result);
		
		if(result==MemberService.EXIST_ID) {
			bool=true;
		}
		
		return bool;
	}
	
	//이메일 인증-회원가입
	@ResponseBody
	@RequestMapping("/register/sendMail.do")
	public String mailCheckGet(@RequestParam String email) {
		logger.info("이메일 데이터 전송 중.. 보내는 email={}", email);
		String code=RandomStringUtils.randomNumeric(6);	//숫자랜덤6자리 code
		logger.info(":::::::::::::::::::::::::::::인증번호 6자리 전송 중..::::::::::::::::::::::::::::::::: code={}", code);
		
		EmailVO eVo = new EmailVO();
		eVo.setSenderName("HOUSEMUCH");	//발신자 이름
		eVo.setSenderMail("info@housemuch.com");	//발신자 이메일 주소
		eVo.setReceiveMail(email);	//수신자 이메일 주소
		eVo.setSubject("HOUSEMUCH 회원가입 이메일 인증번호 입니다.");	//제목
		
		String msg="<hr><h1>이메일 인증번호</h1><br> ";
		msg+="<b>HOUSEMUCH에 가입하신것을 환영합니다. <br> 아래의 인증번호를 인증번호 입력창에 입력해 주세요.</b><br>";
		msg+="<h1>"+code+"</h1><br>";
		msg+="<span>HOUSEMUCH를 이용해 주셔서 감사합니다.<br>더욱 편리한 서비스를  제공하기 위해 항상 최선을 다하겠습니다.</span>";
		eVo.setMessage(msg);
		
		try {
			emailService.sendMail(eVo);
		}catch(Exception e) {
			logger.info("이메일 발송 실패..");
			e.printStackTrace();
		}
		
		return code;
	}
	
	
}
