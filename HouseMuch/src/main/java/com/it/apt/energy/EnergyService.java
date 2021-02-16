package com.it.apt.energy;

import java.util.List;
import java.util.Map;

public interface EnergyService {
	
	//분류목록가져오기
	List<Map<String, Object>> utilCtgList();
	
	//최근 1년 전기 데이터, 평균
	List<Map<String, Object>> electListByHouseholdeCode(String householdCode);
	Map<String, Object> electAvgByHouseholdeCode(String householdCode);

	//최근1년 가스, 수도 
	List<Map<String, Object>> utilityCostList(UtilityCostInfoVO vo);		
	Map<String, Object> utilityCostAvg(UtilityCostInfoVO vo);		
}
