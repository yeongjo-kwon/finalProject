package com.it.apt.userBoard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.common.SearchVO;

@Repository
public class UserBoardDAOMybatis implements UserBoardDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.userBoard.";
	
	@Override
	public int insertUserBoard(UserBoardVO vo) {
		return sqlSession.insert(namespace+"insertUserBoard",vo);
	}

	@Override
	public List<Map<String, Object>> selectAllUserBoardView(SearchVO vo) {
		return sqlSession.selectList(namespace+"selectAllUserBoardView",vo);
	}

	@Override
	public int selectTotalRecordFromUserBoard(SearchVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordFromUserBoard",vo);
	}

	@Override
	public Map<String, Object> selectByNoUserBoard(int boardNo) {
		return sqlSession.selectOne(namespace+"selectByNoUserBoard", boardNo);
	}

	@Override
	public int insertAnswer(boardCommentVO vo) {
		return sqlSession.insert(namespace+"insertAnswer",vo);
	}

	@Override
	public List<Map<String, Object>> selectByNoComment(int boardNo) {
		return sqlSession.selectList(namespace+"selectByNoComment",boardNo);
	}

	@Override
	public int updateComment(boardCommentVO vo) {
		return sqlSession.update(namespace+"updateComment",vo);
	}

	@Override
	public int deleteComment(int commNo) {
		return sqlSession.delete(namespace+"deleteComment",commNo);
	}

	@Override
	public int deleteUserBoard(int boardNo) {
		return sqlSession.delete(namespace+"deleteUserBoard",boardNo);
	}

	@Override
	public int updateBoardReadcount(int boardNo) {
		return sqlSession.update(namespace+"updateBoardReadcount",boardNo);
	}

	@Override
	public int userBoardFileUpload(UserBoardVO vo) {
		return sqlSession.insert(namespace+"userBoardFileUpload",vo);
	}

	
}
