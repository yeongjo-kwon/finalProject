package com.it.apt.adminFacility.model;

import java.util.List;
import java.util.Map;

public interface CompanyDAO {
	List<CompanyCtgVO> allCompanyCtg();
	int insertCompanyInfo(CompanyVO vo);
	int insertContract(CompanyVO vo);
	List<CompanyVO> allContract(int aptNo);
	int totalRecord(int aptNo);
	CompanyVO contractByNo(int contractNo);
	int updateCompany(CompanyVO vo);
	int updateContract(CompanyVO vo);
	int deleteContract(int contractNo);
	//
	int insertAddCost(AddCostVO aVo);
	int updateAddCost(AddCostVO aVo);
	int deleteAddCost(Map<String, Object> map);
	int payCost(AddCostVO aVo);
	List<Map<String, Object>> listAddCost(Map<String, Object> map);
	AddCostVO selectByCostNo(int costNo);
	
}
