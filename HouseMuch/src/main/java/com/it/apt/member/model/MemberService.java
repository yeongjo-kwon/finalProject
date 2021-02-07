package com.it.apt.member.model;

public interface MemberService {
	//로그인 처리시 사용
	int LOGIN_OK=1; //로그인 성공
	int ID_NONE=2; //아이디가 없는 경우
	int PWD_DISAGREE=3; //비밀번호 불일치
	
	int loginCheck(String id, String pwd);
	MemberVO selectMember(String id);
	int selectAptNo(String id);
	String selectAuth(String id);
	int chkCodeKey(String householdCode);

}
