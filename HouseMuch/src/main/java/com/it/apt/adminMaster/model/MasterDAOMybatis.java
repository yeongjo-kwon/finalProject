package com.it.apt.adminMaster.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.common.SearchVO;

@Repository
public class MasterDAOMybatis implements MasterDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.master.";

	@Override
	public int insertMsg(ApartmentToSuperVO msgVo) {
		return sqlSession.insert(namespace+"insertMsg", msgVo);
	}

	@Override
	public List<ApartmentToSuperVO> selectAllMsg(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllMsg", searchVo);
	}

	@Override
	public ApartmentToSuperVO selectMsgByIdx(int idx) {
		return sqlSession.selectOne(namespace+"selectMsgByIdx",idx);
	}

	@Override
	public int readMsgFlag(int idx) {
		return sqlSession.update(namespace+"readMsgFlag", idx);
	}

	@Override
	public int deleteMsg(int idx) {
		return sqlSession.delete(namespace+"deleteMsg", idx);
	}

	@Override
	public int countMsg() {
		return sqlSession.selectOne(namespace+"countMsg");
	}

	@Override
	public List<ApartmentToSuperVO> selectNoReadMsg() {
		return sqlSession.selectList(namespace+"selectNoReadMsg");
	}

	@Override
	public int selectTotalRecord() {
		return sqlSession.selectOne(namespace+"selectTotalRecord");
	}

	
}
