package com.it.apt.household.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HouseholdDAOMybatis implements HouseholdDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.household.";
	
	@Override
	public String selectCodeOwner(int aptNo) {
		return sqlSession.selectOne(namespace+"selectCodeOwner", aptNo);
	}

	@Override
	public int insertCode(HouseholdVO vo) {
		return sqlSession.insert(namespace+"insertCode", vo);
	}

	@Override
	public String findHouseholdCode(HouseholdVO vo) {
		return sqlSession.selectOne(namespace+"findHouseholdCode", vo);
	}

	@Override
	public int insertHouseholdMember(HouseholdMemVo vo) {
		return sqlSession.insert(namespace+"insertHouseholdMember", vo);
	}

	@Override
	public int updateAdmin(HouseholdVO vo) {
		return sqlSession.update(namespace+"updateAdmin", vo);
	}

	@Override
	public int deleteAdmin(String householdCode) {
		return sqlSession.delete(namespace+"deleteAdmin", householdCode);
	}

	@Override
	public HouseholdVO selectByCode(String householdCode) {
		return sqlSession.selectOne(namespace+"selectByCode", householdCode);
	}

}
