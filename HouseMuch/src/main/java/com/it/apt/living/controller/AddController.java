package com.it.apt.living.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.adminLiving.add.model.AddOrderVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/living/add")
public class AddController {

	private static final Logger logger = LoggerFactory.getLogger(AddController.class);
	@Autowired	private AddService addService;
	@Autowired	private MemberService memService;
	
	
//	@RequestMapping("/addFacilityList.do")
//	public void addLivingList() {
//		//http://localhost:9090/apt/living/noti/addFacilityList.do
//		logger.info("addFacilityList - 부가시설 목록 입주민뷰 보여주기");
//	}

	
//	@RequestMapping("/attachImage.do")
//	public void attachImage(RMa rmap, ModelMap model
//			, HttpServletRequest request
//			, HttpServletResponse response) throws IOException {		
//		UMap umap = addService.selectAttachFile(rmap, model);
//		byte[] imageData = (byte[]) umap.get("file");
//		response.setContentType("image/jpeg");
//		response.getOutputStream().write(imageData);
//	}
	
	
	@RequestMapping("/addFacilityList.do")
	public String addInfoList_list(@ModelAttribute AddFacilityInfoVO vo
			,@RequestParam(required = false) String searchKeyword
			,Model model, HttpSession session) {
		logger.info("[입주민]#### 부가시설 리스트 조회 ,들어온직후 vo={} ",vo);
		logger.info("[입주민]#### 부가시설 리스트 파라미터 searchKeyword={}",searchKeyword);
		
		//상속받은 searchVo에 검색어 파라미터 넣음
		if( searchKeyword!= null && !searchKeyword.isEmpty()){
			vo.setSearchKeyword(searchKeyword);//번호값(뷰에서 index)
			String searchword =  vo.getSearchKeyword();
			logger.info("[입주민]부가시설 검색어 파람, searchKeyword={}" ,searchword);
		}
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		vo.setHouseholdCode(householdCode); //해당 아파트NO 부가시설만 조회 
		
		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		PaginationInfo pager = new PaginationInfo();
		pager.setBlockSize(Utility.BLOCK_SIZE);
		pager.setRecordCountPerPage(10);	   //한페이지에 글 10줄씩 세팅
		
		pager.setCurrentPage(vo.getCurrentPage());
		logger.info("####지금 pager에들어간 현재페이지 ,vo.getCurrentPage()={} ",vo.getCurrentPage());
		
		//[2] 검색어변수 noticeBoardVO에 셋팅
		vo.setRecordCountPerPage(10);
		vo.setFirstRecordIndex(pager.getFirstRecordIndex());
		
		
		logger.info("[입주민]:::::::::::검색직전vo::::::::::vo={} ",vo);//--->여기서 addCtgNo가 없으면 에러 ,, 근데 왜 안오지 ,,? 
		List<AddFacilityInfoVO> list = addService.selectAllAddFacility(vo);
		logger.info("####[입주민] 부가시설 전체 목록 list.size={}",list.size());
		
		//[3] [2]에서 검색어로 검색 된 + 로그인한회원의 HOUSEHOLDCODE로 조회한 APT_NO의 부가시설 총 레코드 수를 
		int totalRecord=addService.selectTotalRecord(vo);
		logger.info("####[입주민] 검색된 부가시설 개수, totalRecord={}", totalRecord);		
		pager.setTotalRecord(totalRecord);		//-------------------> pager에 세팅
		
		
		//세대코드로 신청내역 전체 가져옴 
		List<AddOrderVO> orderList = addService.selectAddOrderListByHouseholdCode(householdCode);
		int checkCode=0;
		List<Integer> checkList = new ArrayList<Integer>();
		for (int i = 0; i < orderList.size(); i++) {
			//이용료 납부횟수
			int addChargeCnt =0;
			AddOrderVO orderVo = orderList.get(i);
			Date orderDate = orderVo.getAddOrderdate();
			Date outDate = orderVo.getAddOutdate();
			if(orderDate==null && outDate==null) {
				checkCode=0;
			}else if(orderDate!=null && outDate==null) {
				checkCode=1;//이용중
			}else{
				checkCode=2;//이용중
			}
			//checkCode = addService.checkHouseholdCodeInUse(orderVo);
			logger.info("접속회원의 시설 이용중여부  checkCode={}",checkCode );
			checkList.add(checkCode);
		}
		
		//model.addAttribute("checkCode",checkCode);
		model.addAttribute("checkList",checkList);
		model.addAttribute("orderList",orderList);
		model.addAttribute("list",list);
		model.addAttribute("pager", pager);
		
		//http://localhost:9090/apt/living/add/addFacilityList.do
		return "living/add/addFacilityList";
	}
		
	@RequestMapping(value = "/addFacilityDetail.do",method = RequestMethod.GET)
	public String addLivingDetail(@RequestParam(defaultValue = "0") int addNo
			,Model model,HttpSession session) {
		///living/add/addFacilityDetail.do?addNo=${vo.addNo }
		logger.info("부가시설  상세정보 입주민뷰 ,파라미터 addNo={}",addNo);
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		logger.info("로그인한 세대코드 householdCode={}",householdCode);
		
		if(addNo==0) {
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","living/add/addFacilityList");
			return "common/message";
		}

		Map<String, Object> map = addService.selectAddInfoByAddNo(addNo);
		logger.info("부가시설 상세 결과 map={}",map);
		
		AddOrderVO vo = new AddOrderVO();
		vo.setHouseholdCode(householdCode);
		vo.setAddNo(addNo);
		
		int checkCode = addService.checkHouseholdCodeInUse(vo);
		logger.info("접속회원의 시설 이용중여부  checkCode={}",checkCode );
		
		
		model.addAttribute("checkCode",checkCode);
		model.addAttribute("map", map);
		model.addAttribute("householdCode", householdCode);
		return "living/add/addFacilityDetail";
	}


	
	
//************************************ 시설이용신청 ************************************	

	@RequestMapping(value = "/addOrder.do",method = RequestMethod.GET)
	public String addOrder(@RequestParam(defaultValue = "0")int addNo
			,@RequestParam String householdCode
			,Model model,HttpSession session) {
		//http://localhost:9090/apt/living/add/addOrder.do?addNo=3&householdCode=test1
		logger.info("부가시설 신청뷰 보여주기,파라미터 addNo={},householdCode={}",addNo,householdCode);
		
		if(addNo==0) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("url","/living/add/addFacilityList.do");
			
			return "common/message";
		}
		
		AddOrderVO checkVo = new AddOrderVO();
		checkVo.setAddNo(addNo);
		checkVo.setHouseholdCode(householdCode);
				
		int check = addService.checkHouseholdCodeInUse(checkVo);
		if(check>0) {
			model.addAttribute("msg","이미 이용중인 시설입니다.");
			model.addAttribute("url","/living/add/addOrderList.do?householdCode="+householdCode);
			
			return "common/message";
		}
		
		Map<String, Object> map = addService.selectAddInfoByAddNo(addNo);
		logger.info("부가시설 상세정보 결과 map={}",map);

		
		model.addAttribute("map",map);
		return "living/add/addOrder";
	}
	
	@RequestMapping(value = "/addOrder.do",method = RequestMethod.POST)
	public String addOrder_post(@RequestParam(defaultValue = "0")int addNo
			,@ModelAttribute AddOrderVO vo, Model model, HttpSession session) {
		logger.info("이용신청하기 addNo={}, vo={}",addNo,vo);
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		int memberNo = memVo.getMemberNo();
		
		//if[1].입력한 householdCode와 일치 여부 확인
		int checkCode = memService.chkCodeKey(householdCode);
		logger.info("세대코드 체크(1나오면 OK) checkCode={}",checkCode);
		
 String msg="",url="";
		if(checkCode==0) { 
			//1-1. 불일치할 경우 -> 다시 돌아가기
			msg="입력정보를 확인해주세요";
			url="/living/add/addOrder.do?addNo="+addNo;
		
		}else{
			
			//1-2
			//if[2].입력한 householdCode로 등록내역 있는지 확인(ADD_OUTDATE IS NULL)
			int checkUse = addService.checkHouseholdCodeInUse(vo);
			logger.info("사용중체크 checkUse={}",checkUse);
			if(checkUse>0) {
				//2-1.일치 + 이용중인경우
				msg="이미 이용중인 시설입니다";
			}else{
				//2-2. 일치 + 이용중이 아닐 경우 vo에 정보 담고  addOrder에 등록 -> 마이페이지 등록목록으로 이동
				
				  vo.setAddNo(addNo); 
				  vo.setMemberNo(memberNo);
				  vo.setHouseholdCode(householdCode); vo.setMemberName(vo.getMemberName());
				  
				 
				logger.info("신청직전  vo={}",vo);
				int result = addService.insertAddOrder(vo);
				logger.info("이용신청요청된 result={}",result);
				
				if(result>0) {
					msg="이용신청 완료되었습니다.";
					url="/living/add/addOrderList.do?householdCode="+vo.getHouseholdCode();
				}
			}
			
		}//세대코드가 있을 경우if
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	

	//우리집 이용중인 시설 목록 보기
	@RequestMapping(value = "/addOrderList.do",method = RequestMethod.GET)
	public String addOrderList_get(@RequestParam String householdCode
			,HttpSession session, Model model) {
		logger.info("/addOrderList 부가시설 신청내역조회뷰, 파라미터 householdCode={}",householdCode);
		
		//세대코드로 세대원 목록 가져옴
		List<AddOrderVO> famList = addService.selectMemberInfoListByHouseholdCode(householdCode);
		
		
		//세대코드로 신청내역 전체 가져옴 
		List<AddOrderVO> orderList = addService.selectAddOrderListByHouseholdCode(householdCode);
		for (int i = 0; i < orderList.size(); i++) {
			//이용료 납부횟수
			int addChargeCnt =0;
			AddOrderVO orderVo = orderList.get(i);
			addChargeCnt = addService.getChargedMonthsByAddOrderListNo(orderVo.getAddOrderListNo());
			orderVo.setAddChargeCnt(addChargeCnt);
		}
		
		model.addAttribute("famList",famList);
		model.addAttribute("orderList",orderList);
		return "/living/add/addOrderList";
	}
	
	@ResponseBody
	@RequestMapping("/memberOrder.do")
	public List<AddOrderVO> memberOrder(@RequestParam(defaultValue = "0")int memberNo) {
		logger.info("회원별 신청내역조회뷰, 파라미터 memberNo={}",memberNo);
		
		List<AddOrderVO> memOrderList = addService.selectAddOrderListByMemberNo(memberNo);
		
		return memOrderList;
	}
	
	
	
//	@RequestMapping(value = "/addOut.do",method = RequestMethod.GET)
//	public void addOut(@RequestParam(defaultValue = "0")int addNo,@RequestParam String householdCode
//			,Model model,HttpSession session) {
//	logger.info("부가시설 해지신청");
//		
//	}

	
}