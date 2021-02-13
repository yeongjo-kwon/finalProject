package com.it.apt.household.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class HouseholdServiceImpl implements HouseholdService{
	@Autowired HouseholdDAO householdDao;

	@Override
	public String selectCodeOwner(int aptNo) {
		return householdDao.selectCodeOwner(aptNo);
	}

	@Override
	@Transactional
	public int insertCode(List<HouseholdVO> hVoList) {
		int cnt=0;
		try {
			for(HouseholdVO hVo : hVoList) {
				cnt=householdDao.insertCode(hVo);
			}
		}catch(RuntimeException e) {
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public String findHouseholdCode(HouseholdVO vo) {
		return householdDao.findHouseholdCode(vo);
	}

	@Override
	@Transactional
	public int insertHouseholdMember(List<HouseholdMemVo> hMemList) {
		int cnt=0;
		try {
			for(HouseholdMemVo hmVo : hMemList) {
				cnt=householdDao.insertHouseholdMember(hmVo);
			}
		}catch(RuntimeException e) {
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int updateAdmin(HouseholdVO vo) {
		return householdDao.updateAdmin(vo);
	}

	@Override
	public int deleteAdmin(String householdCode) {
		return householdDao.deleteAdmin(householdCode);
	}

	@Override
	public HouseholdVO selectByCode(String householdCode) {
		return householdDao.selectByCode(householdCode);
	}

}
