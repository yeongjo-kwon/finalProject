package com.it.apt.adminFacility.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminFacility.model.CompanyCtgVO;
import com.it.apt.adminFacility.model.CompanyService;
import com.it.apt.adminFacility.model.CompanyVO;
import com.it.apt.common.PaginationInfo;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin/adminFacility")
public class AdminFacilityController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFacilityController.class);
	@Autowired private CompanyService companyService;
	@Autowired private MemberService memberService;
	
	@RequestMapping("/facilityCompanyList.do")
	public void companyList_get(Model model) {
		logger.info("시설 관리자 - 보수 업체 관리 View");
		List<CompanyCtgVO> ctgList = companyService.allCompanyCtg();
		logger.info("잘 도착? ctgList={}", ctgList);
		
		model.addAttribute("ctgList", ctgList);
	}

	@RequestMapping("/facilityCompanyReg.do")
	public void companyReg_get(Model model) {
		logger.info("시설 관리자 - 보수 업체 등록 View");
		List<CompanyCtgVO> ctgList = companyService.allCompanyCtg();
		logger.info("잘 도착? ctgList={}", ctgList);
		
		model.addAttribute("ctgList", ctgList);
	}

	@RequestMapping(value="/facilityContract.do",method = RequestMethod.POST)
	public String companyReg_post(@ModelAttribute CompanyVO cVo, HttpSession session,Model model) {
		logger.info("시설 관리자 - 보수 업체 등록 GO ::::::::: cVo={}", cVo);
		
		MemberVO mVo=(MemberVO) session.getAttribute("memVo");
		int aptNo=memberService.selectAptNo(mVo.getId());
		logger.info("aptNo={}", aptNo);
		cVo.setAptNo(aptNo);
		
		int cnt=companyService.insertContract(cVo);
		logger.info("등록 결과 cnt={}", cnt);
		
		String msg="계약 내역 등록 실패", url="/admin/adminFacility/facilityCompanyReg.do";
		if(cnt>0) {
			msg="계약 내역이 등록 되었습니다";
			url="/admin/adminFacility/facilityCompanyList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/facilityAddCost.do")
	public void addCost_get(Model model) {
		logger.info("시설 관리자 - 추가 비용 등록 및 조회 View");
		List<CompanyCtgVO> ctgList = companyService.allCompanyCtg();
		logger.info("잘 도착? ctgList={}", ctgList);
		
		model.addAttribute("ctgList", ctgList);
	}
	
	@ResponseBody
	@RequestMapping("/facilityTable.do")
	public List<CompanyVO> ajax_table(HttpSession session, Model model){
		logger.info("//////////AJAX 테이블//////////");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		List<CompanyVO> cList=companyService.allContract(aptNo);
		logger.info("cList.size={}", cList.size());
		
		model.addAttribute("cList", cList);
		logger.info("//////////////AJAX TABLE END ///////////");
		return cList;
	}
	
	@RequestMapping("/facilityCompanyDetail.do")
	public void companyDetail(@RequestParam int contractNo,Model model) {
		logger.info(":::::::::시설 관리자 - 보수 업체 Detail View! {} 번째 글", contractNo);
		
		CompanyVO cVo=companyService.contractByNo(contractNo);
		logger.info("::::::::::::cVo={}", cVo);
		logger.info("::::::::::::::::::::::::::::::::::마무리");
		
		model.addAttribute("cVo", cVo);
	}
}
