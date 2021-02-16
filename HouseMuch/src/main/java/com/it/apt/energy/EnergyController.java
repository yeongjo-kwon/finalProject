package com.it.apt.energy;

import java.awt.SplashScreen;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.living.controller.NoticeController;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/energy")
public class EnergyController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired private EnergyService energyService;
	

	@RequestMapping("/energyChart_tabBak.do")
	private void energyChart_bak() {
		//http://localhost:9090/apt/energy/energyChart_bak.do
		logger.info("에너지 차트 ");
	}

	@RequestMapping("/energyChart.do")
	private void energyChart(HttpSession session,Model model) {
		//http://localhost:9090/apt/energy/energyChart.do
		logger.info("에너지 차트  초기화면");
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		
		List<Map<String, Object>> electList = energyService.electListByHouseholdeCode(householdCode);
		logger.info("전기차트리스트 electList.size={}",electList.size());
		
		List<String> labelList = new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		
		for (int i = 0; i <electList.size() ; i++) {
			String mm = (String)electList.get(i).get("USE_MONTH"); 
			String labels = "\'"+mm + "월\'"; //labels
			labelList.add(labels);

			String data = String.valueOf(electList.get(i).get("U_COST_AMOUNT")); //data
			dataList.add(data);
		}
		
		String dong = (String) electList.get(0).get("DONG");
		String ho = (String) electList.get(0).get("HO");
		
		String DongHo = dong + ho;
		
		
		Map<String, Object> electAvgMap = energyService.electAvgByHouseholdeCode(householdCode);
		logger.info("전기차트 평균값 electAvgMap.size={}",electAvgMap.size());
		
		List<Map<String, Object>> uCtgList = energyService.utilCtgList();
		logger.info("공과금 분류목록 uCtgList.size={}",uCtgList.size());
		
		model.addAttribute("DongHo",DongHo);
		model.addAttribute("labelList",labelList);
		model.addAttribute("dataList",dataList);
		
		model.addAttribute("electList",electList);
		model.addAttribute("electAvgMap",electAvgMap);
		model.addAttribute("uCtgList",uCtgList);
	}

//	@RequestMapping("/waterChart.do")
//	public List<Map<String, Object>> ElectList() {
//		
//	}
//	
	
}
