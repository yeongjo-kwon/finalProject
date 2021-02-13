package com.it.apt.energy;

import java.sql.Timestamp;

public class UtilityCostInfoVO {
	private int uCostNo;
	private int uCostAmount;
	private int uCostPrice;
	private String householdCode;
	private int uCtgNo;
	private Timestamp uCostUsedate;
	
	public int getuCostNo() {
		return uCostNo;
	}
	public void setuCostNo(int uCostNo) {
		this.uCostNo = uCostNo;
	}
	public int getuCostAmount() {
		return uCostAmount;
	}
	public void setuCostAmount(int uCostAmount) {
		this.uCostAmount = uCostAmount;
	}
	public int getuCostPrice() {
		return uCostPrice;
	}
	public void setuCostPrice(int uCostPrice) {
		this.uCostPrice = uCostPrice;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public int getuCtgNo() {
		return uCtgNo;
	}
	public void setuCtgNo(int uCtgNo) {
		this.uCtgNo = uCtgNo;
	}
	public Timestamp getuCostUsedate() {
		return uCostUsedate;
	}
	public void setuCostUsedate(Timestamp uCostUsedate) {
		this.uCostUsedate = uCostUsedate;
	}
	
	@Override
	public String toString() {
		return "UtilityCostInfoVO [uCostNo=" + uCostNo + ", uCostAmount=" + uCostAmount + ", uCostPrice=" + uCostPrice
				+ ", householdCode=" + householdCode + ", uCtgNo=" + uCtgNo + ", uCostUsedate=" + uCostUsedate + "]";
	}
}
