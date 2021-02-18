package com.it.apt.adminLiving.car.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAOMybatis implements CarDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.car.";
	
	@Override
	public int insertCar(CarVO vo) {
		return sqlSession.insert(namespace+"insertCar", vo);
	}

	@Override
	public List<CarVO> carListByCode(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"carListByCode", map);
	}

	@Override
	public List<Map<String, Object>> aptCarList(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"aptCarList", map);
	}

	@Override
	public List<Map<String, Object>> chartByAptNo(int aptNo) {
		return sqlSession.selectList(namespace+"chartByAptNo", aptNo);
	}
	
	
}
