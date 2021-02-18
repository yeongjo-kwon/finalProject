package com.it.apt.adminFacility.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

	@Override
	@Transactional
	public int updateContract(CompanyVO vo) {
		int cnt=companyDao.updateCompany(vo);
		cnt=companyDao.updateContract(vo);
		return cnt;
	}

	@Override
	public int deleteContract(int contractNo) {
		return companyDao.deleteContract(contractNo);
	}

	@Override
	public int insertAddCost(AddCostVO aVo) {
		return companyDao.insertAddCost(aVo);
	}

	@Override
	public int updateAddCost(AddCostVO aVo) {
		return companyDao.updateAddCost(aVo);
	}

	@Override
	public int deleteAddCost(Map<String, Object> map) {
		return companyDao.deleteAddCost(map);
	}

	@Override
	@Transactional
	public int payCost(List<AddCostVO> addCostList) {
		int cnt=0;
		try {
			for(AddCostVO aVo : addCostList) {
				cnt=companyDao.payCost(aVo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> listAddCost(Map<String, Object> map) {
		return companyDao.listAddCost(map);
	}

	@Override
	public AddCostVO selectByCostNo(int costNo) {
		return companyDao.selectByCostNo(costNo);
	}

	
}
