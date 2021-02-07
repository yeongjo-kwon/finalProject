package com.it.apt.apart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.common.SearchVO;

@Repository
public class ApartDAOMybatis implements ApartDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.apart.";

	@Override
	public String selectAptNameById(String id) {
		return sqlSession.selectOne(namespace+"selectAptNameById",id);
	}

	@Override
	public List<Map<String, Object>> selectAllApt(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllApt", searchVo);
	}

	@Override
	public int selectAptTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectAptTotalRecord", searchVo);
	}

	@Override
	public int insertApt(ApartVO vo) {
		return sqlSession.insert(namespace+"insertApt", vo);
	}

	@Override
	public ApartVO selectAptByAptNo(int aptNo) {
		return sqlSession.selectOne(namespace+"selectAptByAptNo", aptNo);
	}

	@Override
	public int deleteApt(int aptNo) {
		return sqlSession.delete(namespace+"deleteApt",aptNo);
	}

	@Override
	public int updateApt(ApartVO apartVo) {
		return sqlSession.update(namespace+"updateApt", apartVo);
	}

	@Override
	public List<ApartExcelVO> excelApt() {
		return sqlSession.selectList(namespace+"excelApt");
	}

}
