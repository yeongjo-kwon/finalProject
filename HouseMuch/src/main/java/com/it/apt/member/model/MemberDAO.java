package com.it.apt.member.model;

public interface MemberDAO {
	String selectPwd(String id);
	MemberVO selectMember(String id);
	int selectAptNo(String id);
	String selectAuth(String id);
	int chkCodeKey(String householdCode);
	int checkDup(String id);
	int checkDupEmail(String email);
	int insertMember(MemberVO vo);
	String findId(MemberVO vo);
	int updatePwd(MemberVO vo);
}
