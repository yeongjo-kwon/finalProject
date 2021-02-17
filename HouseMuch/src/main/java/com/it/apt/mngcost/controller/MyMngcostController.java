package com.it.apt.mngcost.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.apt.apart.model.ApartService;
import com.it.apt.apart.model.ApartVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.mngcost.model.IMPVO;
import com.it.apt.mngcost.model.MngcostMainCtgVO;
import com.it.apt.mngcost.model.MngcostPaymentListVO;
import com.it.apt.mngcost.model.MngcostService;

@Controller
@RequestMapping("/userDash/myMngcost")
public class MyMngcostController {
	private static final Logger logger
		=LoggerFactory.getLogger(MngcostController.class);
	
	@Autowired private MngcostService mngcostService;
	@Autowired private MemberService memberService;
	@Autowired private ApartService apartService;
	
	@RequestMapping("/myMngcostInquiry.do")
	public void myMngcostInquiry(HttpSession session, Model model) {
		logger.info("관리비조회 페이지");
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		List<MngcostMainCtgVO> mngcostMainCtgList
			=mngcostService.selectMCtgList();
		logger.info("관리비 대분류 조회 결과 mngcostMainCtgList={}",
										mngcostMainCtgList);
		
		List<MngcostPaymentListVO> mngcostPayList
			=mngcostService.selectPayList(memVo.getHouseholdCode());
		logger.info("관리비 납부내역 조회 결과 mngcostPayList={}",
										mngcostPayList);
		model.addAttribute("mngcostMainCtgList", mngcostMainCtgList);
		model.addAttribute("mngcostPayList", mngcostPayList);
	}
	
	@RequestMapping("/myMngcostPayment.do")
	public void myMngcostPayment(@RequestParam(defaultValue = "0")int mngcostListNo,
			HttpSession session, Model model) {
		logger.info("관리비 미납내역 화면, 파라미터 mngcostListNo={}", mngcostListNo);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		ApartVO apartVo
			=apartService.selectAptByAptNo(memberService.selectAptNo(memVo.getId()));
		
		List<MngcostPaymentListVO> mngcostPayList
			=mngcostService.selectUnpaidPaymentList(memVo.getHouseholdCode());
		logger.info("관리비 납부내역 조회 결과 mngcostPayList={}", mngcostPayList);
	
		model.addAttribute("apartVo", apartVo);
		model.addAttribute("mngcostPayList", mngcostPayList);
	}
	
	@RequestMapping("/myMngcostPaymentIMP.do")
	public void myMngcostPaymentIMP(@ModelAttribute IMPVO impVo, Model model) {
		logger.info("관리비 납부 결제페이지, 파라미터 impVo={}", impVo);
		
		model.addAttribute("impVo", impVo);
	}
}
