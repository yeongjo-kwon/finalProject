package com.it.apt.energy;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnergyDAOMyBatis implements EnergyDAO {
	
	@Autowired SqlSession sqlSession;
	private String namespace="config.mybatis.mapper.oracle.energy.";
	
	
	@Override
	public List<Map<String, Object>> utilCtgList() {
		return sqlSession.selectList(namespace+"utilCtgList");
	}
	
	
	@Override
	public List<Map<String, Object>> electListByHouseholdeCode(String householdCode) {
		return sqlSession.selectList(namespace+"electListByHouseholdeCode", householdCode); 
	}
	@Override
	public Map<String, Object> electAvgByHouseholdeCode(String householdCode) {
		return sqlSession.selectOne(namespace+"electAvgByHouseholdeCode", householdCode); 
	}
	
	@Override
	public List<Map<String, Object>> utilityCostList(UtilityCostInfoVO vo) {
		return sqlSession.selectList(namespace+"utilityCostList", vo); 
	}
	@Override
	public Map<String, Object> utilityCostAvg(UtilityCostInfoVO vo) {
		return sqlSession.selectOne(namespace+"utilityCostAvg", vo); 
	}

	
	
}
