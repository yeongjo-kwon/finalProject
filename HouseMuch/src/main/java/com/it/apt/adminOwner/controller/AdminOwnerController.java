package com.it.apt.adminOwner.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
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

import com.it.apt.adminFacility.model.AddCostVO;
import com.it.apt.adminFacility.model.CompanyService;
import com.it.apt.adminOwner.model.AdminAllVO;
import com.it.apt.adminOwner.model.AuthorityVO;
import com.it.apt.adminOwner.model.OwnerIMPVO;
import com.it.apt.adminOwner.model.OwnerService;
import com.it.apt.adminOwner.model.ResidentVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.apart.model.ApartVO;
import com.it.apt.household.model.HouseholdMemVo;
import com.it.apt.household.model.HouseholdService;
import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.mngcost.model.MngcostInfoVO;
import com.it.apt.mngcost.model.MngcostPaymentListVO;
import com.it.apt.mngcost.model.MngcostService;

@Controller
@RequestMapping("/admin/adminOwner")
public class AdminOwnerController {
	private static final Logger logger = LoggerFactory.getLogger(AdminOwnerController.class);
	
	@Autowired private OwnerService ownerService;
	@Autowired private MemberService memberService;
	@Autowired private MngcostService mngcostService;
	@Autowired private CompanyService companyService;
	@Autowired private HouseholdService householdService;
	@Autowired private ApartService apartService;
	
	@RequestMapping("/adminOwnerMain")
	public void ownerMain() {
		logger.info("Main 보여주기!");
	}

	@RequestMapping("/ownerManage.do")
	public void ownerManage(HttpServletRequest req, Model model) {
		logger.info("관리자 관리 화면 보여주기!");
	
		List<AuthorityVO> authList = ownerService.selectAdminAuth();
		logger.info("authList={}", authList);
		
		HttpSession session=req.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		int aptNo=memberService.selectAptNo(memVo.getId());
		logger.info("aptNo={}", aptNo);
		
		List<AdminAllVO> adList=ownerService.selectAdminLv2(aptNo);
		logger.info("adList.size()={}",adList.size());
		
		model.addAttribute("authList", authList);
		model.addAttribute("adList", adList);
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
	
	//RESPONSEBODY
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
			int aptNo=memberService.selectAptNo(memVo.getId());
			int delRes=ownerService.delAllResInfo(aptNo);
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
	
	@ResponseBody
	@RequestMapping("/hoList.do")
	public List<String> hoList(@RequestParam(defaultValue = "0")String dong , HttpSession session) {
		logger.info("@@@@@@@@@@@@호@@@@@@@@@@@@ dong={}", dong);
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		HouseholdVO householdVo=new HouseholdVO();
		householdVo.setDong(dong);
		householdVo.setAptNo(memberService.selectAptNo(memVo.getId()));
		logger.info("호 리스트 조회, 아파트 번호 추가 후 파라미터 householdVo={}", householdVo);
		
		List<String> hoList=ownerService.selectHo(householdVo);
		logger.info("호 리스트 조회 결과 hoList={}", hoList);
		
		return hoList;
	}
	
	@RequestMapping("/ownerResReg.do")
	public String ownerResReg(@RequestParam(required = false) HashMap<String, Object> repeaterMap,
			HttpSession session, Model model) {
		logger.info("@@@@@Household_member에 등록할거임@@@@@ repeaterMap={}", repeaterMap);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		String msg="입주민 등록에 실패하였습니다.", url="/admin/adminOwner/ownerResident.do";
		List<HouseholdMemVo> houseMemberList=new ArrayList<HouseholdMemVo>();
		//map의 값 개수 / row당 값 개수 = row 개수
		for(int i=0; i<repeaterMap.size()/5; i++) {
			String dong=(String)repeaterMap.get("invoice["+i+"][dong]");
			String ho=(String)repeaterMap.get("invoice["+i+"][ho]");

			HouseholdVO hVo=new HouseholdVO();
			hVo.setDong(dong);
			hVo.setHo(ho);
			hVo.setAptNo(aptNo);
			
			String code=householdService.findHouseholdCode(hVo);
			logger.info("@@@@@for문@@@@@@@@@@dong={}, ho={}",dong,ho);
			logger.info("@@@@@@@@@@@@@@@@@@@@@일때 code={}", code);
			
			String hMembName=(String)repeaterMap.get("invoice["+i+"][hMembName]");
			String birth=(String)repeaterMap.get("invoice["+i+"][birth]");
			String relation=(String)repeaterMap.get("invoice["+i+"][relation]");
			
			HouseholdMemVo mVo = new HouseholdMemVo();
			mVo.setBirth(birth);
			mVo.sethMembName(hMembName);
			mVo.setHouseholdCode(code);
			mVo.setRelation(relation);
			
			houseMemberList.add(mVo);
		}
		
		
		int cnt=householdService.insertHouseholdMember(houseMemberList);
		if(cnt>0){
			msg="입주민 추가등록 완료하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/ownerMngReg.do")
	public String ownerAdminReg(@RequestParam(required = false) HashMap<String, Object> repeaterMap,
			HttpSession session, Model model) {
		logger.info("@@@@@ADMIN:::::Household_info에 등록할거임@@@@@ repeaterMap={}", repeaterMap);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		int aptNo=memberService.selectAptNo(memVo.getId());
		
		String msg="관리자 등록 실패.", url="/admin/adminOwner/ownerManage.do";
		List<HouseholdVO> houseAdminList=new ArrayList<HouseholdVO>();
		//map의 값 개수 / row당 값 개수 = row 개수
		for(int i=0; i<repeaterMap.size()/2; i++) {
			String authCode=(String)repeaterMap.get("invoice["+i+"][authCode]");
			
			String householdCode=(String)repeaterMap.get("invoice["+i+"][householdCode]");
			if(householdCode==null || householdCode.isEmpty()) {
				householdCode=RandomStringUtils.randomAlphanumeric(12);	//알파벳 + 숫자랜덤12자리 code
			}else {
				householdCode=(String)repeaterMap.get("invoice["+i+"][householdCode]");				
			}
						
			logger.info("@@@@@@@AuthCode={}, householdCode={}", authCode, householdCode);
			HouseholdVO hVo=new HouseholdVO();
			hVo.setAptNo(aptNo);
			hVo.setAuthCode(authCode);
			hVo.setHouseholdCode(householdCode);
			
			houseAdminList.add(hVo);
			logger.info("@@@@@@@@@@@@@@@@@setting:::::: hVo={}, houseAdminList={}", hVo, houseAdminList);
		}
		
		
		int cnt=householdService.insertCode(houseAdminList);
		if(cnt>0){
			msg="관리자 코드 등록 완료!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/ownerManageEdit.do", method = RequestMethod.POST)
	public String editManage(@ModelAttribute HouseholdVO vo, Model model) {
		logger.info("관리자 권한 변경!!!!!!!! vo.authCode={}, vo.householdCode={}", vo.getAuthCode(), vo.getHouseholdCode());
		
		int cnt=householdService.updateAdmin(vo);
		
		String msg="권한 변경 실패", url="/admin/adminOwner/ownerManage.do";
		if(cnt>0) {
			msg="권한이 변경되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/ownerManageDel.do")
	public String delManage(@RequestParam String householdCode, Model model) {
		logger.info("관리자 삭제!!!!! householdCode={}", householdCode);
		if(householdCode==null || householdCode.isEmpty()) {
			String msg="잘못된 경로 입니다.";
			String url="/admin/adminOwner/ownerManage.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";	
		}
		
		int cnt=householdService.deleteAdmin(householdCode);
		String msg="삭제 실패", url="/admin/adminOwner/ownerManage.do";
		if(cnt>0) {
			msg="해당 관리자 코드가 삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";		
	}
	
	@RequestMapping("/facilityPayCost.do")
	public void payCostView(HttpSession session, Model model) {
		logger.info("----------PAYCOST---VIEW---------------");
		
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		logger.info("로그인 한 관리자의 memVo.getId()={}", memVo.getId());
		int aptNo=memberService.selectAptNo(memVo.getId());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("costFlag", "N");
		
		List<Map<String, Object>> list = companyService.listAddCost(map);
		logger.info("list.size={}", list.size());
		
		ApartVO apartVo =apartService.selectAptByAptNo(memberService.selectAptNo(memVo.getId()));
		
		model.addAttribute("apartVo", apartVo);
		model.addAttribute("list", list);
		logger.info("////////////----------PAYCOST---VIEW---------------///////////");
	}
	
	@RequestMapping("/payIMP.do")
	public void payIMP(@ModelAttribute OwnerIMPVO impVo, Model model) {
		logger.info("::::::::::::::::::::결제 창 띄우기 ::::::::::::::::::::::::");
		logger.info("impVo={}", impVo);
		
		logger.info("::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		model.addAttribute("impVo", impVo);
	}
	
	
	@ResponseBody
	@RequestMapping("/updateCostMulti.do")
	public int payAddCost(@ModelAttribute OwnerIMPVO impVo) {
		logger.info("-----------결제중---------------");
		
		List<AddCostVO> addCostList=impVo.getAddCostList();
		
		int cnt=companyService.payCost(addCostList);
		logger.info("결제 처리 결과 cnt={}", cnt);
		logger.info("--------------------------------");
		return cnt;
	}
}
