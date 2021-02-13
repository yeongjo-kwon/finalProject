package com.it.apt.adminLiving.add.model;

import java.sql.Timestamp;

public class AddOrderExcelVO{

	private int addOrderListNo;		//신청번호
	private String addName;			//시설명
	private int addNo;				//시설번호
	private Timestamp addOrderdate;	//신청일
	private int addPrice;			//월 이용료
	private int addChargeCnt;		//시설별 이용요금납부횟수
	private String householdCode;	// 신청자 : 세대코드 
	private int memberNo;			// 신청자 : 회원번호
	private String id;				// 신청자 : 회원아이디
	private Timestamp addOutdate;	//해지일
	
	
	public int getAddOrderListNo() {
		return addOrderListNo;
	}
	public void setAddOrderListNo(int addOrderListNo) {
		this.addOrderListNo = addOrderListNo;
	}
	public String getAddName() {
		return addName;
	}
	public void setAddName(String addName) {
		this.addName = addName;
	}
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public Timestamp getAddOrderdate() {
		return addOrderdate;
	}
	public void setAddOrderdate(Timestamp addOrderdate) {
		this.addOrderdate = addOrderdate;
	}
	public int getAddPrice() {
		return addPrice;
	}
	public void setAddPrice(int addPrice) {
		this.addPrice = addPrice;
	}
	public int getAddChargeCnt() {
		return addChargeCnt;
	}
	public void setAddChargeCnt(int addChargeCnt) {
		this.addChargeCnt = addChargeCnt;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getAddOutdate() {
		return addOutdate;
	}
	public void setAddOutdate(Timestamp addOutdate) {
		this.addOutdate = addOutdate;
	}
	@Override
	public String toString() {
		return "AddOrderExcelVO [addOrderListNo=" + addOrderListNo + ", addName=" + addName + ", addNo=" + addNo
				+ ", addOrderdate=" + addOrderdate + ", addPrice=" + addPrice + ", addChargeCnt=" + addChargeCnt
				+ ", householdCode=" + householdCode + ", memberNo=" + memberNo + ", id=" + id + ", addOutdate="
				+ addOutdate + "]";
	}

	
	
	
}
