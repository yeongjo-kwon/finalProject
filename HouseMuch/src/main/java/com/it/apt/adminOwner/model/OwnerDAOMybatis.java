package com.it.apt.adminOwner.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerDAOMybatis implements OwnerDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.owner.";
	
	@Override
	public List<AuthorityVO> selectAllAuth() {
		return sqlSession.selectList(namespace+"selectAllAuth");
	}

	@Override
	public List<ResidentVO> showResidentByid(String id) {
		return sqlSession.selectList(namespace+"showResidentByid",id);
	}

	@Override
	public int insertExcelCode(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertExcelCode", map);
	}

	@Override
	public int insertExcelCodeMem(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertExcelCodeMem", map);
	}
	
}
