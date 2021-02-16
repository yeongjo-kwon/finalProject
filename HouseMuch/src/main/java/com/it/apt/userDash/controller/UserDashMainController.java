package com.it.apt.userDash.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminLiving.add.model.AddOrderVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.mngcost.model.InquiryInfoVO;
import com.it.apt.mngcost.model.MngcostInfoVO;
import com.it.apt.mngcost.model.MngcostPaymentListVO;
import com.it.apt.mngcost.model.MngcostService;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.suggestBoard.model.SuggestBoardVO;

@Controller
@RequestMapping("/userDash")
public class UserDashMainController {
	private static final Logger logger
	   =LoggerFactory.getLogger(UserDashMainController.class);
	
	@Autowired SuggestBoardService suggService;
	@Autowired MemberService memService;
	@Autowired MngcostService mngCostService;
	@Autowired AddService addService;
	   
   @RequestMapping("/userDashMain.do")
   public void userDashMain(@ModelAttribute SuggestBoardVO suggVo
		   ,InquiryInfoVO inqVo
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
      List<Map<String, Object>> fList
      	=suggService.selectSuggBoardOnlyFive(suggVo);
      logger.info("내 건의글 목록 최신 5건만 조회 결과, fList.size={}",fList.size());
      
      /* 시간 출력 */
      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
      String today=sdf.format(date);
      logger.info("현재 날짜 조회 결과, today={}",today);
      
      /* 현재 달 구하기 */
      Calendar cal = Calendar.getInstance();
      int month=cal.get(Calendar.MONTH)+1;
      logger.info("현재 달 조회 결과, month={}",month);
      
      /* 관리비 납부내역 조회하기 */
      List<MngcostPaymentListVO> pList
      	=mngCostService.selectPayList(memVo.getHouseholdCode());
      logger.info("관리비 납부내역 조회 결과 pList.size={}",pList.size());
      
      /* 세대코드 별 신청한 부가시설 조회하기 */
      
      
      model.addAttribute("memVo", memVo);
      model.addAttribute("fList", fList);
      model.addAttribute("today", today);
      model.addAttribute("month", month);
      model.addAttribute("pList", pList);
      
   }
   
	/*
	 * @RequestMapping("/selectMngcostUserdash.do")
	 * 
	 * @ResponseBody public List<MngcostInfoVO>
	 * selectMngcostUserdash(@ModelAttribute InquiryInfoVO inqVo ,HttpSession
	 * session){ logger.info("세대 별 관리비 상세 조회하기, 파라미터 inqVo={}", inqVo);
	 * 
	 * MemberVO memVo=(MemberVO) session.getAttribute("memVo");
	 * logger.info("로그인한 회원정보 memVo={}",memVo);
	 * 
	 * inqVo.setAptNo(memService.selectAptNo(memVo.getId()));
	 * inqVo.setHouseholdCode(memVo.getHouseholdCode());
	 * logger.info("관리비 상세보기, inqVo={}", inqVo);
	 * 
	 * List<MngcostInfoVO> mList =mngCostService.selectMngcostInfoByClaim(inqVo);
	 * logger.info("세대 별 관리비 상세 조회 결과, mList.size={}",mList.size());
	 * 
	 * return mList; }
	 */
   
   @RequestMapping("/selectMonthlyMngCostUserdash.do")
   @ResponseBody
   public List<Map<String, Object>> selectMonthlyMngCostUserdash(HttpSession session){
	   logger.info("월별 관리비 조회하기");
	   
	   MemberVO memVo = (MemberVO) session.getAttribute("memVo");
	   logger.info("세션값 조회, memVo={}", memVo);
	   int aptNo=memService.selectAptNo(memVo.getId());
	   
	   List<Map<String, Object>> cList
	   	=mngCostService.selectMngcostOrderList(aptNo);
	   logger.info("월별 관리비 조회 결과, cList.size={}", cList.size());
	   
	   return cList;
   }
}
