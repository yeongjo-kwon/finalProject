package com.it.apt.member.controller;

import java.io.File;
import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.apt.adminMaster.model.ApartmentToSuperVO;
import com.it.apt.adminMaster.model.MasterService;
import com.it.apt.common.FileUploadUtil;
import com.it.apt.email.controller.EmailService;
import com.it.apt.email.model.EmailVO;
import com.it.apt.household.model.HouseholdService;
import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MasterService masterService;
	@Autowired private MemberService memberService;
	@Autowired private EmailService emailService;
	@Autowired private HouseholdService householdService;
	
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private FileUploadUtil fileUtil;

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
		
		if(hp1==null || hp1.isEmpty() || hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
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
	
	//이메일 인증-회원가입/회원수정 이메일
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
		eVo.setSubject("HOUSEMUCH 이메일 인증번호 입니다.");	//제목
		
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
	
	//내 계정 관리
	@RequestMapping(value="/userDash/myAccount/memberEdit.do", method=RequestMethod.GET)
	public void memberEdit_get(HttpServletRequest req,Model model) {
		logger.info("회원수정 화면");
		
		HttpSession session = req.getSession();
	    MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		HouseholdVO hVo=householdService.selectByCode(memVo.getHouseholdCode());
		
		model.addAttribute("hVo", hVo);
	}

	//회원수정
	@RequestMapping(value="/userDash/myAccount/editFrm.do", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO mVo, MultipartHttpServletRequest mtfRequest,HttpServletRequest request, HttpSession session,Model model) {
		logger.info("회원수정 화면 ::: mVo={}", mVo);
		
		MultipartFile mf = mtfRequest.getFile("file");
		logger.info("@@@@@@@@@@@@1번째 처리 :::: file={}",mf);
		
		//원래 memVo
	    MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		
		String orifileName=mf.getOriginalFilename();
		String fileName="";
		
		if(orifileName==null || orifileName.isEmpty()) {
			orifileName="member-default.jpg";
			fileName="member-default.jpg";
		}else {
			fileName=fileUtil.getUniqueFileName(orifileName);
	
			// 파일 저장 
			// 파일을 실제 서버에 저장
			// 웹서비스 root 경로​
			String root_path = request.getSession().getServletContext().getRealPath("/");  
			String attach_path = "resources/user_images/";
			String safeFile=root_path+attach_path+fileName;
			logger.info("safeFile={}", safeFile);
			
			try { 
				mf.transferTo(new File(safeFile)); //업로드
			}catch (IllegalStateException e) {
				logger.info("파일 업로드 실패..");
				e.printStackTrace();
			} catch (IOException e) {
				logger.info("파일 업로드 실패..");
				e.printStackTrace();
			}
			
		}
		logger.info("@@@@@@@@2번째 디버깅 orifileName={}, fileName={}",orifileName,fileName);

		
		mVo.setMemberImgFilename(fileName);
		mVo.setMemberImgOriginalFilename(orifileName);
		
		String hp1=mVo.getHp1();
		String hp2=mVo.getHp2();
		String hp3=mVo.getHp3();
		
		if(hp1==null || hp1.isEmpty() || hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}
		mVo.setHp1(hp1);
		mVo.setHp2(hp2);
		mVo.setHp3(hp3);
		
		int cnt = memberService.updateMember(mVo);
		logger.info("@@@@@@@@@3번째 디버깅 수정 결과 cnt={}", cnt);
		String msg="회원 수정 실패", url="/userDash/myAccount/memberEdit.do";
		
		HouseholdVO hVo=householdService.selectByCode(memVo.getHouseholdCode());
		logger.info("@@@@@@@@@4번째 디버깅 해당 회원의 authCode={}", hVo.getAuthCode());
		if(!hVo.getAuthCode().equals("RESIDENT")) {
			url="/admin/adminEdit.do";
		}
		
		if(cnt>0) {
			msg="회원정보가 수정되었습니다";
		}
		
		session.removeAttribute("memVo");
		MemberVO memberVo = memberService.selectMember(mVo.getId());
		session.setAttribute("memVo", memberVo);
		
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	
	//회원수정 - 비밀번호 변경
	@RequestMapping("/userDash/myAccount/editPwd.do")
	public String editPwd(@RequestParam String pwd, @RequestParam String nowPwd, HttpSession session ,Model model) {
		logger.info("비밀번호 변경, 변경할 pwd={}, 회원이 입력한 현재 비밀번호 nowPwd={}",pwd,nowPwd);
		
	    MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		
	    int result=memberService.loginCheck(memVo.getId(), nowPwd);
		logger.info("현재 비밀번호가 맞는지 결과 result={}", result);
		
		String msg="비밀번호 수정 실패", url="/userDash/myAccount/memberEdit.do";
		
		HouseholdVO hVo=householdService.selectByCode(memVo.getHouseholdCode());
		logger.info("해당 회원의 authCode={}", hVo.getAuthCode());
		if(!hVo.getAuthCode().equals("RESIDENT")) {
			url="/admin/adminEdit.do";
		}
		
		if(result==MemberService.LOGIN_OK) {	//일치
			logger.info("비밀번호 일치!!!!!!!!!!");
			
			String enPWd=passwordEncoder.encode(pwd);	//암호화 처리
			logger.info("암호화 처리 한 pwd={}", enPWd);

			memVo.setPwd(enPWd);
			int cnt=memberService.updatePwd(memVo);
			logger.info("::::::::update 처리 완료 ?? :::::::: {}", cnt);
			if(cnt>0) {
				msg="비밀번호가 수정 되었습니다.";
			}
		}else {
			msg="현재 비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//회원탈퇴
	@RequestMapping("/userDash/myAccount/withdraw.do")
	public String withdraw(@RequestParam String withdrawPwd, HttpSession session,HttpServletResponse response,Model model) {
		logger.info("눈물의 회원탈퇴 ㅜㅜ withdrawPwd={}", withdrawPwd);
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		
		int result=memberService.loginCheck(memVo.getId(), withdrawPwd);
		logger.info("현재 비밀번호가 맞는지 결과 result={}", result);
		
		String msg="회원탈퇴 실패", url="/userDash/myAccount/memberEdit.do";
		
		HouseholdVO hVo=householdService.selectByCode(memVo.getHouseholdCode());
		logger.info("해당 회원의 authCode={}", hVo.getAuthCode());
		if(!hVo.getAuthCode().equals("RESIDENT")) {
			url="/admin/adminEdit.do";
		}
		
		if(result==MemberService.LOGIN_OK) {	//일치
			
			int cnt=memberService.withdrawMember(memVo.getId());
			logger.info("회원 탈퇴 결과 cnt={}", cnt);
			if(cnt>0) {
				msg="회원 탈퇴 되었습니다.";
				url="";
				
				session.removeAttribute("memVo");
				
				Cookie ck = new Cookie("ck_id", memVo.getId());
				ck.setPath("/");
				ck.setMaxAge(0); //쿠키제거
				response.addCookie(ck);
			}
			
		}else {
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
