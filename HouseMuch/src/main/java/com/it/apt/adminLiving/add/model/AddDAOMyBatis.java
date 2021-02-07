package com.it.apt.adminLiving.add.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddDAOMyBatis implements AddDAO{
	@Autowired private SqlSession sqlSession;
	private String namespace="config.mybatis.mapper.oracle.addFacilityInfo.";
	
	
	@Override
	public List<AddCategoryVO> selectAddCategory() {
		return sqlSession.selectList(namespace+"selectAddCategory");
	}
	@Override
	public List<AddFacilityInfoVO> selectAllAddFacility(AddFacilityInfoVO vo) {
		return sqlSession.selectList(namespace+"selectAllAddFacility",vo);
	}
	@Override
	public int selectTotalRecord(AddFacilityInfoVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",vo);
	}
	@Override
	public int insertAddInfo(AddFacilityInfoVO vo) {
		return sqlSession.insert(namespace+"insertAddInfo",vo);
	}
	
	
	
}
