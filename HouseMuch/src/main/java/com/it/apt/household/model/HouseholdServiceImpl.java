package com.it.apt.household.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseholdServiceImpl implements HouseholdService{
	@Autowired HouseholdDAO householdDao;

	@Override
	public String selectCodeOwner(int aptNo) {
		return householdDao.selectCodeOwner(aptNo);
	}

	@Override
	public int insertCode(HouseholdVO vo) {
		return householdDao.insertCode(vo);
	}
	
}
