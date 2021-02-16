package com.it.apt.adminFacility.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/adminFacility")
public class AdminFacilityController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFacilityController.class);
	
	@RequestMapping("/facilityCompanyList.do")
	public void companyList_get() {
		logger.info("시설 관리자 - 보수 업체 관리 View");
	}

	@RequestMapping("/facilityCompanyReg.do")
	public void companyReg_get() {
		logger.info("시설 관리자 - 보수 업체 등록 View");
	}

	@RequestMapping("/facilityAddCost.do")
	public void addCost_get() {
		logger.info("시설 관리자 - 추가 비용 등록 및 조회 View");
	}
}
