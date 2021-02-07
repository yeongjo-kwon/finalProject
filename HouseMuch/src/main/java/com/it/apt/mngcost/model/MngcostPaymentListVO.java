package com.it.apt.mngcost.model;

import java.sql.Timestamp;

public class MngcostPaymentListVO {
	private int mngcostListNo;
	private String householdCode;
	private int mngcostTotalPrice;
	private Timestamp mngcostClaimdate;
	private String mngcostLimitdate;
	private Timestamp mngcostPaydate;
	
	public int getMngcostListNo() {
		return mngcostListNo;
	}
	public void setMngcostListNo(int mngcostListNo) {
		this.mngcostListNo = mngcostListNo;
	}
	public String getHouseholdCode() {
		return householdCode;
	}
	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}
	public int getMngcostTotalPrice() {
		return mngcostTotalPrice;
	}
	public void setMngcostTotalPrice(int mngcostTotalPrice) {
		this.mngcostTotalPrice = mngcostTotalPrice;
	}
	public Timestamp getMngcostClaimdate() {
		return mngcostClaimdate;
	}
	public void setMngcostClaimdate(Timestamp mngcostClaimdate) {
		this.mngcostClaimdate = mngcostClaimdate;
	}
	public String getMngcostLimitdate() {
		return mngcostLimitdate;
	}
	public void setMngcostLimitdate(String mngcostLimitdate) {
		this.mngcostLimitdate = mngcostLimitdate;
	}
	public Timestamp getMngcostPaydate() {
		return mngcostPaydate;
	}
	public void setMngcostPaydate(Timestamp mngcostPaydate) {
		this.mngcostPaydate = mngcostPaydate;
	}
	
	@Override
	public String toString() {
		return "MngcostPaymentListVO [mngcostListNo=" + mngcostListNo + ", householdCode=" + householdCode
				+ ", mngcostTotalPrice=" + mngcostTotalPrice + ", mngcostClaimdate=" + mngcostClaimdate
				+ ", mngcostLimitdate=" + mngcostLimitdate + ", mngcostPaydate=" + mngcostPaydate + "]";
	}
}
