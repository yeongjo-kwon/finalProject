package com.it.apt.adminLiving.add.model;

import java.sql.Timestamp;

import com.it.apt.member.model.MemberVO;

public class AddOrderVO extends MemberVO{ //신청자 번호/세대코드로 신청자 이름, 이메일 불러오기 
	//부가시설 신청 정보 관련필드
	private int addOrderListNo;
	private int addNo;
	private String householdeCode;
	private Timestamp addOrderdate;
	private Timestamp addOutdate;
	private int memberNo;
	public int getAddOrderListNo() {
		return addOrderListNo;
	}
	public void setAddOrderListNo(int addOrderListNo) {
		this.addOrderListNo = addOrderListNo;
	}
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public String getHouseholdeCode() {
		return householdeCode;
	}
	public void setHouseholdeCode(String householdeCode) {
		this.householdeCode = householdeCode;
	}
	public Timestamp getAddOrderdate() {
		return addOrderdate;
	}
	public void setAddOrderdate(Timestamp addOrderdate) {
		this.addOrderdate = addOrderdate;
	}
	public Timestamp getAddOutdate() {
		return addOutdate;
	}
	public void setAddOutdate(Timestamp addOutdate) {
		this.addOutdate = addOutdate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "AddOrderVO [ ::신청건:: addOrderListNo=" + addOrderListNo + ", addNo=" + addNo + ", householdeCode="
				+ householdeCode + ", addOrderdate=" + addOrderdate + ", addOutdate=" + addOutdate 
				+ ",::신청자 정보:: memberNo="	+ memberNo + ", getMemberName()=" + getMemberName() + ", getEmail()=" + getEmail() + "]";
	}




}
