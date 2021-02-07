package com.it.apt.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.apt.adminMaster.model.ApartmentToSuperVO;
import com.it.apt.adminMaster.model.MasterService;
import com.it.apt.member.model.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MasterService masterService;
	@Autowired MemberService memberService;
	
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
}
