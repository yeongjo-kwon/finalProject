package com.it.apt.adminLiving.car.model;

import java.util.Date;

public class CarVO {
	private int carRegNo;
	private String householdCode;
	private String note;
	private String carNumber;
	private String orderdate;
	private String regdate;
	private String isVisitor;
	
	public int getCarRegNo() {
		return carRegNo;
	}
	public void setCarRegNo(int carRegNo) {
		this.carRegNo = carRegNo;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getIsVisitor() {
		return isVisitor;
	}
	public void setIsVisitor(String isVisitor) {
		this.isVisitor = isVisitor;
	}
	@Override
	public String toString() {
		return "CarVO [carRegNo=" + carRegNo + ", householdCode=" + householdCode + ", note=" + note + ", carNumber="
				+ carNumber + ", orderdate=" + orderdate + ", regdate=" + regdate + ", isVisitor=" + isVisitor + "]";
	}
	
}
