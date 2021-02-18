package com.it.apt.adminCar.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminLiving.car.model.CarService;
import com.it.apt.apart.model.ApartService;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin/adminLiving/adminCar")
public class AdminCarController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCarController.class);
	
	@Autowired CarService carService;
	@Autowired MemberService memberService;
	@Autowired ApartService apartService;
	
	@RequestMapping("/adminCarResidence.do")
	public void carResView() {
		logger.info("세대 차량 조회");
	}
	
	@RequestMapping("/adminCarVisit.do")
	public void adminCarVisit(HttpSession session, Model model) {
		logger.info("adminCarVisit 화면보여주기");
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		int aptNo = memberService.selectAptNo(memVo.getId());
		
		List<Map<String, Object>> carList=carService.chartByAptNo(aptNo);
		logger.info("carList.size={}",carList.size());
		
		List<String> labelList = new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		
		for(int i=0; i<carList.size();i++) {
			String yyyymm = (String)carList.get(i).get("REGDATE");
			String[] ym = yyyymm.split("-");
			String labels = "\'"+ ym[0] +"-"+ ym[1] + "\'";
			labelList.add(labels);
			
			String data = String.valueOf(carList.get(i).get("COUNT"));
			dataList.add(data);
		}
		
		model.addAttribute("labelList",labelList);
		model.addAttribute("dataList",dataList);
	}
	
	@ResponseBody
	@RequestMapping("/carResTable.do")
	public List<Map<String, Object>> resList(HttpSession session){
		logger.info("------------세대별 차량 현황 조회 -------------------");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		//aptNo , isvisitor
		int aptNo = memberService.selectAptNo(memVo.getId());
		String isVisitor = "N";	//세대 차량
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("isVisitor", isVisitor);
		
		logger.info("------------/세대별 차량 현황 조회 -------------------");
		return carService.aptCarList(map);
	}
	
	@ResponseBody
	@RequestMapping("/carTable.do")
	public List<Map<String, Object>> carTable(HttpSession session){
		logger.info("------------세대별 방문 차량 현황 조회 -------------------");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		
		//aptNo , isvisitor
		int aptNo = memberService.selectAptNo(memVo.getId());
		String isVisitor = "Y";	//방문 차량
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("aptNo", aptNo);
		map.put("isVisitor", isVisitor);
		
		logger.info("------------/세대별 방문 차량 현황 조회 -------------------");
		return carService.aptCarList(map);
	}
	
}
