package com.it.apt.adminFacility.model;

public class CompanyCtgVO {
	private int mngCompCtgNo;
	private String mngCompCtgName;
	
	public int getMngCompCtgNo() {
		return mngCompCtgNo;
	}
	public void setMngCompCtgNo(int mngCompCtgNo) {
		this.mngCompCtgNo = mngCompCtgNo;
	}
	public String getMngCompCtgName() {
		return mngCompCtgName;
	}
	public void setMngCompCtgName(String mngCompCtgName) {
		this.mngCompCtgName = mngCompCtgName;
	}
	
	@Override
	public String toString() {
		return "CompanyCtgVO [mngCompCtgNo=" + mngCompCtgNo + ", mngCompCtgName=" + mngCompCtgName + "]";
	}

}
