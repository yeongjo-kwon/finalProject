package com.it.apt.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.apt.household.model.HouseholdService;
import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired HouseholdService householdService;
	
	@RequestMapping(value="/adminEdit.do", method=RequestMethod.GET)
	public void memberEdit_get(HttpServletRequest req,Model model) {
		logger.info("회원수정 화면");
		
		HttpSession session = req.getSession();
	    MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		HouseholdVO hVo=householdService.selectByCode(memVo.getHouseholdCode());
		
		model.addAttribute("hVo", hVo);
	}
}
