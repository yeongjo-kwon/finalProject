package com.it.apt.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.member.";

	@Override
	public String selectPwd(String id) {
		return sqlSession.selectOne(namespace+"selectPwd",id);
	}

	@Override
	public MemberVO selectMember(String id) {
		return sqlSession.selectOne(namespace+"selectMember",id);
	}

	@Override
	public int selectAptNo(String id) {
		return sqlSession.selectOne(namespace+"selectAptNo", id);
	}

	@Override
	public String selectAuth(String id) {
		return sqlSession.selectOne(namespace+"selectAuth", id);
	}

	@Override
	public int chkCodeKey(String householdCode) {
		return sqlSession.selectOne(namespace+"chkCodeKey", householdCode);
	}

	@Override
	public int checkDup(String id) {
		return sqlSession.selectOne(namespace+"checkDup",id);
	}

	@Override
	public int checkDupEmail(String email) {
		return sqlSession.selectOne(namespace+"checkDupEmail", email);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert(namespace+"insertMember", vo);
	}

	@Override
	public String findId(MemberVO vo) {
		return sqlSession.selectOne(namespace+"findId", vo);
	}

	@Override
	public int updatePwd(MemberVO vo) {
		return sqlSession.update(namespace+"updatePwd", vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return sqlSession.update(namespace+"updateMember", vo);
	}

	@Override
	public int withdrawMember(String id) {
		return sqlSession.update(namespace+"withdrawMember",id);
	}

	
}
