package com.it.apt.adminLiving.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.it.apt.adminLiving.add.model.AddOrderExcelVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.member.model.MemberVO;

@Controller
public class LivingExcelController {
	

	private static final Logger logger = LoggerFactory.getLogger(LivingExcelController.class);
	@Autowired	private AddService addService;
	
	@RequestMapping("/living/add/orderListExcel.do")
	public ModelAndView addOrderListExcel(ModelMap model, HttpSession session) throws Exception {
		
		// 세션에 저장되어 있는 유저의 정보를 가져옴
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String householdCode =  memVo.getHouseholdCode();
		logger.info("세션세대코드 householdCode={}",householdCode);
		
		List<AddOrderExcelVO> orderExcelList = addService.selectAddOrderExcel(householdCode);
		logger.info("엑셀목록결과 리스트 전체출력 orderExcelList={}",orderExcelList);
		
		//파일명에 날짜붙임(파일명중복방지)
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);
		
		model.put("orderExcelList", orderExcelList);
		model.put("fileName", "세대별부가시설신청내역_"+today+".xlsx");
		model.put("sheetName", "부가시설신청내역");
		
		return new ModelAndView("livingExcelView");	//엑셀다운로드뷰로 보냄
		    
	}
	
}
