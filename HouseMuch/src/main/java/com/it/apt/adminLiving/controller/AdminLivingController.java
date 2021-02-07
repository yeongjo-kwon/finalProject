package com.it.apt.adminLiving.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/adminLiving")
public class AdminLivingController {

	private static final Logger logger = LoggerFactory.getLogger(AdminLivingController.class);
	
	@RequestMapping("/adminLiving.do")
	public void adLiving() {
		logger.info("adminLiving - 행정관리자 메인화면 보여주기");
	}

	
	//****************************** 행정관리자 부가시설 관리 시작*************************************//
	
	@RequestMapping("/adminAdd/adminAddRegList.do")
	public void adminAddRegList() {
		logger.info("adminAddRegList 부가시설 등록 화면보여주기");
	}
	
	@RequestMapping("/adminAdd/adminAddEdit.do")
	public void adminAddEdit() {
		logger.info("/adminAddEdit 부가시설 수정 화면보여주기");
	}

	@RequestMapping("/adminAdd/adminAddResidence.do")
	public void adminAddResidence() {
		logger.info("/adminAddResidence 부가시설 신청내역 화면보여주기");
	}
	
	//****************************** 행정관리자 부가시설 관리 끝*************************************//

	@RequestMapping("/openWeather.do")
	public void adminWeather() {
		logger.info("openWeather 날씨api - 정보 보여주기");
		
	}
	

	//****************************** 행정관리자 차량관리 시작*************************************//
	@RequestMapping("/adminCar/adminCarVisit.do")
	public void adminCarVisit() {
		logger.info("adminCarVisit 화면보여주기");
	}
	//****************************** 행정관리자 차량관리 끝*************************************//
	
	

	
	
	
}
