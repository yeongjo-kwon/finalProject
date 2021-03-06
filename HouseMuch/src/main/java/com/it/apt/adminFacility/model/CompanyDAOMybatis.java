package com.it.apt.adminFacility.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updateCompany(CompanyVO vo) {
		return sqlSession.update(namespace+"updateCompany", vo);
	}

	@Override
	public int updateContract(CompanyVO vo) {
		return sqlSession.update(namespace+"updateContract", vo);
	}

	@Override
	public int deleteContract(int contractNo) {
		return sqlSession.delete(namespace+"deleteContract",contractNo);
	}

	@Override
	public int insertAddCost(AddCostVO aVo) {
		return sqlSession.insert(namespace+"insertAddCost", aVo);
	}

	@Override
	public int updateAddCost(AddCostVO aVo) {
		return sqlSession.update(namespace+"updateAddCost", aVo);
	}

	@Override
	public int deleteAddCost(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteAddCost", map);
	}

	@Override
	public int payCost(AddCostVO aVo) {
		return sqlSession.update(namespace+"payCost", aVo);
	}

	@Override
	public List<Map<String, Object>> listAddCost(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"listAddCost", map);
	}

	@Override
	public AddCostVO selectByCostNo(int costNo) {
		return sqlSession.selectOne(namespace+"selectByCostNo", costNo);
	}


}
