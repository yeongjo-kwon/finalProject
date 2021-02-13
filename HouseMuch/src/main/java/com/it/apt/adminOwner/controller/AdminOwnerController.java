package com.it.apt.adminOwner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.it.apt.adminOwner.model.AuthorityVO;
import com.it.apt.adminOwner.model.OwnerService;
import com.it.apt.adminOwner.model.ResidentVO;
import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.mngcost.model.MngcostService;

@Controller
@RequestMapping("/admin/adminOwner")
public class AdminOwnerController {
	private static final Logger logger = LoggerFactory.getLogger(AdminOwnerController.class);
	
	@Autowired private OwnerService ownerService;
	@Autowired private MemberService memberService;
	@Autowired private MngcostService mngcostService;
	
	@RequestMapping("/adminOwnerMain")
	public void ownerMain() {
		logger.info("Main 보여주기!");
	}

	@RequestMapping("/ownerManage")
	public void ownerManage(Model model) {
		logger.info("관리자 관리 화면 보여주기!");
	
		List<AuthorityVO> authList = ownerService.selectAllAuth();
	}
	
	@ResponseBody
	@RequestMapping("/residentTable.do")
	public List<ResidentVO> resTable(HttpServletRequest req, Model model) {
		logger.info("DataTable 적용 ajax!!!!~~~~");
		
		HttpSession session=req.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 Owner의 memVo.getId()={}", memVo.getId());
		
		List<ResidentVO> rList=ownerService.showResidentByid(memVo.getId());
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@rList.size()={}", rList.size());
		
		model.addAttribute("rList", rList);
		return rList;
	}
	
	@ResponseBody
	@RequestMapping(value="/excelUploadAjax.do", method = RequestMethod.POST)
	public ModelAndView excelUploadAjax(MultipartFile testFile, MultipartHttpServletRequest request, HttpServletRequest req) {
		HttpSession session=req.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();
		
		logger.info("업로드 진행, 실행중인 Id={}", id);
		
		MultipartFile excelFile = request.getFile("excelFile");
		
		logger.info("excelFile={}", excelFile);
		
		//컴퓨터 환경에 따라 파일 맞추기
		File destFile = new File("D:\\subin\\파이널프로젝트\\수빈폴더\\FinalPrj_4team_5"+excelFile.getOriginalFilename());
		
		try {
			excelFile.transferTo(destFile); //내가 설정한 위치에 내가 올린 파일 만들고
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		ownerService.excelUpload(destFile, id);
		
		//업로드 진행 후 다시 삭제
		destFile.delete();
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin/adminOwner/ownerResident");
		
		return view;
	}
	
	@RequestMapping("/resDel.do")
	public String resTableDel(@RequestParam("hMemberNoArr[]") String[] hMemberNoArr, Model model) {
		logger.info("@@@@@@house_member DEL!!!!!! hMemberNoArr={}", hMemberNoArr);
		
		String msg="삭제 실패...", url="/admin/adminOwner/ownerResident.do";
		int cnt=0;
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/chkPwdforDel.do", method=RequestMethod.POST)
	public String chkPwdforDel(@RequestParam String pwd, HttpServletRequest req, Model model){
		logger.info("household_info 전체 삭제 전 pwd체크!!!!!!!!!!!사용자가 입력한 pwd={}", pwd);
		
		HttpSession session=req.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();
		
		int result=memberService.loginCheck(id, pwd);
		logger.info("비밀번호 대조 결과 result={}", result);
	   
		String msg="비밀번호가 일치하지 않습니다!", url="/admin/adminOwner/ownerResident.do";
		if(result==MemberService.LOGIN_OK) {	//비밀번호 일치
			int delRes=ownerService.delAllResInfo();
			logger.info("삭제 완료@@@@@@@@@@@delRes={}", delRes);
			msg="삭제가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/ownerResident.do")
	public void ownerResident(HttpSession session, Model model) {
		logger.info("입주민 관리 화면 보여주기!");
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		List<String> dongList=mngcostService.selectMyDongList(memberService.selectAptNo(memVo.getId()));
		logger.info("동 리스트 조회 결과 dongList={}", dongList);
		
		model.addAttribute("dongList", dongList);
	}
	
	/*@ResponseBody
	@RequestMapping("/hoList.do")
	public List<String> hoList(@ModelAttribute HouseholdVO householdVo, HttpSession session) {
		logger.info("@@@@@@@@@@@@호@@@@@@@@@@@@");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		householdVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		logger.info("호 리스트 조회, 아파트 번호 추가 후 파라미터 householdVo={}", householdVo);
		
		List<String> hoList=mngcostService.selectMyHoList(householdVo);
		logger.info("호 리스트 조회 결과 hoList={}", hoList);
		
		return hoList;
	}*/
	
}
