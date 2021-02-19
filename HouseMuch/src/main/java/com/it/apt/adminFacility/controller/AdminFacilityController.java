package com.it.apt.adminFacility.controller;

import java.util.HashMap;
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

import com.it.apt.adminFacility.model.AddCostVO;
import com.it.apt.adminFacility.model.CompanyCtgVO;
import com.it.apt.adminFacility.model.CompanyService;
import com.it.apt.adminFacility.model.CompanyVO;
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
	public void companyDetail(@RequestParam int contractNo,HttpSession session,Model model) {
		logger.info(":::::::::시설 관리자 - 보수 업체 Detail View! {} 번째 글", contractNo);
		
		CompanyVO cVo=companyService.contractByNo(contractNo);
		logger.info("::::::::::::cVo={}", cVo);
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		List<CompanyVO> cList=companyService.allContract(aptNo);
		logger.info("cList.size={}", cList.size());
		logger.info("::::::::::::::::::::::::::::::::::마무리");
		
		model.addAttribute("cList", cList);
		model.addAttribute("cVo", cVo);
	}
	
	@RequestMapping(value="/facilityCompanyEdit.do", method=RequestMethod.GET)
	public void companyEdit_get(@RequestParam int contractNo,Model model) {
		logger.info("[[[[[[[[[시설 관리자 - 보수 업체 수정 View contractNo={}]]]]]]]]]]]]", contractNo);

		CompanyVO cVo=companyService.contractByNo(contractNo);
		logger.info("cVo={}", cVo);

		List<CompanyCtgVO> ctgList = companyService.allCompanyCtg();
		logger.info("잘 도착? ctgList={}", ctgList);
		
		logger.info("[[[[[[[[[[[[[[[[[마무리]]]]]]]]]]]]]]]]]]]");
		model.addAttribute("cVo", cVo);
		model.addAttribute("ctgList", ctgList);
		
	}

	@RequestMapping(value="/facilityCompanyEditOk.do", method=RequestMethod.POST)
	public String companyEdit_post(@ModelAttribute CompanyVO vo,Model model) {
		logger.info("[[[[[[[[[시설 관리자 - 보수 업체 수정 GOGO vo={}]]]]]]]]]]]]", vo);
		
		logger.info("-------------mngCompNo={}, contractNo={}-------------", vo.getMngCompNo(), vo.getContractNo());
		int cnt=companyService.updateContract(vo);
		logger.info("수정 결과 cnt={}", cnt);
		//
		String msg="수정 실패...", url="/admin/adminFacility/facilityCompanyEdit.do?contractNo="+vo.getContractNo();
		if(cnt>0) {
			msg="수정 되었습니다.";
			url="/admin/adminFacility/facilityCompanyDetail.do?contractNo="+vo.getContractNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		logger.info("[[[[[[[[[[[[[[[[[수정 마무리]]]]]]]]]]]]]]]]]]]");
		
		return "common/message";
	}
	
	@RequestMapping("/contractDel.do")
	public String companyDel(@RequestParam(defaultValue="0")int contractNo, Model model) {
		logger.info("~~~~~~~~~~~계약내역 삭제 contractNo={}~~~~~~~~~~~", contractNo);
		
		int cnt=companyService.deleteContract(contractNo);
		logger.info("DEL 작업 cnt={}", cnt);
		
		String msg="삭제 실패..", url="/admin/adminFacility/facilityCompanyList.do";
		if(cnt>0) {
			msg="삭제 되었습니다.";
			url="/admin/adminFacility/facilityCompanyList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/facilityAddCost.do")
	public void addCost_get(HttpSession session,Model model) {
		logger.info("시설 관리자 - 추가 비용 등록 및 조회 View");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		List<CompanyVO> cList=companyService.allContract(aptNo);
		logger.info("cList.size={}", cList.size());
		
		model.addAttribute("cList", cList);
		logger.info("/////////////////////////");
	}
	
	@ResponseBody
	@RequestMapping("/addCost.do")
	public int addCost_post(@ModelAttribute AddCostVO aVo,HttpSession session) {
		logger.info("//////////ADDCOST _ AJAX 통신 //////////// aVo={}", aVo);
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		aVo.setAptNo(aptNo);
		
		int cnt=companyService.insertAddCost(aVo);
		logger.info("//////////ADDCOST _ AJAX 통신 마무리 //////////// cnt={}", cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/listCostN.do")
	public List<Map<String, Object>> addListN(HttpSession session) {
		logger.info("-------------미승인건 리스트 AJAX 출력 -------------------");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("costFlag", "N");
		
		List<Map<String, Object>> list = companyService.listAddCost(map);
		logger.info("////////미승인건 리스트 AJAX 완료!!!! //////////////");
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listCostY.do")
	public List<Map<String, Object>> addListY(HttpSession session) {
		logger.info("-------------승인건 리스트 AJAX 출력 -------------------");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("costFlag", "Y");
		
		List<Map<String, Object>> list = companyService.listAddCost(map);
		logger.info("-------------승인건 리스트 AJAX 출력 마무리-------------------");
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/addCostDel.do")
	public int costDel(@RequestParam int costNo,HttpSession session) {
		logger.info("-------------ADDCOST 삭제 -------------------");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("costNo", costNo);
		
		int cnt=companyService.deleteAddCost(map);
		logger.info("-------------ADDCOST 삭제 마무리 -------------------");
		return cnt;
	}

	@ResponseBody
	@RequestMapping("/addCostEditView.do")
	public AddCostVO costEditView(@RequestParam int costNo,HttpSession session) {
		logger.info("-------------ADDCOST 수정 VIEW costNo={}, costNo -------------------");
		
		AddCostVO aVo = companyService.selectByCostNo(costNo);
		logger.info("aVo={}", aVo);
		
		logger.info("-------------ADDCOST 수정 VIEW 마무리 -------------------");
		return aVo;
	}

	@ResponseBody
	@RequestMapping(value="/addCostUpdate.do", method=RequestMethod.POST)
	public int costEdit(@ModelAttribute AddCostVO aVo,HttpSession session) {
		logger.info("//////////ADDCOST 수정 _ AJAX 통신 //////////// aVo={}", aVo);
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());
		aVo.setAptNo(aptNo);
		
		int cnt=companyService.updateAddCost(aVo);
		logger.info("//////////ADDCOST _ AJAX 수정 통신 마무리 //////////// cnt={}", cnt);
		
		return cnt;
	}
	
}
