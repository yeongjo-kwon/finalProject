package com.it.apt.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNo;
	private String householdCode;
	private String memberImgFilename;
	private String memberImgOriginalFilename;
	private String id;
	private String pwd;
	private String memberName;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private Timestamp outdate;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public String getMemberImgFilename() {
		return memberImgFilename;
	}
	public void setMemberImgFilename(String memberImgFilename) {
		this.memberImgFilename = memberImgFilename;
	}
	public String getMemberImgOriginalFilename() {
		return memberImgOriginalFilename;
	}
	public void setMemberImgOriginalFilename(String memberImgOriginalFilename) {
		this.memberImgOriginalFilename = memberImgOriginalFilename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public Timestamp getOutdate() {
		return outdate;
	}
	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", householdCode=" + householdCode + ", memberImgFilename="
				+ memberImgFilename + ", memberImgOriginalFilename=" + memberImgOriginalFilename + ", id=" + id
				+ ", pwd=" + pwd + ", memberName=" + memberName + ", email=" + email + ", hp1=" + hp1 + ", hp2=" + hp2
				+ ", hp3=" + hp3 + ", outdate=" + outdate + "]";
	}

}
