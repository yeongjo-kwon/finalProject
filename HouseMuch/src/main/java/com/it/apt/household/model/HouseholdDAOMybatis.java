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

}
