package com.it.apt.adminFacility.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired CompanyDAO companyDao;

	@Override
	public List<CompanyCtgVO> allCompanyCtg() {
		return companyDao.allCompanyCtg();
	}

	@Override
	@Transactional
	public int insertContract(CompanyVO vo) {
		int cnt=companyDao.insertCompanyInfo(vo);
		cnt=companyDao.insertContract(vo);
		return cnt;
		
	}

	@Override
	public List<CompanyVO> allContract(int aptNo) {
		return companyDao.allContract(aptNo);
	}

	@Override
	public int totalRecord(int aptNo) {
		return companyDao.totalRecord(aptNo);
	}

	@Override
	public CompanyVO contractByNo(int contractNo) {
		return companyDao.contractByNo(contractNo);
	}
	
}
