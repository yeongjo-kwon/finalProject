package com.it.apt.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired private MemberDAO memberDao;
	
	//암호화 나중에 작업
	
	@Override
	public int loginCheck(String id, String pwd) {
		String dbPwd=memberDao.selectPwd(id);
		
		System.out.println("dbPwd="+dbPwd);
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
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
	
}
