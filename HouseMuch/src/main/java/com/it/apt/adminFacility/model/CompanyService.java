package com.it.apt.adminFacility.model;

import java.util.List;

public interface CompanyService {
	List<CompanyCtgVO> allCompanyCtg();
	int insertContract(CompanyVO vo);
	List<CompanyVO> allContract(int aptNo);
	int totalRecord(int aptNo);
	CompanyVO contractByNo(int contractNo);
}
