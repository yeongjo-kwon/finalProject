package com.it.apt.adminFacility.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAOMybatis implements CompanyDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.company.";
	
	@Override
	public List<CompanyCtgVO> allCompanyCtg() {
		return sqlSession.selectList(namespace+"allCompanyCtg");
	}

	@Override
	public int insertCompanyInfo(CompanyVO vo) {
		return sqlSession.insert(namespace+"insertCompanyInfo",vo);
	}

	@Override
	public int insertContract(CompanyVO vo) {
		return sqlSession.insert(namespace+"insertContract",vo);
	}

	@Override
	public List<CompanyVO> allContract(int aptNo) {
		return sqlSession.selectList(namespace+"allContract", aptNo);
	}

	@Override
	public int totalRecord(int aptNo) {
		return sqlSession.selectOne(namespace+"totalRecord", aptNo);
	}

	@Override
	public CompanyVO contractByNo(int contractNo) {
		return sqlSession.selectOne(namespace+"contractByNo", contractNo);
	}

	

}
