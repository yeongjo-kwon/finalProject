package com.it.apt.mngcost.model;

public class MngcostSubCtgVO {
	private int mngcostSCtgNo;
	private String mngcostSCtgName;
	private int mngcostMCtgNo;
	
	public int getMngcostSCtgNo() {
		return mngcostSCtgNo;
	}
	public void setMngcostSCtgNo(int mngcostSCtgNo) {
		this.mngcostSCtgNo = mngcostSCtgNo;
	}
	public String getMngcostSCtgName() {
		return mngcostSCtgName;
	}
	public void setMngcostSCtgName(String mngcostSCtgName) {
		this.mngcostSCtgName = mngcostSCtgName;
	}
	public int getMngcostMCtgNo() {
		return mngcostMCtgNo;
	}
	public void setMngcostMCtgNo(int mngcostMCtgNo) {
		this.mngcostMCtgNo = mngcostMCtgNo;
	}
	
	@Override
	public String toString() {
		return "MngcostSubCtgVO [mngcostSCtgNo=" + mngcostSCtgNo + ", mngcostSCtgName=" + mngcostSCtgName
				+ ", mngcostMCtgNo=" + mngcostMCtgNo + "]";
	}
}
