package com.it.apt.living.controller;

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

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.adminLiving.controller.AdminLivingController;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/living/add")
public class AddController {

	private static final Logger logger = LoggerFactory.getLogger(AdminLivingController.class);
	@Autowired
	private AddService addService;
	
	
//	@RequestMapping("/addFacilityList.do")
//	public void addLivingList() {
//		//http://localhost:9090/apt/living/noti/addFacilityList.do
//		logger.info("addFacilityList - 부가시설 목록 입주민뷰 보여주기");
//	}

	@RequestMapping("/addFacilityDetail.do")
	public void addLivingDetail() {
		logger.info("addFacilityDetail - 부가시설  상세정보 입주민뷰 보여주기");
	}



	@RequestMapping("/addOrder.do")
	public void addOrder() {
		logger.info("/addOrder 부가시설 신청하는 입주민뷰 보여주기");
	}
	
	
	@RequestMapping("/addOrderList.do")
	public void addOrderList() {
		logger.info("/addOrder 부가시설 신청내역조회뷰");
	}
	

	
	
	
	@RequestMapping("/addFacilityList.do")
	public String addInfoList_list(@ModelAttribute AddFacilityInfoVO vo
			,@RequestParam(required = false) String searchKeyword
			,Model model, HttpSession session) {
		logger.info("[입주민]#### 부가시설 리스트 조회 ,들어온직후 vo={} ",vo);
		
		//카테고리 리스트 가져오기
//		List<AddCategoryVO> addCtgList = addService.selectAddCategory();
//		model.addAttribute("addCtgList",addCtgList);
		
		
		//상속받은 searchVo에 검색어 파라미터 넣음
		if( (searchKeyword!=null && !searchKeyword.isEmpty())
				&& (searchKeyword!=null && !searchKeyword.isEmpty())) {
			vo.setSearchKeyword(searchKeyword);//번호값(뷰에서 index)
		}
		logger.info("[입주민]#### 부가시설 검색어 파람, searchKeyword={}",vo.getSearchKeyword());
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		vo.setHouseholdCode(memVo.getHouseholdCode()); //해당 아파트NO 부가시설만 조회 
		
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
		
		
		
		List<AddFacilityInfoVO> list = addService.selectAllAddFacility(vo);
		logger.info("####[입주민] 부가시설 전체 목록 list.size={}",list.size());
		
		//[3] [2]에서 검색어로 검색 된 + 로그인한회원의 HOUSEHOLDCODE로 조회한 APT_NO의 부가시설 총 레코드 수를 
		int totalRecord=addService.selectTotalRecord(vo);
		logger.info("####[입주민] 검색된 부가시설 개수, totalRecord={}", totalRecord);		
		pager.setTotalRecord(totalRecord);		//-------------------> pager에 세팅
		
		
		model.addAttribute("list",list);
		model.addAttribute("pager", pager);
		
		//http://localhost:9090/apt/living/add/addFacilityList.do
		return "living/add/addFacilityList";
	}

	
}