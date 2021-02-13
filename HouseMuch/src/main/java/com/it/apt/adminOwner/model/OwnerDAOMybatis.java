package com.it.apt.adminOwner.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.household.model.HouseholdMemVo;
import com.it.apt.household.model.HouseholdVO;

@Repository
public class OwnerDAOMybatis implements OwnerDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.owner.";
	
	@Override
	public List<AuthorityVO> selectAdminAuth() {
		return sqlSession.selectList(namespace+"selectAdminAuth");
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

	@Override
	public int delAllResInfo(int aptNo) {
		return sqlSession.delete(namespace+"delAllResInfo", aptNo);
	}

	@Override
	public List<String> selectHo(HouseholdVO vo) {
		return sqlSession.selectList(namespace+"selectHo", vo);
	}

	@Override
	public List<AdminAllVO> selectAdminLv2(int aptNo) {
		return sqlSession.selectList(namespace+"selectAdminLv2", aptNo);
	}


	
}
