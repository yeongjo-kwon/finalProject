package com.it.apt.adminAll.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.common.SearchVO;

@Repository
public class BoardCtgDAOMybatis implements BoardCtgDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.boardCtg.";

	@Override
	public int insertBoardCtg(BoardCtgVO vo) {
		return sqlSession.insert(namespace+"insertBoardCtg",vo);
	}
	
	@Override
	public List<BoardCtgVO> selectAllBoardCtg(SearchVO vo) {
		return sqlSession.selectList(namespace+"selectAllBoardCtg",vo);
	}
	
	@Override
	public int updateBoardCtg(int boardCtgNo) {
		return sqlSession.update(namespace+"updateBoardCtg",boardCtgNo);
	}
	
	@Override
	public int deleteBoardCtg(int boardCtgNo) {
		return sqlSession.delete(namespace+"boardCtgNo");
	}
	
	@Override
	public int selectTotalRecordFromBoardCategory(SearchVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordFromBoardCategory",vo);
	}
	
	@Override
	public List<BoardCtgVO> selectAllCtg() {
		return sqlSession.selectList(namespace+"selectAllCtg");
	}
	
	
}
