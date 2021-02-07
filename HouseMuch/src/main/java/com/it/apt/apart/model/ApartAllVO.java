package com.it.apt.apart.model;

import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberVO;

public class ApartAllVO {
	private ApartVO apartVo;
	private MemberVO memberVo;
	private HouseholdVO householdVo;
	
	public ApartVO getApartVo() {
		return apartVo;
	}
	public void setApartVo(ApartVO apartVo) {
		this.apartVo = apartVo;
	}
	public MemberVO getMemberVo() {
		return memberVo;
	}
	public void setMemberVo(MemberVO memberVo) {
		this.memberVo = memberVo;
	}
	public HouseholdVO getHouseholdVo() {
		return householdVo;
	}
	public void setHouseholdVo(HouseholdVO householdVo) {
		this.householdVo = householdVo;
	}
	
	@Override
	public String toString() {
		return "ApartAllVO [apartVo=" + apartVo + ", memberVo=" + memberVo + ", householdVo=" + householdVo + "]";
	}
}
