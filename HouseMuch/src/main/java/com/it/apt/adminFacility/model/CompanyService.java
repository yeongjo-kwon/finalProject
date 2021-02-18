package com.it.apt.adminFacility.model;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	List<CompanyCtgVO> allCompanyCtg();
	int insertContract(CompanyVO vo);
	List<CompanyVO> allContract(int aptNo);
	int totalRecord(int aptNo);
	CompanyVO contractByNo(int contractNo);
	int updateContract(CompanyVO vo);
	int deleteContract(int contractNo);
	//
	int insertAddCost(AddCostVO aVo);
	int updateAddCost(AddCostVO aVo);
	int deleteAddCost(Map<String, Object> map);
	int payCost(List<AddCostVO> addCostList);
	List<Map<String, Object>> listAddCost(Map<String, Object> map);
	AddCostVO selectByCostNo(int costNo);
}
