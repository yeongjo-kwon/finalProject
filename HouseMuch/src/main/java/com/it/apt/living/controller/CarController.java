package com.it.apt.living.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminLiving.car.model.CarService;
import com.it.apt.adminLiving.car.model.CarVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/living/car")
public class CarController {

	private static final Logger logger = LoggerFactory.getLogger(CarController.class);
	@Autowired CarService carService;
	@Autowired MemberService memberService;
	@Autowired ApartService apartService;
	
	@RequestMapping("/carRegister.do")
	public void carReg_show() {
		logger.info("방문차량 등록 화면 보여주기");
	}
	
	@ResponseBody
	@RequestMapping("/carInsert.do")
	public int insertCar(@ModelAttribute CarVO vo, HttpSession session) {
		logger.info("///////////차량 등록 - AJAX //////////////");
		logger.info("vo={}", vo);
		
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		vo.setHouseholdCode(householdCode);
		
		int cnt=carService.insertCar(vo);
		logger.info("INSERT 여부 cnt={}", cnt);
		
		return cnt;
	}

	@ResponseBody
	@RequestMapping("/carListAll.do")
	public List<CarVO> carListAll(HttpSession session) {
		logger.info("///////////---------해당 유저의 차량 전체 내역 LIST - AJAX --------------//////////////");

		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("householdCode", householdCode);
		
		List<CarVO> cList=carService.carListByCode(map);
		
		return cList;
	}
	
	@RequestMapping("/dashCar.do")
	public void dashCarView() {
		logger.info("////////////DASH CAR VIEW /////////////");
	}
	
	@ResponseBody
	@RequestMapping("/carListN.do")
	public List<CarVO> carListN(HttpSession session) {
		logger.info(":::::::::::::---------해당 유저의 차량 내역 LIST - AJAX --------------::::::::::::::::");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("householdCode", householdCode);
		map.put("isVisitor","N");			
		
		List<CarVO> cList=carService.carListByCode(map);
		logger.info(":::::::::::::---------/해당 유저의 차량 내역 LIST - AJAX --------------::::::::::::::::");
		
		return cList;
	}
	
	@ResponseBody
	@RequestMapping("/carListY.do")
	public List<CarVO> carListY(HttpSession session) {
		logger.info("///////////---------해당 유저의 차량 방문 내역 LIST - AJAX --------------//////////////");

		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("householdCode", householdCode);
		map.put("isVisitor","Y");
		
		List<CarVO> cList=carService.carListByCode(map);
		
		logger.info("///////////---------/해당 유저의 차량 방문 내역 LIST - AJAX --------------//////////////");
		return cList;
	}
	
	@RequestMapping("/carMainList.do")
	public void carUserDash(HttpSession session,Model model) {
		logger.info("IMPORT ---- CARLIST 내 차량 내역 ----------");
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("householdCode", householdCode);
		
		List<CarVO> cList=carService.carListByCode(map);
		logger.info("-------슬슬 마무리 cList.size={}",cList.size());
		
		model.addAttribute("cList", cList);
	}
}
