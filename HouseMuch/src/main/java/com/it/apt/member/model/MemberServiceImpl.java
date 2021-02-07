package com.it.apt.member.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired private MemberDAO memberDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Override
	public int loginCheck(String id, String pwd) {
		String dbPwd=memberDao.selectPwd(id);	//dbPwd
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {	
			if(passwordEncoder.matches(pwd,dbPwd)) { //사용자가 입력한 값 먼저, db의 pwd
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		
		return result;
	}

	@Override
	public MemberVO selectMember(String id) {
		return memberDao.selectMember(id);
	}

	@Override
	public int selectAptNo(String id) {
		return memberDao.selectAptNo(id);
	}

	@Override
	public String selectAuth(String id) {
		return memberDao.selectAuth(id);
	}

	@Override
	public int chkCodeKey(String householdCode) {
		return memberDao.chkCodeKey(householdCode);
	}

	@Override
	public int checkDup(String id) {
		int cnt = memberDao.checkDup(id);
		
		int res=0;
		if(cnt>0) {
			res=EXIST_ID;	//아이디가 이미 존재
		}else {
			res=NON_EXIST_ID;	//사용가능
		}
		
		return res;
	}

	@Override
	public int checkDupEmail(String email) {
		int cnt = memberDao.checkDupEmail(email);
		
		int res=0;
		if(cnt>0) {
			res=EXIST_ID;	//이메일 이미 존재
		}else {
			res=NON_EXIST_ID;	//사용가능
		}
		
		return res;
	}

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public String findId(MemberVO vo) {
		return memberDao.findId(vo);
	}

	@Override
	public int updatePwd(MemberVO vo) {
		return memberDao.updatePwd(vo);
	}
	
}
