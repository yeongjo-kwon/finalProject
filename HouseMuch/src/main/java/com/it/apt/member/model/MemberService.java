package com.it.apt.member.model;

public interface MemberService {
	//로그인 처리시 사용
	int LOGIN_OK=1; //로그인 성공
	int ID_NONE=2; //아이디가 없는 경우
	int PWD_DISAGREE=3; //비밀번호 불일치
	
	//아이디 혹은 이메일 중복확인시 사용
	public static final int EXIST_ID=1;  //이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우
	
	int loginCheck(String id, String pwd);
	MemberVO selectMember(String id);
	int selectAptNo(String id);
	String selectAuth(String id);
	int chkCodeKey(String householdCode);
	int checkDup(String id);
	int checkDupEmail(String email);
	int insertMember(MemberVO vo);
	String findId(MemberVO vo);
	int updatePwd(MemberVO vo);
	int updateMember(MemberVO vo);
	int withdrawMember(String id);
}
