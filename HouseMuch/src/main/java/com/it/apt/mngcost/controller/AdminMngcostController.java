package com.it.apt.mngcost.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.mngcost.model.InquiryInfoVO;
import com.it.apt.mngcost.model.MngcostInfoVO;
import com.it.apt.mngcost.model.MngcostMainCtgVO;
import com.it.apt.mngcost.model.MngcostService;

@Controller
@RequestMapping("/admin/adminMngcost")
public class AdminMngcostController {
	private static final Logger logger
		=LoggerFactory.getLogger(MngcostController.class);
	
	@Autowired MngcostService mngcostService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/adminMngcostInquiry.do")
	public String adminMngcostInquiry(@ModelAttribute InquiryInfoVO inqVo,
			HttpSession session, Model model) {
		logger.info("관리자용 지출내역 조회 화면, 파라미터 inqVo={}", inqVo);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		if(memVo==null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/login/login.do");
			
			return "common/message";
		}//인터셉트
		
		inqVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		
		List<MngcostMainCtgVO> mngcostMainCtgList
			=mngcostService.selectMCtgList();
		logger.info("관리비 대분류 조회 결과 mngcostMainCtgList={}",
										mngcostMainCtgList);
		
		List<MngcostInfoVO> mngcostInfoList
			=mngcostService.adminSelectMngcostInfo(inqVo);
		logger.info("이번 달 관리비 전체조회 결과 mngcostInfoList={}", mngcostInfoList);
		
		model.addAttribute("mngcostMainCtgList", mngcostMainCtgList);
		model.addAttribute("mngcostInfoList", mngcostInfoList);
		
		return "admin/adminMngcost/adminMngcostInquiry";
	}
	
	@ResponseBody
	@RequestMapping("/showDetail.do")
	public List<MngcostInfoVO> showDetail(@ModelAttribute InquiryInfoVO inqVo,
			 HttpSession session) {
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		logger.info("관리자용 관리비 상세보기, inqVo={}", inqVo);
		
		inqVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		
		List<MngcostInfoVO> mngcostInfoList
			=mngcostService.adminSelectMngcostInfo(inqVo);
		logger.info("관리비 상세보기 조회 결과 mngcostInfoList={}", mngcostInfoList);
		
		return mngcostInfoList;
	}
	
	
	@RequestMapping("/adminMngcostInqToOrder.do")
	public String adminMngcostInqToOrder(@ModelAttribute InquiryInfoVO inqVo,
			HttpSession session, Model model) {
		String startYM=inqVo.getStartdate().substring(0, 7);
		
		String endYM="";
		if(inqVo.getEnddate()==null || inqVo.getEnddate().isEmpty())
			endYM=startYM;
		else{
			endYM=inqVo.getEnddate().substring(0, 7);
		}
		
		//세션에서 회원정보 가져오기
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		//관리자 담당 아파트번호로 조회하기 위해 값 집어넣기
		inqVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		//청구 여부를 확인하기 위한 값 집어넣기(변경하기)
		inqVo.setStartdate(startYM);
		
		logger.info("관리자용 관리비 청구화면, 값 집어넣은 후 파라미터 inqVo={}", inqVo);
		
		String msg="관리비 청구에 실패하였습니다.", url="/admin/adminMngcost/adminMngcostInquiry.do";
		if(!startYM.equals(endYM)) {
			msg="최소 두 개 이상의 달이 선택되었습니다. 다시 선택해주세요.";
		}else {
			int cnt=mngcostService.cntAlreadyOrder(inqVo);
			if(cnt>0) {
				msg="이미 청구완료 된 달입니다.";
			}else {
				msg="관리비 청구화면으로 이동합니다.";
				url="/admin/adminMngcost/adminMngcostOrder.do?useMonth="+startYM;
			}
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/adminMngcostOrder.do", method = RequestMethod.GET)
	public void adminMngcostOrder_get() {
		logger.info("관리비 청구 화면 보여주기");
	}
	
	@RequestMapping(value="/adminMngcostOrder.do", method = RequestMethod.POST)
	public String adminMngcostOrder_post(@ModelAttribute InquiryInfoVO inqVo,
			HttpSession session, Model model) {
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		inqVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		logger.info("관리자용 관리비 청구처리, 값 집어넣은 후 파라미터 inqVo={}", inqVo);
		
		int cnt=mngcostService.insertMngcostPaymentList(inqVo);
		logger.info("관리비 청구 처리결과 cnt={}", cnt);
		
		String msg="관리비 청구에 실패하였습니다.", url="/admin/adminMngcost/adminMngcostOrder.do";
		if(cnt>0) {
			msg="관리비 청구에 성공하였습니다.";
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminMngcostRegister.do")
	public void adminMngcostRegister(Model model) {
		logger.info("관리비 등록 화면");
		
		List<MngcostMainCtgVO> mngcostMainCtgList
			=mngcostService.selectMCtgList();
		logger.info("관리비 대분류 조회 결과 mngcostMainCtgList={}",
									mngcostMainCtgList);
		
		model.addAttribute("mngcostMainCtgList", mngcostMainCtgList);
	}
	
	
	@RequestMapping("/adminMngcostRegisterOk.do")
	public String adminMngcostRegisterOk(@RequestParam(required = false) HashMap<String, Object> repeaterMap,
			HttpSession session, Model model) {
		logger.info("지출내역 등록하기, 파라미터 repeaterMap={}", repeaterMap);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		String msg="지출내역 등록에 실패하였습니다.", url="/admin/adminMngcost/adminMngcostRegister.do";
		List<MngcostInfoVO> mngcostInfoList=new ArrayList<MngcostInfoVO>();
		//map의 값 개수 / row당 값 개수 = row 개수
		for(int i=0; i<repeaterMap.size()/4; i++) {
			int mngcostSCtgNo=Integer.parseInt((String)repeaterMap.get("invoice["+i+"][mngcostSCtgNo]"));
			String mngcostContent=(String)repeaterMap.get("invoice["+i+"][mngcostContent]");
			int mngcostPrice=Integer.parseInt((String)repeaterMap.get("invoice["+i+"][mngcostPrice]"));
			
			MngcostInfoVO mngcostInfoVo=new MngcostInfoVO();
			mngcostInfoVo.setAptNo(aptNo);
			mngcostInfoVo.setMngcostSCtgNo(mngcostSCtgNo);
			mngcostInfoVo.setMngcostContent(mngcostContent);
			mngcostInfoVo.setMngcostPrice(mngcostPrice);
			
			mngcostInfoList.add(mngcostInfoVo);
		}
		
		
		int cnt=mngcostService.insertMngcostInfoMulti(mngcostInfoList);
		if(cnt>0){
			msg="지출내역 등록에 성공하였습니다. 내역을 확인하세요";
			url="/admin/adminMngcost/adminMngcostInquiry.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminMngcostDelMulti.do")
	public String adminMngcostDelMulti(@RequestParam("mngcostNoArray[]") String[] mngcostNoArray,
			Model model) {
		logger.info("지출내역 다중 삭제 처리, 파라미터 mngcostNoArray={}", mngcostNoArray);
		
		String msg="지출내역 삭제에 실패하였습니다.", url="/admin/adminMngcost/adminMngcostInquiry.do";
		int cnt=mngcostService.deleteMngcostInfoMulti(mngcostNoArray);
		if(cnt>0) {
			msg="지출내역 삭제에 성공하였습니다. 내역을 확인하세요";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/showMngcostEditInfo.do")
	public MngcostInfoVO showMngcostEditInfo(@RequestParam(defaultValue = "0")int mngcostNo) {
		logger.info("수정할 정보 보여주기, 파라미터 mngcostNo={}", mngcostNo);
		
		MngcostInfoVO mngcostInfoVoAddMCtgNo
			=mngcostService.selectMngcostInfoAddMCtgNo(mngcostNo);
		logger.info("수정할 정보 조회 결과 mngcostInfoVoAddMCtgNo={}", mngcostInfoVoAddMCtgNo);
		
		return mngcostInfoVoAddMCtgNo;
	}
	
	@RequestMapping("/adminMngcostInfoEdit.do")
	public String adminMngcostInfoEdit(MngcostInfoVO mngcostInfoVo,
			HttpSession session, Model model, BindingResult errors) {
		logger.info("진입");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		InquiryInfoVO inqVo=new InquiryInfoVO();
		inqVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		inqVo.setStartdate(mngcostInfoVo.getMngcostUsedate().toString().substring(0, 7));
		logger.info("지출내역 수정 처리, 파라미터 mngcostInfoVo={}, 청구여부 확인용 inqVo={}", mngcostInfoVo, inqVo);
		
		String msg="지출내역 수정에 실패하였습니다.", url="/admin/adminMngcost/adminMngcostInquiry.do";
		
		int cnt=mngcostService.cntAlreadyOrder(inqVo);
		logger.info("수정할 내역 청구여부 cnt={}", cnt);
		
		if(cnt>0) {
			msg="이미 청구된 내역은 수정할 수 없습니다.";
		}else {
			cnt=mngcostService.updateMngcostInfo(mngcostInfoVo);
			logger.info("지출내역 수정 처리 결과 cnt={}", cnt);
			
			if(cnt>0) {
				msg="내역 정보 수정에 성공했습니다. 내역을 확인하세요.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/showMngcostOrderList.do")
	public List<Map<String, Object>> showMngcostOrderList(HttpSession session) {
		logger.info("월별 납부현황 보여주기");
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		List<Map<String, Object>> mngcostOrderList
			=mngcostService.selectMngcostOrderList(aptNo);
		logger.info("월별 납부현황 조회 결과 mngcostOrderList={}", mngcostOrderList);
		
		return mngcostOrderList;
	}
	
	@RequestMapping("/adminPaymentListInquiry.do")
	public void adminPaymentListInquiry(HttpSession session, Model model) {
		logger.info("세대별 납부내역 조회화면");
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		List<String> dongList=mngcostService.selectMyDongList(aptNo);
		logger.info("동 리스트 조회 결과 dongList={}", dongList);
		
		List<String> hoList=mngcostService.selectMyHoList(aptNo);
		logger.info("호 리스트 조회 결과 hoList={}", hoList);
		
		model.addAttribute("dongList", dongList);
		model.addAttribute("hoList", hoList);
	}
	
	@ResponseBody
	@RequestMapping("/amdinPayListInq.do")
	public List<Map<String, Object>> amdinPayListInq(@ModelAttribute HouseholdVO householdVo,
			HttpSession session) {
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		householdVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		logger.info("관리자 관리비 청구 조회, 아파트 번호 추가 후 파라미터 householdVo={}", householdVo);
		
		List<Map<String, Object>> payList=mngcostService.selectMngcostPaymentList(householdVo);
		logger.info("관리자 관리비 청구 내역 조회 결과 payList={}", payList);
		
		return payList;
	}
}
