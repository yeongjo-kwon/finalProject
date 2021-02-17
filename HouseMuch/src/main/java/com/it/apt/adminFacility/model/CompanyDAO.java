package com.it.apt.adminFacility.model;

import java.util.List;

public interface CompanyDAO {
	List<CompanyCtgVO> allCompanyCtg();
	int insertCompanyInfo(CompanyVO vo);
	int insertContract(CompanyVO vo);
	List<CompanyVO> allContract(int aptNo);
	int totalRecord(int aptNo);
	CompanyVO contractByNo(int contractNo);
}
