package com.it.apt.energy;

import java.util.ArrayList;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
	private String energyChart(HttpSession session,Model model) {
		//http://localhost:9090/apt/energy/energyChart.do
		logger.info("에너지 차트  초기화면");
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		
		List<Map<String, Object>> electList = energyService.electListByHouseholdeCode(householdCode);
		logger.info("전기차트리스트 electList.size={}",electList.size());
		
		if(electList.size()==0 || electList.isEmpty()) {
			model.addAttribute("msg","공과금 내역이 없습니다. 관리실에 문의해주세요");
			model.addAttribute("url","/suggestBoard/suggestBoardList.do");
			return "common/message";
		}
		
		
		List<String> labelList = new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		
		String dong="",ho="";
		for (int i = 0; i <electList.size() ; i++) {
			String yyyymm = (String)electList.get(i).get("USE_MONTH"); 
			//2020-02월
			String[] ym = yyyymm.split("-");
			String labels = "\'"+ ym[0] +"-"+ ym[1] + "\'"; //labels
			labelList.add(labels);

			String data = String.valueOf(electList.get(i).get("U_COST_AMOUNT")); //data
			dataList.add(data);
			
			dong = (String) electList.get(i).get("DONG");
			ho = (String) electList.get(i).get("HO");
			
		}
		String DongHo = dong+"동 "+ho+"호";
		
		
		
		
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
		
		return "energy/energyChart";
	}


//	@ResponseBody
//	@RequestMapping("/utilCostChart.do")
//	public Map<String, Object> utilCostList(@ModelAttribute UtilityCostInfoVO vo) {
//		logger.info("공과금ajax 받아온 vo.getHouseholdCode()={},vo.getuCtgNo()={}",vo.getHouseholdCode(),vo.getuCtgNo());
//		logger.info("공과금ajax 받아온 vo={}",vo);
//		
//		List<Map<String, Object>> utilCostList = energyService.utilityCostList(vo);
//
//		List<String> labels=null; 
//		ArrayList<Integer> data=null; 
//		
//		for (int j = 0; j < utilCostList.size() ; j++) {
//			labels = (ArrayList<String>) utilCostList.get(j).get("USE_MONTH");
//			data = (ArrayList<Integer>) utilCostList.get(j).get("U_COST_AMOUNT");
//		}
//		
//		Map<String, Object> map = energyService.utilityCostAvg(vo); 
//		map.put("data", data);
//		map.put("labels", labels);
//		
//		
//		return map;
//	}
	

	
	@ResponseBody
	@RequestMapping("/utilCostChart.do")
	public List<Map<String, Object>> utilCostList(@ModelAttribute UtilityCostInfoVO vo) {
		logger.info("공과금ajax 받아온 vo.getHouseholdCode()={},vo.getuCtgNo()={}",vo.getHouseholdCode(),vo.getuCtgNo());
		logger.info("공과금ajax 받아온 vo={}",vo);
		
		List<Map<String, Object>> utilCostList = energyService.utilityCostList(vo);

		Map<String, Object> avgMap = energyService.utilityCostAvg(vo); 
		
		utilCostList.add(avgMap);
		
		return utilCostList;
	}
	
	
	
	
	//**********************************************************************************************
	@RequestMapping("/userDash/userEnergy.do")
	private String userDash_energyChart(HttpSession session,Model model) {
		//http://localhost:9090/apt/energy/energyChart.do
		logger.info("에너지 차트  초기화면");
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode();
		
		List<Map<String, Object>> electList = energyService.electListByHouseholdeCode(householdCode);
		logger.info("전기차트리스트 electList.size={}",electList.size());
		
		if(electList.size()==0 || electList.isEmpty()) {
			model.addAttribute("msg","공과금 내역이 없습니다. 관리실에 문의해주세요");
			model.addAttribute("url","/suggestBoard/suggestBoardList.do");
			return "common/message";
		}
		
		
		List<String> labelList = new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		
		String dong="",ho="";
		for (int i = 0; i <electList.size() ; i++) {
			String yyyymm = (String)electList.get(i).get("USE_MONTH"); 
			//2020-02월
			String[] ym = yyyymm.split("-");
			String labels = "\'"+ ym[0] +"-"+ ym[1] + "\'"; //labels
			labelList.add(labels);

			String data = String.valueOf(electList.get(i).get("U_COST_AMOUNT")); //data
			dataList.add(data);
			
			dong = (String) electList.get(i).get("DONG");
			ho = (String) electList.get(i).get("HO");
			
		}
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
		
		return "userDash/userEnergy";
	}

	
}
