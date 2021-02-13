package com.it.apt.adminLiving.add.model;

import java.sql.Timestamp;

import com.it.apt.member.model.MemberVO;

public class AddOrderVO extends MemberVO{ //신청자 번호/세대코드로 신청자 이름, 이메일 불러오기 
	//부가시설 신청 정보 관련필드
	private int addOrderListNo;
	private int addNo;
	private String addName;
	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	private Timestamp addOrderdate;
	private Timestamp addOutdate;
//	private String householdCode; -> 상속받아서 사용
//	private int memberNo; -> 상속받아서 사용
	
	//시설별 이용요금납부횟수
	private int addPrice;
	private int addChargeCnt;

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

	//이용료 납부횟수
	public int getAddChargeCnt() {
		return addChargeCnt;
	}

	public void setAddChargeCnt(int addChargeCnt) {
		this.addChargeCnt = addChargeCnt;
	}

	//월 이용료
	public int getAddPrice() {
		return addPrice;
	}
	
	public void setAddPrice(int addPrice) {
		this.addPrice = addPrice;
	}

	//toString - 회원이름, 아이디, 이메일 + 세대코드 + 회원번호 같이하기
	@Override
	public String toString() {
		return "AddOrderVO [addOrderListNo=" + addOrderListNo + ", addNo=" + addNo + ", addName=" + addName
				+ ", addOrderdate=" + addOrderdate + ", addOutdate=" + addOutdate + ", addPrice=" + addPrice
				+ ", addChargeCnt=" + addChargeCnt + ", getMemberNo()=" + getMemberNo() + ", getHouseholdCode()="
				+ getHouseholdCode() + ", getId()=" + getId() + ", getMemberName()=" + getMemberName() + ", getEmail()="
				+ getEmail() + ", getOutdate()=" + getOutdate() + "]";
	}




	
}
