package com.it.apt.energy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnergyServiceImpl implements EnergyService{
	
	@Autowired private EnergyDAO energyDao;

	@Override
	public List<Map<String, Object>> utilCtgList() {
		return energyDao.utilCtgList();
	}
	
	
	@Override
	public List<Map<String, Object>> electListByHouseholdeCode(String householdCode) {
		return energyDao.electListByHouseholdeCode(householdCode);
	}

	@Override
	public Map<String, Object> electAvgByHouseholdeCode(String householdCode) {
		return energyDao.electAvgByHouseholdeCode(householdCode);
	}

	@Override
	public List<Map<String, Object>> utilityCostList(UtilityCostInfoVO vo) {
		return energyDao.utilityCostList(vo);
	}

	@Override
	public Map<String, Object> utilityCostAvg(UtilityCostInfoVO vo) {
		return energyDao.utilityCostAvg(vo);
	}

	
	
}
