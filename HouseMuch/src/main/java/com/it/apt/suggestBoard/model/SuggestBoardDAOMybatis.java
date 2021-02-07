package com.it.apt.suggestBoard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.common.SearchVO;

@Repository
public class SuggestBoardDAOMybatis implements SuggestBoardDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.suggestBoard.";
	
	@Override
	public int insertSuggestBoard(SuggestBoardVO vo) {
		return sqlSession.insert(namespace+"insertSuggestBoard",vo);
	}

	@Override
	public List<SuggestCategoryVO> selectBySuggestCategory() {
		return sqlSession.selectList(namespace+"selectBySuggestCategory");
	}

	@Override
	public List<Map<String, Object>> selectAllSuggestBoardView(SearchVO vo) {
		return sqlSession.selectList(namespace+"selectAllSuggestBoardView",vo);
	}

	@Override
	public Map<String, Object> selectByNoSuggestBoard(int suggBoardNo) {
		return sqlSession.selectOne(namespace+"selectByNoSuggestBoard",suggBoardNo);
	}

	@Override
	public int updateSuggestBoard(SuggestBoardVO vo) {
		return sqlSession.update(namespace+"updateSuggestBoard",vo);
	}

	@Override
	public int selectTotalRecordFromSuggestBoard(SearchVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordFromSuggestBoard",vo);
	}

	@Override
	public int insertAnswer(SuggestAnswerVO vo) {
		return sqlSession.insert(namespace+"insertAnswer",vo);
	}

	@Override
	public Map<String, Object> selectByNoAnswer(int suggBoardNo) {
		return sqlSession.selectOne(namespace+"selectByNoAnswer",suggBoardNo);
	}

	@Override
	public int updateAnswer(SuggestAnswerVO vo) {
		return sqlSession.update(namespace+"updateAnswer",vo);
	}

	@Override
	public int deleteAnswer(int answNo) {
		return sqlSession.delete(namespace+"deleteAnswer",answNo);
	}

	@Override
	public Map<String, Object> searchAuthCode(int memberNo) {
		return sqlSession.selectOne(namespace+"searchAuthCode",memberNo);
	}

	@Override
	public int deleteSuggestBoard(int suggBoardNo) {
		return sqlSession.delete(namespace+"deleteSuggestBoard",suggBoardNo);
	}


	

	
}
