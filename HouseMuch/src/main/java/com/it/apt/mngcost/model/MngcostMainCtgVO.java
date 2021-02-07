package com.it.apt.mngcost.model;

public class MngcostMainCtgVO {
	private int mngcostMCtgNo;
	private String mngcostMCtgName;
	
	public int getMngcostMCtgNo() {
		return mngcostMCtgNo;
	}
	public void setMngcostMCtgNo(int mngcostMCtgNo) {
		this.mngcostMCtgNo = mngcostMCtgNo;
	}
	public String getMngcostMCtgName() {
		return mngcostMCtgName;
	}
	public void setMngcostMCtgName(String mngcostMCtgName) {
		this.mngcostMCtgName = mngcostMCtgName;
	}
	
	@Override
	public String toString() {
		return "MngcostMainCtgVO [mngcostMCtgNo=" + mngcostMCtgNo + ", mngcostMCtgName=" + mngcostMCtgName + "]";
	}
}
